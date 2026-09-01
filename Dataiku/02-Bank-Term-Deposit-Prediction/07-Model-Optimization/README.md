# Model Optimization

## Overview

This section documents the hyperparameter optimization performed on the baseline Random Forest model.

Two Grid Search experiments were performed using 5-fold cross-validation.

### Optimization V1

Best configuration:

- `max_depth`: 15
- `min_samples_leaf`: 2
- `n_estimators`: 300
- `min_samples_split`: 6

**Test ROC AUC: 0.9105**

V1 performed worse than the original model and was rejected.

### Optimization V2

Best configuration:

- `max_depth`: 20
- `min_samples_leaf`: 3
- `n_estimators`: 500
- `min_samples_split`: 9

**Test ROC AUC: 0.9535**

| Metric | Original | Optimized V2 |
|---|---:|---:|
| ROC AUC | 0.9283 | **0.9535** |
| Accuracy | 0.8975 | **0.9008** |
| Recall | 0.6609 | **0.8284** |
| F1-Score | 0.6026 | **0.6627** |

The selected classification threshold was **0.475**, chosen by Dataiku to optimize F1-Score.

## Result

Optimization V2 produced the strongest Random Forest performance obtained in the project and was selected for the next stage.