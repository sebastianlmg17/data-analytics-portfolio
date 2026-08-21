# Machine Learning

## Overview

This section describes the machine learning workflow used to predict whether a customer would subscribe to a term deposit.

Several classification models and sampling strategies were evaluated to identify the most effective solution.

---

## Train/Test Split

The cleaned dataset was divided into:

- **80% Training Set**
- **20% Test Set**

The test dataset remained unchanged throughout the entire project to ensure an unbiased evaluation of model performance.

---

## Models Evaluated

Two classification algorithms were trained and compared:

- Random Forest
- Logistic Regression

The models were evaluated using:

- ROC AUC
- Accuracy
- Precision
- Recall
- F1-Score

---

## Handling Class Imbalance

The target variable presented an imbalanced class distribution.

To evaluate the impact of this imbalance, three different training strategies were implemented:

### Original Dataset

The model was trained using the original class distribution.

### Oversampling

The minority class was duplicated until both classes contained the same number of observations.

### Undersampling

The majority class was randomly reduced until both classes became balanced.

---

## Model Comparison

After comparing all experiments, the Random Forest model trained on the **original dataset** achieved the best overall performance.

Neither Oversampling nor Undersampling improved the predictive capability of the model.

This experiment demonstrated that Random Forest was sufficiently robust to handle the class imbalance present in the dataset.

---

## Key Learning

One of the main objectives of this project was not only to build a predictive model, but also to evaluate whether balancing the training data could improve performance.

The results showed that testing different approaches is more reliable than assuming a balancing technique will always improve model performance.
