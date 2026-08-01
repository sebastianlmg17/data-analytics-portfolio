# -*- coding: utf-8 -*-

import dataiku
import pandas as pd

# Read the training dataset
train = dataiku.Dataset("bank-full_Train")
df = train.get_dataframe()

# Separate majority and minority classes
majority = df[df["y"] == 0]
minority = df[df["y"] == 1]

# Apply Undersampling to the majority class
majority_undersampled = majority.sample(
    n=len(minority),
    random_state=42
)

# Combine both classes
df_undersampled = pd.concat([majority_undersampled, minority])

# Shuffle the dataset
df_undersampled = df_undersampled.sample(
    frac=1,
    random_state=42
).reset_index(drop=True)

# Display class distribution
print("Original class distribution:")
print(df["y"].value_counts())

print("\nUndersampled class distribution:")
print(df_undersampled["y"].value_counts())

# Write the output dataset
output = dataiku.Dataset("Train_Undersample")
output.write_with_schema(df_undersampled)
