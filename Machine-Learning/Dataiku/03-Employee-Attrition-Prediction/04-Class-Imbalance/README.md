# Class Imbalance

The target variable `Attrition` presented a significant class imbalance, with approximately **83% of employees remaining at the company and 17% leaving**.

## Sampling Strategies

To evaluate the impact of class imbalance on the Machine Learning model, three training datasets were created:

* **Original** — no resampling applied.
* **Oversampling** — the minority class (`Attrition = 1`) was increased to match the majority class using resampling with replacement.
* **Undersampling** — the majority class (`Attrition = 0`) was reduced to match the minority class using resampling without replacement.

Both sampling strategies were applied **only to the training dataset**. The **test dataset remained unchanged** and was used to evaluate all approaches under the same conditions.

## Python Recipes

Oversampling and undersampling were implemented in Dataiku using **Python Recipes**, with **Pandas** and `sklearn.utils.resample`.

The general process was:

1. Read the training dataset.
2. Separate the majority and minority classes according to `Attrition`.
3. Resample the relevant class to obtain a balanced training dataset.
4. Concatenate the classes.
5. Shuffle the resulting dataset.
6. Write the balanced dataset for subsequent model training.

## Results

The three training datasets were used to train and compare Decision Tree models.

Oversampling achieved a better overall balance than Undersampling. It increased Recall and F1-Score while maintaining the same Accuracy as the original Decision Tree.

Undersampling achieved the highest Recall, but generated substantially more false positives and lower Precision.

## Methodological Note

During the later optimization stage, a potential **data leakage issue** was identified when oversampling is performed before Cross-Validation. Because resampling with replacement creates duplicate observations, copies of the same original observation can potentially appear in different folds.

For the subsequent model optimization, the **original training dataset** was therefore used with Stratified Cross-Validation rather than applying Oversampling to the complete training set before the folds were created.

