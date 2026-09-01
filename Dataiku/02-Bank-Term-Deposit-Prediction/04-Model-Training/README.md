# Machine Learning

## Overview

This section describes the machine learning workflow used to predict whether a customer would subscribe to a term deposit.

Several classification models and sampling strategies were evaluated to identify the most effective solution.

---

## Train/Test Split

The cleaned dataset was divided into:

- **80% Training Set**
- **20% Test Set**

The test dataset remained unchanged throughout the experiments to ensure a consistent evaluation.

---

## Models Evaluated

Two classification algorithms were initially evaluated:

- Random Forest
- Logistic Regression

The models were evaluated using ROC AUC, Accuracy, Precision, Recall and F1-Score.

The Random Forest achieved the strongest baseline performance and was selected for further experimentation.

---

## Handling Class Imbalance

Three training strategies were evaluated:

- **Original Dataset**
- **Oversampling**
- **Undersampling**

Neither sampling technique improved the baseline Random Forest performance.

---

## Hyperparameter Optimization

The baseline Random Forest was subsequently optimized using Grid Search with 5-fold cross-validation.

Two optimization experiments were performed. V1 performed worse than the baseline, while V2 improved the model substantially, reaching a test ROC AUC of **0.9535**.

The optimized model is documented in **Model-Optimization** and was selected as the strongest model obtained in the project.

---

## Key Learning

The project demonstrates that model development should be based on empirical comparison. Class balancing did not improve the baseline, while targeted hyperparameter optimization produced a stronger Random Forest model.