import pandas as pd
import numpy as np

# Checking if the Success rate was calculated correctly, for reproducibility I used the csv file exported in `model.py`

data_25 = pd.read_csv("data/results_25.csv")
data_100 = pd.read_csv("data/results_100.csv")
data_1000 = pd.read_csv("data/results_1000.csv")




data_25["success_for_sanity_check"] = np.where(data_25["success"] == True, 1, 0)
data_25["success_for_sanity_check"] = (data_25["success_for_sanity_check"].sum() / 25)
print(data_25[["success_for_sanity_check", "success_rate"]].value_counts())

# success_for_sanity_check  success_rate
# 0.88                      0.88            25


data_100["success_for_sanity_check"] = np.where(data_100["success"] == True, 1, 0)
data_100["success_for_sanity_check"] = (data_100["success_for_sanity_check"].sum() / 100)
print(data_100[["success_for_sanity_check", "success_rate"]].value_counts())

# success_for_sanity_check  success_rate
#0.9                       0.9             100

data_1000["success_for_sanity_check"] = np.where(data_1000["success"] == True, 1, 0)
data_1000["success_for_sanity_check"] = (data_1000["success_for_sanity_check"].sum() / 1000)
print(data_1000[["success_for_sanity_check", "success_rate"]].value_counts())

# success_for_sanity_check  success_rate
# 0.875                     0.875           1000