# Model Comparison

## Overview

This section compares the performance of the three training strategies evaluated during this project.

The objective was to determine whether handling class imbalance through sampling techniques could improve the predictive performance of the machine learning models.

Three different approaches were evaluated:

- Original Training Dataset
- Oversampling
- Undersampling

Each model was trained using the same algorithms and evaluated on the same testing dataset to ensure a fair comparison.

---

## Evaluation Metrics

The models were compared using the following evaluation metrics:

- ROC AUC
- Accuracy
- Precision
- Recall
- F1-Score

These metrics provide a comprehensive assessment of the models' ability to correctly identify customers who subscribe to a term deposit.

---

## Performance Comparison

| Training Strategy | ROC AUC | Accuracy | Precision | Recall | F1-Score |
|-------------------|--------:|---------:|----------:|--------:|---------:|
| Original Dataset | **0.9283** | **0.8975** | **0.5537** | **0.6609** | **0.6026** |
| Oversampling | 0.7982 | 0.8722 | 0.4461 | 0.4797 | 0.4623 |
| Undersampling | 0.8026 | 0.8671 | 0.4347 | 0.5338 | 0.4792 |

---

## Analysis

The experiments show that balancing the training dataset did not improve model performance.

Although both Oversampling and Undersampling successfully produced balanced training datasets, the Random Forest model trained on the original data consistently achieved the highest scores across all evaluation metrics.

The results suggest that the original class imbalance did not negatively affect the learning capability of the Random Forest algorithm.

In contrast, the sampling techniques either duplicated existing observations (Oversampling) or removed a significant amount of useful information (Undersampling), leading to lower predictive performance.

---

## Final Model Selection

Based on the experimental results, the **Random Forest model trained on the original dataset** was selected as the final model for this project.

This decision was supported by objective performance metrics rather than assumptions about class imbalance.

---

## Key Learning

One of the main objectives of this project was to evaluate whether class balancing techniques would improve model performance.

The experiments demonstrated that balancing the dataset does not always produce better results.

Instead of assuming that Oversampling or Undersampling would improve the model, each approach was tested and compared using multiple evaluation metrics.

This project highlights the importance of making machine learning decisions based on empirical evidence rather than intuition.

---

## Conclusion

After evaluating all three training strategies, the Random Forest model trained on the original dataset achieved the best overall performance.

This project demonstrates the importance of comparing multiple machine learning approaches before selecting a final model, reinforcing a data-driven methodology for model development and evaluation.
