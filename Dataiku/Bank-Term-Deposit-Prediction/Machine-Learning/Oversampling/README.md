
# Oversampling

## Overview

This experiment evaluates the impact of **Oversampling** on the performance of the machine learning models.

The objective was to determine whether increasing the representation of the minority class could improve the model's ability to identify customers who subscribe to a term deposit.

---

## Why Oversampling?

The original training dataset presented an imbalanced class distribution.

- Majority class: Customers who **did not subscribe** (`y = 0`)
- Minority class: Customers who **subscribed** (`y = 1`)

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

- Random Forest
- Logistic Regression

Model performance was evaluated using:

- ROC AUC
- Accuracy
- Precision
- Recall
- F1-Score

---

## Results

Although Oversampling successfully balanced the training data, it did not improve the overall predictive performance of the models.

Compared with the model trained on the original dataset, the Random Forest model achieved lower evaluation metrics.

The duplicated observations increased the representation of the minority class but did not provide additional information to improve the model's generalization ability.

---

## Conclusion

Oversampling proved to be a valuable experiment for evaluating the effect of class balancing.

However, for this dataset, duplicating minority class observations did not outperform the model trained using the original class distribution.
