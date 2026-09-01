import dataiku
import pandas as pd
from sklearn.utils import resample

# Read training dataset
dataset_train = dataiku.Dataset("dataset_train")
df = dataset_train.get_dataframe()

# Separate classes
df_majority = df[df["Attrition"] == 0]
df_minority = df[df["Attrition"] == 1]

# Oversample minority class
df_minority_oversampled = resample(
    df_minority,
    replace=True,
    n_samples=len(df_majority),
    random_state=42
)

# Combine classes
df_oversampled = pd.concat(
    [df_majority, df_minority_oversampled]
)

# Shuffle dataset
df_oversampled = df_oversampled.sample(
    frac=1,
    random_state=42
).reset_index(drop=True)

# Write output dataset
Oversample = dataiku.Dataset("Oversample")
Oversample.write_with_schema(df_oversampled)
