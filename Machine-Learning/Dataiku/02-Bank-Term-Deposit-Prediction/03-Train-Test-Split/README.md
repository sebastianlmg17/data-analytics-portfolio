# Train/Test Split

## Overview

Before training any machine learning model, the dataset was divided into separate training and testing sets.

This step ensures that the model is evaluated on unseen data, providing a reliable estimate of its performance on new customers.

---

## Split Configuration

The dataset was divided using the following ratio:

- **Training Set:** 80%
- **Testing Set:** 20%

The training dataset was used to train the machine learning models, while the testing dataset was reserved exclusively for evaluation.

---

## Why Perform a Train/Test Split?

Separating the data before model training helps prevent overfitting and provides an unbiased evaluation of model performance.

The model learns patterns from the training data and is then tested on completely unseen observations.

This process simulates how the model would perform in a real-world scenario when predicting whether a new customer will subscribe to a term deposit.

---

## Important Consideration

The Train/Test Split was performed **before** applying any sampling techniques.

This is an essential machine learning practice because the testing dataset must always preserve the original class distribution.

Only the training dataset was used to create the Oversampling and Undersampling versions.

This prevents data leakage and guarantees a fair comparison between all trained models.

---

## Outcome

The resulting datasets served as the foundation for all subsequent machine learning experiments performed in this project.
