import dataiku
import pandas as pd
from sklearn.utils import resample

# Read training dataset
dataset_train = dataiku.Dataset("dataset_train")
df = dataset_train.get_dataframe()

# Separate classes
df_majority = df[df["Attrition"] == 0]
df_minority = df[df["Attrition"] == 1]

# Undersample majority class
df_majority_undersampled = resample(
    df_majority,
    replace=False,
    n_samples=len(df_minority),
    random_state=42
)

# Combine classes
df_undersampled = pd.concat(
    [df_majority_undersampled, df_minority]
)

# Shuffle dataset
df_undersampled = df_undersampled.sample(
    frac=1,
    random_state=42
).reset_index(drop=True)

# Write output dataset
Undersample = dataiku.Dataset("Undersample")
Undersample.write_with_schema(df_undersampled)
