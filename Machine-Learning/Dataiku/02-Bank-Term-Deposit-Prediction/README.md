# Bank Term Deposit Prediction

## Project Overview

This project uses the UCI Bank Marketing dataset to build a machine learning model capable of predicting whether a customer will subscribe to a term deposit after a direct marketing campaign.

The project was developed in **Dataiku DSS**, combining visual data preparation, Python recipes and machine learning experimentation. Different sampling strategies and hyperparameter configurations were evaluated to improve model performance.

## Business Objective

Predict whether a customer will subscribe to a **term deposit** based on demographic information, financial attributes and previous marketing interactions.

Accurate predictions can help financial institutions improve campaign efficiency and focus marketing efforts on customers with a higher probability of subscription.

## Dataset

**Source:** UCI Machine Learning Repository – Bank Marketing Dataset

**Target variable:** `y`
- `1` = Customer subscribed to a term deposit
- `0` = Customer did not subscribe

## Technologies Used

- Dataiku DSS
- Python
- Pandas
- Random Forest
- Logistic Regression

## Project Workflow

1. Data Cleaning
2. Feature Engineering
3. Train/Test Split
4. Model Training
5. Class Imbalance Experiments
6. Model Evaluation
7. Hyperparameter Optimization
8. Final Model Selection

## Data Preparation

Main preprocessing steps included data quality review, variable type verification, removal of the **duration** feature to prevent data leakage, target encoding, categorical variable preparation and an 80/20 Train/Test split.

## Class Imbalance

Three training strategies were evaluated:

- Original Dataset
- Oversampling
- Undersampling

The original class distribution produced the strongest results during the initial comparison.

## Model Optimization

The baseline Random Forest was subsequently optimized using Grid Search with 5-fold cross-validation.

- Optimization V1: Test ROC AUC **0.9105**
- Optimization V2: Test ROC AUC **0.9535**

V2 became the strongest model obtained in the project.

## Final Model

**Optimized Random Forest V2**

- `max_depth`: 20
- `min_samples_leaf`: 3
- `n_estimators`: 500
- `min_samples_split`: 9
- Threshold: **0.475**

Final results:

| Metric | Score |
|---|---:|
| ROC AUC | **0.9535** |
| Accuracy | **0.9008** |
| Precision | 0.5522 |
| Recall | **0.8284** |
| F1-Score | **0.6627** |

## Key Learning Outcomes

- Data preparation in Dataiku.
- Feature engineering and data leakage prevention.
- Train/Test split methodology.
- Handling class imbalance.
- Model evaluation and comparison.
- Hyperparameter optimization.
- Data-driven model selection.
