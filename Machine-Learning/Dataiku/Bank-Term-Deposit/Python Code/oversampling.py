# -*- coding: utf-8 -*-

import dataiku
import pandas as pd

# Read the training dataset
train = dataiku.Dataset("bank-full_Train")
df = train.get_dataframe()

# Separate majority and minority classes
majority = df[df["y"] == 0]
minority = df[df["y"] == 1]

# Apply Oversampling to the minority class
minority_oversampled = minority.sample(
    n=len(majority),
    replace=True,
    random_state=42
)

# Combine both classes
df_oversampled = pd.concat([majority, minority_oversampled])

# Shuffle the dataset
df_oversampled = df_oversampled.sample(
    frac=1,
    random_state=42
).reset_index(drop=True)

# Display class distribution
print("Original class distribution:")
print(df["y"].value_counts())

print("\nOversampled class distribution:")
print(df_oversampled["y"].value_counts())

# Write the output dataset
output = dataiku.Dataset("Train_Oversample")
output.write_with_schema(df_oversampled)
