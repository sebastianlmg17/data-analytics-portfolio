# Customer Churn Prediction

## Overview

Compare customer-churn classifiers using the 7,043-record IBM Telco Customer Churn dataset.

## Objective

Identify potential churn cases and assess the tradeoff between detecting departures and unnecessary retention outreach.

## Tools

Python · Pandas · NumPy · Scikit-learn · Imbalanced-learn · Matplotlib · Jupyter.

The code was developed with assistance from **CODEX**.

## Methodology at a glance

Clean `TotalCharges`, exclude the customer identifier, use a stratified 80/20 split, encode categorical predictors, scale continuous features for Logistic Regression, and compare Logistic Regression, Random Forest, random oversampling and LR tuning.

## Results and current limits

Tuned Logistic Regression (`C=0.1`, `class_weight="balanced"`, threshold **0.55**): accuracy **0.7544**, precision **0.5261**, recall **0.7540**, F1 **0.6198** and ROC AUC **0.8408**. Recall and F1 improve over baseline LR, with lower precision and accuracy. This is an exploratory comparison: the test set was reused and One-Hot Encoding was fitted before cross-validation, so these are not independent final results.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Dataset — published IBM snapshot](data/raw/)
- [Python notebook — implementation and experiments](notebooks/customer_churn_prediction.ipynb)
- [Reports — computed model and selection tables](reports/)
- [Dependencies](requirements.txt)
- [Machine Learning catalogue](../../README.md)
