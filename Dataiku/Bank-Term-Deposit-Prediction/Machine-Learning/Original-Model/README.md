# Original Model

## Overview

The original model was trained using the **original training dataset**, preserving the natural class distribution of the target variable.

This model served as the **baseline** for the entire project and was used to evaluate whether class balancing techniques could improve predictive performance.

---

## Dataset

The model was trained using the original training dataset obtained after the Train/Test Split.

No sampling techniques were applied before training.

This allowed the model to learn directly from the real distribution of customer responses.

---

## Models Evaluated

Two classification algorithms were trained:

- Random Forest
- Logistic Regression

Both models were evaluated using the same testing dataset to ensure a fair comparison with the Oversampling and Undersampling experiments.

---

## Evaluation Metrics

Model performance was measured using:

- ROC AUC
- Accuracy
- Precision
- Recall
- F1-Score

These metrics provide a comprehensive evaluation of the model's ability to correctly classify customers who subscribed to a term deposit.

---

## Results

The Random Forest model achieved the best overall performance among all experiments conducted in this project.

When compared with the models trained using Oversampling and Undersampling, the original model obtained higher scores across all evaluation metrics.

This indicates that the original class imbalance did not negatively affect the Random Forest algorithm.

---

## Conclusion

The original model was selected as the final model for this project.

The experiments demonstrated that, for this dataset, preserving the original class distribution produced better predictive performance than applying class balancing techniques.

This highlights the importance of validating different approaches instead of assuming that sampling techniques will always improve machine learning models.
