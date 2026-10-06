# Gradient Boosted Trees

Gradient Boosted Trees was used as the boosting-based tree ensemble.

## Configuration

- Number of boosting stages: 100
- Learning rate: 0.1
- Maximum depth: 3
- Minimum samples per leaf: 1
- Loss: Deviance
- Feature sampling strategy: Square root

## Test Results

- ROC AUC: **0.9674**
- Accuracy: **0.9137**
- Precision: **0.8565**
- Recall: **0.8570**
- F1-score: **0.8568**

## Confusion Matrix

- TP: 2,590
- FN: 432
- FP: 434
- TN: 6,574
