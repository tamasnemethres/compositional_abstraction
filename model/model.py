from  instructions import INSTRUCTIONS
import pandas as pd
import random




# Additional helper functions for the communication experiment
class Agent:
    def __init__(self, agent_id):
        self.agent_id = agent_id
        self.vocabulary = {}
        self.prior_alpha = 1  # Same priors for both
        self.prior_beta = 1   # Same priors for both

        
    def generate_instruction(self, target_category=None):
        """Generate instruction for single block placement"""
        # Assumes a valid key is always passed
        synonyms = INSTRUCTIONS[target_category]

        if self.vocabulary:
            best_word = None
            best_prob = 0.0
            for synonym in synonyms:
                if synonym in self.vocabulary:
                    alpha = self.vocabulary[synonym]['alpha']
                    beta = self.vocabulary[synonym]['beta']
                    prob = alpha / (alpha + beta)
                    if prob > best_prob:
                        best_prob = prob
                        best_word = synonym
            chosen_word = best_word if best_word else random.choice(synonyms)
        else:
            chosen_word = random.choice(synonyms)

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

    
    def learn_from_feedback(self, instruction, success: bool):  # INDENT THIS METHOD
        """Bayesian update using existing alpha/beta priors"""
        # Extract any synonym from instruction
        for _, synonyms in INSTRUCTIONS.items():
            for synonym in synonyms:
                if synonym in instruction:
                    if synonym not in self.vocabulary:
                        self.vocabulary[synonym] = {
                            'alpha': self.prior_alpha,  # Use existing prior!
                            'beta': self.prior_beta     # Use existing prior!
                        }
                    if success:
                        self.vocabulary[synonym]['alpha'] += 1
                    else:
                        self.vocabulary[synonym]['beta'] += 1

                    # Bayesian logic print
                    alpha = self.vocabulary[synonym]['alpha']
                    beta = self.vocabulary[synonym]['beta']
                    posterior = alpha / (alpha + beta)
                    print(f"  {self.agent_id} learned '{synonym}': α={alpha}, β={beta}, P(success)={posterior:.3f}")
                    return 
        



def run_single_block_experiment(seed = 42, trials: int = 25):
    """Run communication experiment with single block placement"""
    random.seed(seed)
    architect_agent = Agent("architect")
    builder_agent = Agent("builder")
    
    results = []
    
    print("Starting single block communication experiment...")
    print("=" * 51)
    print("=" * 51)
    
    for round_num in range(trials):
        # Architect decides on target position
        target_x, target_y = random.randint(0, 2), 0 #  random target position for x (0, 1, 2);  and a determined 0 for  y. 

        # Architect always correct --> since they know the target
        if target_x == 0: # Left
            instruction = architect_agent.generate_instruction('left')
        elif target_x == 1:  # Center
            instruction = architect_agent.generate_instruction('center')
        else:  # Right 
            instruction = architect_agent.generate_instruction('right')

        # Builder interprets instruction (with possible errors) Number was determined based on rule of thumb, can be changed. 
        builder_made_error = random.random() < 0.2  # 20% chance of misinterpretation

        if builder_made_error:
            built_x, built_y = random.randint(0, 2), 0  # Random placement (error)
        else:
            built_x, built_y = builder_agent.interpret_instruction(instruction)  # Correct interpretation

        # Check if communication was successful
        success = (target_x == built_x) and (target_y == built_y)

        # Architect learns from communication success
        architect_agent.learn_from_feedback(instruction, success)

        # Builder learns based on whether they made an error
        if builder_made_error:
            builder_success = False  #  Builder knows they guessed wrong
        else:
            builder_success = True   # Builder interpreted correctly
            
        builder_agent.learn_from_feedback(instruction, builder_success)

        # I cannot append them separetely, since their type is different
        results.append({
            "trial": round_num + 1,
            "target_x": target_x,
            "built_x": built_x,
            "instruction": instruction,
            "success": success,
        })
        
        print(f"Round {trials + 1}:")
        print(f"  Target position: ({target_x}, {target_y})")
        print(f"  Instruction: '{instruction}'")
        print(f"  Built position: ({built_x}, {built_y})")
        print(f"  Success: {success}")
        print("=" * 51)
    
    print("=" * 51)
    success_rate = sum(r['success'] for r in results) / len(results)
    #for sanity check
    for rec in results:
        rec['success_rate'] = success_rate
    print(f"Overall success rate: {success_rate:.2%}")
    
    return results



data_25 = pd.DataFrame(run_single_block_experiment()) #25
data_100 = pd.DataFrame(run_single_block_experiment(trials = 100)) #100
data_1000 = pd.DataFrame(run_single_block_experiment(trials = 1000)) #1000
data_25.to_csv('data/results_25.csv', index=False)
data_100.to_csv('data/results_100.csv', index=False)
data_1000.to_csv('data/results_1000.csv', index=False)

