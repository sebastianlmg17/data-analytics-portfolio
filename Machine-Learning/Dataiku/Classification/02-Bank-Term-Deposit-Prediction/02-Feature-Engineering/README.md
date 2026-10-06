## Categorical Features

Several variables in the dataset are categorical, including:

- job
- marital
- education
- contact
- month
- housing
- loan
- default
- poutcome

Although these variables require categorical encoding, **One-Hot Encoding was intentionally not performed manually during data preparation**.

Instead, the encoding process was delegated to Dataiku's machine learning pipeline.

This approach offers several advantages:

- Keeps the data preparation workflow simpler and easier to maintain.
- Ensures consistent preprocessing during model training.
- Automatically handles categorical variables within the training pipeline.
- Avoids creating unnecessary intermediate datasets.

This workflow reflects a common practice when using machine learning platforms such as Dataiku, where feature encoding is integrated into the modeling pipeline.
