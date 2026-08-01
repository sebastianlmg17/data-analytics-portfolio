# Undersampling

## Overview

This experiment evaluates the impact of **Undersampling** on the performance of the machine learning models.

The objective was to determine whether balancing the training dataset by reducing the majority class could improve the model's ability to predict customers who subscribe to a term deposit.

---

## Why Undersampling?

The original training dataset presented a significant class imbalance.

- Majority class: Customers who **did not subscribe** (`y = 0`)
- Minority class: Customers who **subscribed** (`y = 1`)

Machine learning models trained on imbalanced data may become biased toward the majority class, making it more difficult to correctly identify customers belonging to the minority class.

Undersampling addresses this issue by reducing the number of observations in the majority class.

---

## Implementation

The majority class was randomly sampled until it contained the same number of observations as the minority class.

As a result, the training dataset became balanced while the testing dataset remained unchanged.

This approach ensured that model evaluation was always performed using real-world data.

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

Although Undersampling successfully balanced the training data, it did not improve the predictive performance of the models.

Compared with the model trained on the original dataset, the Random Forest model achieved lower scores across the main evaluation metrics.

This suggests that removing a large portion of the majority class also removed valuable information that helped the model generalize better.

---

## Conclusion

Undersampling proved to be a useful experiment for evaluating the effect of class balancing.

However, for this dataset, reducing the majority class did not produce better results than training the model using the original data distribution.
