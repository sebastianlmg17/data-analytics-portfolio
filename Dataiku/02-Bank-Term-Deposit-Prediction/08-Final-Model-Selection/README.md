# Final Model Selection

## Overview

The final model was selected after comparing the original Random Forest, class imbalance experiments, and hyperparameter optimization results.

## Selected Model

**Optimized Random Forest V2**

- `max_depth`: 20
- `min_samples_leaf`: 3
- `n_estimators`: 500
- `min_samples_split`: 9
- Threshold: **0.475**

## Final Performance

| Metric | Score |
|---|---:|
| ROC AUC | **0.9535** |
| Accuracy | **0.9008** |
| Precision | 0.5522 |
| Recall | **0.8284** |
| F1-Score | **0.6627** |
| MCC | **0.6244** |

## Conclusion

The optimized Random Forest V2 achieved the strongest overall performance obtained in the project and was selected as the final model at this stage.

The model improved the baseline ROC AUC from **0.9283 to 0.9535** while substantially increasing Recall.