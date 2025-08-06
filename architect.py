from  instructions import INSTRUCTIONS
import pandas as pd
import random


def architect():
    """Generate instruction for placing a single block"""
    
    # Get available spatial instructions from instructions.py
    spatial_terms = list(INSTRUCTIONS.keys())
    
    # Randomly select a spatial instruction
    chosen_instruction = random.choice(spatial_terms)
    
    # Return the instruction for single block placement
    return f"place block {chosen_instruction}"

# Additional helper functions for the communication experiment
class Agent:
    def __init__(self, agent_id):
        self.agent_id = agent_id
        self.vocabulary = {}  # spatial term -> success rate
        self.success_history = []
        
    def generate_instruction(self):
        """Generate instruction for single block placement"""
        all_words = []
        for term, synonyms in INSTRUCTIONS.items():
            all_words.extend(synonyms)
        
        # If we have experience, prefer successful instructions
        if self.vocabulary:
            # Calculating success reat by ech
            weights = []
            for word in all_words:
                if word in self.vocabulary:
                    success_rate = sum(self.vocabulary[word]) / len(self.vocabulary[word])
                    weights.append(success_rate)
                else:
                    weights.append(0.5) #Weights for unused words

            chosen_word = random.choices(all_words, weights=weights)[0]
        else:
            # If no experience, choose randomly
            chosen_word = random.choice(all_words)  
        return f"place block {chosen_word}"
    
    def interpret_instruction(self, instruction):
        """Interpret instruction and return block position (x, y)"""
        center = 1
        
        # Parse the spatial term from instruction
        for term, synonyms in INSTRUCTIONS.items():
            if any(synonym in instruction.lower() for synonym in synonyms):
                if term == 'left':
                    return (center - 1, 0)
                elif term == 'right':
                    return (center + 1, 0)
                elif term == 'center':
                    return (center, 0)
        
        # Default to center if no spatial term recognized
        return (center, 0)
    
    def learn_from_feedback(self, instruction, success: bool):  # INDENT THIS METHOD
        """Update vocabulary based on communication success"""
        # Extract any synonym from instruction
        for _, synonyms in INSTRUCTIONS.items():
            for synonym in synonyms:
                if synonym in instruction.lower():
                    if synonym not in self.vocabulary:
                        self.vocabulary[synonym] = []
                    self.vocabulary[synonym].append(success)
                    return
        self.success_history.append(success)

def run_single_block_experiment(num_rounds: int = 
                                25
                                #100
                                #1000
                                ):
    """Run communication experiment with single block placement"""
    
    architect_agent = Agent("architect")
    builder_agent = Agent("builder")
    
    results = []
    
    print("Starting single block communication experiment...")
    print("=" * 51)
    
    for round_num in range(num_rounds):
        # Architect decides on target position
        target_x, target_y = random.randint(0, 2), random.randint(0, 0)  # 3x1 grid
        
        # Architect generates instruction
        instruction = architect_agent.generate_instruction()
        
        # Builder interprets instruction
        built_x, built_y = builder_agent.interpret_instruction(instruction)
        
        # Check if communication was successful
        success = (target_x == built_x) and (target_y == built_y)
        
        # Both agents learn from outcome
        architect_agent.learn_from_feedback(instruction, success)
        builder_agent.learn_from_feedback(instruction, success)
        
        results.append(success)
        
        print(f"Round {round_num + 1}:")
        print(f"  Target position: ({target_x}, {target_y})")
        print(f"  Instruction: '{instruction}'")
        print(f"  Built position: ({built_x}, {built_y})")
        print(f"  Success: {success}")
        print()
    
    success_rate = sum(results) / len(results)
    print(f"Overall success rate: {success_rate:.2%}")
    
    return results

run_single_block_experiment()

data = pd.DataFrame(run_single_block_experiment()) #25
data_2 = pd.DataFrame(run_single_block_experiment()) #100
data_3 = pd.DataFrame(run_single_block_experiment()) #1000
data.to_csv('experiment_results.csv', index=False)
