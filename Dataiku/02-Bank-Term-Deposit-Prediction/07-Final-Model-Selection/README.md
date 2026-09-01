# Model Optimization

## Overview

This section documents the hyperparameter optimization experiments performed on the original Random Forest model.

The objective was to improve the baseline performance while keeping the same training and testing datasets.

## Optimization

Two optimization experiments were performed using **Grid Search with 5-fold Cross-Validation**.

### Optimization V1

Best configuration:

* `max_depth`: 15
* `min_samples_leaf`: 2
* `n_estimators`: 300
* `min_samples_split`: 6

**Test ROC AUC: 0.9105**

V1 performed worse than the original model and was therefore rejected.

### Optimization V2

Best configuration:

* `max_depth`: 20
* `min_samples_leaf`: 3
* `n_estimators`: 500
* `min_samples_split`: 9

**Test ROC AUC: 0.9535**

V2 improved significantly over the original Random Forest:

| Metric   | Original | Optimized V2 |
| -------- | -------: | -----------: |
| ROC AUC  |   0.9283 |   **0.9535** |
| Accuracy |   0.8975 |   **0.9008** |
| Recall   |   0.6609 |   **0.8284** |
| F1-Score |   0.6026 |   **0.6627** |

## Final Result

**Optimization V2 was selected as the best Random Forest configuration** and will be used as the strongest model for the next stages of the project.
