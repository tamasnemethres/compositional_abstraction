import pandas as pd 

data_25 = pd.read_csv("data/results_25.csv")
data_100 = pd.read_csv("data/results_100.csv")
data_1000 = pd.read_csv("data/results_1000.csv")


# copunting the word lenght of instructions

data_25["instruction_length_by_letter"] = data_25["instruction"].str.len()
data_25["instruction_length_by_word"] = data_25["instruction"].str.split().str.len()


data_100["instruction_length_by_letter"] = data_100["instruction"].str.len()
data_100["instruction_length_by_word"] = data_100["instruction"].str.split().str.len()
data_1000["instruction_length_by_letter"] = data_1000["instruction"].str.len()
data_1000["instruction_length_by_word"] = data_1000["instruction"].str.split().str.len()

data_25.to_csv("data/results_25.csv", index=False)
data_100.to_csv("data/results_100.csv", index=False)
data_1000.to_csv("data/results_1000.csv", index=False)