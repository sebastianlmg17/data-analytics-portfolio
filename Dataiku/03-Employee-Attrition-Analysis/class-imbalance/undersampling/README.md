# Undersampling

## Overview

Undersampling was applied to address the class imbalance in the `Attrition` target variable.

The majority class (`Attrition = 0`) was randomly reduced until it matched the minority class (`Attrition = 1`).

The undersampling was applied **only to the training dataset**, while the test dataset remained unchanged.

## Method

The undersampled training dataset was created using Python and Scikit-learn's `resample()` function.

```text
Original Training Data
        ↓
Separate Attrition 0 / 1
        ↓
Undersample majority class
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
| Accuracy  | **71.77%** |
| Precision | **39.13%** |
| Recall    | **77.59%** |
| F1-Score  | **52.02%** |
| ROC AUC   | **79.65%** |

### Confusion Matrix

|              | Predicted 1 | Predicted 0 |
| ------------ | ----------: | ----------: |
| **Actual 1** |          45 |          13 |
| **Actual 0** |          70 |         166 |

* **True Positives:** 45
* **False Negatives:** 13
* **False Positives:** 70
* **True Negatives:** 166

## Interpretation

Compared with the original dataset, undersampling increased the number of correctly detected employees who left the company from **33 to 45**, while reducing false negatives from **25 to 13**.

The model achieved the highest **Recall (77.59%)** among the three approaches. However, this came with a substantial increase in false positives, from **31 to 70**, resulting in lower Precision and Accuracy.

Although undersampling improved the detection of the minority class, it provided a less balanced overall performance than oversampling.

