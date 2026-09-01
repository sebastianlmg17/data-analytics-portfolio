# Machine Learning

## Overview

A **Decision Tree classification model** was developed in Dataiku to predict employee attrition.

The model was trained using three different training datasets created during the class imbalance analysis:

* Original dataset
* Oversampled dataset
* Undersampled dataset

The same **test dataset** was used to evaluate all three models.

---

## Model

### Decision Tree

A Decision Tree was selected as the classification algorithm for this project.

The model was used to predict the binary target variable:

```text
Attrition
0 → Employee stayed
1 → Employee left
```

The Decision Tree approach was applied independently to each training dataset in order to compare the impact of the different sampling strategies.

---

## Model Evaluation

The models were evaluated using:

* Accuracy
* Precision
* Recall
* F1-Score
* ROC AUC
* Confusion Matrix

Multiple metrics were considered because the target variable was imbalanced and Accuracy alone would not provide enough information about the model's ability to detect employee attrition.

---

## Model Comparison

| Metric    |   Original | Oversampling | Undersampling |
| --------- | ---------: | -----------: | ------------: |
| Accuracy  |     80.95% |   **80.95%** |        71.77% |
| Precision | **51.56%** |       51.28% |        39.13% |
| Recall    |     56.90% |       68.97% |    **77.59%** |
| F1-Score  |     54.10% |   **58.82%** |        52.02% |
| ROC AUC   |     79.40% |   **80.94%** |        79.65% |

### Confusion Matrices

#### Original

* True Positives: 33
* False Negatives: 25
* False Positives: 31
* True Negatives: 205

#### Oversampling

* True Positives: 40
* False Negatives: 18
* False Positives: 38
* True Negatives: 198

#### Undersampling

* True Positives: 45
* False Negatives: 13
* False Positives: 70
* True Negatives: 166

---

## Final Selection

**Oversampling** was selected as the preferred approach.

It provided the best overall balance between detecting employees who leave the company and limiting false positive predictions.

Compared with the original model, the oversampled model increased Recall and F1-Score while maintaining the same Accuracy.

Undersampling achieved the highest Recall, but generated substantially more false positives and resulted in lower overall performance.

---

## Tools

**Dataiku · Python · Pandas · Scikit-learn · Decision Tree · Machine Learning**

