# Undersampling

## Overview

This experiment evaluates the impact of **Undersampling** on the performance of the machine learning models.

The objective was to determine whether balancing the training dataset by reducing the majority class could improve the model's ability to predict customers who subscribe to a term deposit.

---

## Why Undersampling?

The original training dataset presented a significant class imbalance.

* Majority class: Customers who **did not subscribe** (`y = 0`)
* Minority class: Customers who **subscribed** (`y = 1`)

Machine learning models trained on imbalanced data may become biased toward the majority class, making it more difficult to correctly identify customers belonging to the minority class.

Undersampling addresses this issue by reducing the number of observations in the majority class.

---

## Implementation

The majority class was randomly sampled until it contained the same number of observations as the minority class.

As a result, the training dataset became balanced while the testing dataset remained unchanged.

This approach ensured that model evaluation was always performed using the original test data distribution.

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

The Undersampling experiment produced the following results:

| Model               | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| ------------------- | ------: | -------: | --------: | -----: | -------: |
| Random Forest       |  0.8026 |   0.8671 |    0.4347 | 0.5338 |   0.4792 |
| Logistic Regression |  0.8940 |        — |         — |      — |        — |

Although Undersampling successfully balanced the training data, it did not improve the overall predictive performance of the Random Forest model compared with the original training dataset.

The Random Forest model achieved a ROC AUC of **0.8026**, while the Logistic Regression model achieved a ROC AUC of **0.8940**.

---

## Conclusion

Undersampling proved to be a useful experiment for evaluating the effect of class balancing.

However, reducing the majority class did not improve the performance of the Random Forest model.

Removing observations from the majority class also meant removing potentially useful information from the training data, which may have contributed to the lower predictive performance observed in comparison with the original training dataset.

