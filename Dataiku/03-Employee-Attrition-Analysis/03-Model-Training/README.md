# Machine Learning

## Overview

The Machine Learning phase began with **Decision Tree classification models** to predict employee attrition. The Decision Tree was trained using three different approaches to address class imbalance:

* Original training dataset
* Oversampled training dataset
* Undersampled training dataset

The same **original test dataset** was used to evaluate all three approaches.

## Target

The binary target variable was:

```text
Attrition
0 → Employee stayed
1 → Employee left
```

## Initial Decision Tree Results

| Metric | Original | Oversampling | Undersampling |
|---|---:|---:|---:|
| Accuracy | 80.95% | **80.95%** | 71.77% |
| Precision | **51.56%** | 51.28% | 39.13% |
| Recall | 56.90% | 68.97% | **77.59%** |
| F1-Score | 54.10% | **58.82%** | 52.02% |
| ROC AUC | 79.40% | **80.94%** | 79.65% |

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

## Interpretation

Oversampling provided a better overall balance than Undersampling. It increased Recall from **56.90% to 68.97%** and F1-Score from **54.10% to 58.82%** while maintaining the same Accuracy.

Undersampling achieved the highest Recall (**77.59%**), but produced substantially more false positives, reducing Precision and overall performance.

These initial experiments motivated a broader model optimization phase rather than selecting the Decision Tree immediately as the final model.

## Evaluation Metrics

The models were evaluated using:

* Accuracy
* Precision
* Recall
* F1-Score
* ROC AUC
* Confusion Matrix

Multiple metrics were considered because the target variable was imbalanced and Accuracy alone would not adequately describe the model's ability to detect employee attrition.

## Next Phase

The Decision Tree experiments were followed by Cross-Validation, Hyperparameter Optimization and comparison with Logistic Regression and Random Forest. The final model selection is documented in the **Model Optimization** section.

## Tools

**Dataiku · Python · Pandas · Scikit-learn · Decision Tree · Machine Learning**
