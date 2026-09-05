# Oversampling

## Overview

This experiment evaluates the impact of **Oversampling** on the performance of the machine learning models.

The objective was to determine whether increasing the representation of the minority class could improve the model's ability to identify customers who subscribe to a term deposit.

---

## Why Oversampling?

The original training dataset presented an imbalanced class distribution.

* Majority class: Customers who **did not subscribe** (`y = 0`)
* Minority class: Customers who **subscribed** (`y = 1`)

An imbalanced dataset may cause machine learning models to favor the majority class, reducing their ability to correctly classify minority class observations.

Oversampling addresses this issue by increasing the number of minority class examples.

---

## Implementation

The minority class was randomly duplicated until it contained the same number of observations as the majority class.

Only the training dataset was modified.

The testing dataset remained unchanged to ensure that model evaluation reflected the original data distribution.

---

## Model Training

The balanced training dataset was used to train the following classification models:

* Random Forest
* Logistic Regression

Model performance was evaluated using:

* ROC AUC
* Accuracy
* Precision
* Recall
* F1-Score

---

## Results

The Oversampling experiment produced the following results:

| Model               | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| ------------------- | ------: | -------: | --------: | -----: | -------: |
| Random Forest       |  0.7982 |   0.8722 |    0.4461 | 0.4797 |   0.4623 |
| Logistic Regression |  0.8940 |        — |         — |      — |        — |

Although Oversampling successfully balanced the training data, it did not improve the overall predictive performance of the Random Forest model compared with the original training dataset.

The Random Forest model achieved a ROC AUC of **0.7982**, while the Logistic Regression model achieved a ROC AUC of **0.8940**.

---

## Conclusion

Oversampling proved to be a valuable experiment for evaluating the effect of class balancing.

However, for this dataset, duplicating minority class observations did not improve the performance of the Random Forest model.

The results suggest that increasing the representation of the minority class did not provide additional information that improved the model's ability to generalize to the unchanged test dataset.

