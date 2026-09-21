# 03 - K-Nearest Neighbors (KNN)

## Purpose

Train and evaluate the KNN fraud classifier using the corrected feature configuration from [02 - Feature Engineering](../02-Feature-Engineering/).

## 1. Configure the Training and Test Split

| Setting | Value |
| --- | --- |
| Target | `es_fraude` (1 = fraud; 0 = legitimate) |
| Train/test split | 80/20 |
| Split method | Random |
| Random seed | 1337 |
| Features after preprocessing | 27 |

Apply standard scaling only to `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h` and `distancia_ip`. Keep all One-Hot dummies and `cuenta_nueva` as active inputs with **No rescaling**.

## 2. Search and Select Hyperparameters

| Setting | Value |
| --- | --- |
| Search method | Grid search |
| Candidate K values | 3, 5, 7, 9, 11 |
| Validation | 5-fold cross-validation |
| Hyperparameter optimization metric | ROC AUC |
| Selected K | 11 |
| Distance parameter | `p = 2` (Euclidean) |
| Distance weighting | No |
| Neighbor finding algorithm | Automatic |
| Threshold optimization metric | F1-score |
| Final threshold | 0.100 |

K = 11 was selected within the evaluated grid. Hyperparameter selection by ROC AUC and threshold selection by F1 are separate decisions.

## 3. Verify the Trained Model

The final Algorithm screen reports 28 columns before preprocessing and 27 features after preprocessing. The earlier run with only 5 features is superseded: the dummy variables must remain **Input/ON**, with only their scaling changed to **No rescaling**.

## 4. Final Test Metrics

| Metric | Result |
| --- | ---: |
| ROC AUC | 0.9897 |
| Accuracy | 0.9861 |
| Precision | 0.9829 |
| Recall | 0.9712 |
| F1-score | 0.9770 |
| Average Precision | 0.9853 |
| MCC | 0.9671 |

Classification results use the final threshold of **0.100**.

## 5. Confusion Matrix

| Actual class | Predicted fraud | Predicted legitimate |
| --- | ---: | ---: |
| Fraud | 574 (TP) | 17 (FN) |
| Legitimate | 10 (FP) | 1,344 (TN) |

The test matrix contains 1,945 transactions: 591 fraudulent and 1,354 legitimate. KNN detects 574 frauds, misses 17 and generates 10 false alerts, for 27 classification errors.

These are the reported results for this test partition. The earlier cleaning stage recorded 9,814 rows; the exact training-row count is not inferred from the nominal split.

## Next Phase

Naive Bayes is the next phase. Its configuration, results and the final model comparison are not documented yet.
