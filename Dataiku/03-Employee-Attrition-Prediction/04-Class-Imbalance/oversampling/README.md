# Oversampling

## Overview

Oversampling was applied to address the class imbalance in the `Attrition` target variable.

The minority class (`Attrition = 1`) was randomly resampled with replacement until it matched the majority class (`Attrition = 0`).

The oversampling was applied **only to the training dataset**, while the test dataset remained unchanged.

## Method

The oversampled training dataset was created using Python and Scikit-learn's `resample()` function.

```text
Original Training Data
        ↓
Separate Attrition 0 / 1
        ↓
Oversample minority class
        ↓
Balance classes
        ↓
Train Decision Tree
        ↓
Evaluate on original Test Set
```

## Results

| Metric    |     Result |
| --------- | ---------: |
| Accuracy  | **80.95%** |
| Precision | **51.28%** |
| Recall    | **68.97%** |
| F1-Score  | **58.82%** |
| ROC AUC   | **80.94%** |

### Confusion Matrix

|              | Predicted 1 | Predicted 0 |
| ------------ | ----------: | ----------: |
| **Actual 1** |          40 |          18 |
| **Actual 0** |          38 |         198 |

* **True Positives:** 40
* **False Negatives:** 18
* **False Positives:** 38
* **True Negatives:** 198

## Interpretation

Compared with the original dataset, oversampling increased the number of correctly detected employees who left the company from **33 to 40**, while reducing false negatives from **25 to 18**.

The model maintained an Accuracy of **80.95%** and achieved the highest **F1-Score (58.82%)** and **ROC AUC (80.94%)** among the three approaches tested.

Oversampling therefore provided the best overall balance between detecting employee attrition and limiting false positive predictions.

