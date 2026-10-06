# 04 - Gaussian Naive Bayes Model

## 1. Implementation

Gaussian Naive Bayes was implemented as a **Custom Python Model** in Dataiku using `sklearn.naive_bayes.GaussianNB`.

## 2. Configuration

| Setting | Final value |
| --- | --- |
| Target | `es_fraude` (1 = fraud; 0 = legitimate) |
| Predictors after preprocessing | 27 |
| Inputs | Same numerical features, One-Hot variables and binary `cuenta_nueva` as KNN |
| Rescaling | No rescaling on any feature |
| Train/test | 80/20, random split |
| Seed | 1337 |
| Training rows | 7,869 |
| Test rows | 1,945 |
| Final threshold | 0.825 |

All 27 features remain **Input/ON**. See [02 - Feature Engineering](../02-Feature-Engineering/) for the encoding workflow.

## 3. Final Test Metrics

| Metric | Result |
| --- | ---: |
| ROC AUC | 0.9980 |
| Accuracy | 0.9882 |
| Precision | 0.9880 |
| Recall | 0.9729 |
| F1-score | 0.9804 |
| Average Precision | 0.9968 |
| MCC | 0.9720 |

## 4. Confusion Matrix

| Actual class | Predicted fraud | Predicted legitimate |
| --- | ---: | ---: |
| Fraud | 575 (TP) | 16 (FN) |
| Legitimate | 7 (FP) | 1,347 (TN) |

At threshold **0.825**, the model detects 575 of 591 frauds, misses 16 and generates 7 false alerts: 23 errors across 1,945 test transactions.

## 5. Performance Interpretation

See [interpretation limits](../05-Model-Comparison/#interpretation-limits).

## Next Stage

[05 - Model Comparison](../05-Model-Comparison/) compares the final results and documents the selected model.
