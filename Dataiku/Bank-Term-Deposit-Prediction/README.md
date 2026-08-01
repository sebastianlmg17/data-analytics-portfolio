# Bank Term Deposit Prediction

## Project Overview

This project uses the UCI Bank Marketing dataset to build a machine learning model capable of predicting whether a customer will subscribe to a term deposit after a direct marketing campaign.

The project was developed in **Dataiku DSS**, combining visual data preparation, Python recipes and machine learning experimentation. Different sampling strategies were evaluated to understand the impact of class imbalance on model performance.

---

## Business Objective

The objective is to predict whether a customer will subscribe to a **term deposit** based on demographic information, financial attributes and previous marketing interactions.

Accurate predictions can help financial institutions:

- Improve campaign efficiency.
- Reduce unnecessary customer contacts.
- Focus marketing efforts on customers with a higher probability of subscription.

---

## Dataset

**Source**

UCI Machine Learning Repository – Bank Marketing Dataset

**Target variable**

- **y**
  - 1 = Customer subscribed to a term deposit.
  - 0 = Customer did not subscribe.

---

## Technologies Used

- Dataiku DSS
- Python
- Pandas
- Random Forest
- Logistic Regression

---

## Project Workflow

1. Data Cleaning
2. Feature Engineering
3. Train/Test Split
4. Model Training
5. Class Imbalance Experiments
6. Model Evaluation
7. Final Model Selection

---

## Data Preparation

The dataset was cleaned before model training.

Main preprocessing steps included:

- Data quality review.
- Variable type verification.
- Removal of the **duration** feature to prevent data leakage.
- Target variable encoding.
- Preparation of categorical variables.
- Train/Test split (80/20).

---

## Class Imbalance Analysis

Since the target variable was imbalanced, three different training strategies were evaluated:

### Original Dataset

Model trained using the original class distribution.

### Oversampling

The minority class was increased by duplicating observations until both classes became balanced.

### Undersampling

The majority class was randomly reduced until both classes contained the same number of observations.

The objective was to determine whether balancing the dataset improved predictive performance.

---

## Models Evaluated

- Random Forest
- Logistic Regression

Performance was compared using:

- ROC AUC
- Accuracy
- Precision
- Recall
- F1-Score

---

## Results

The comparison showed that the **Random Forest trained on the original dataset** achieved the best overall performance.

Although oversampling and undersampling were evaluated, neither technique improved the model.

This suggests that Random Forest was able to handle the existing class imbalance without requiring resampling techniques.

---

## Repository Structure

```
Bank-Term-Deposit-Prediction/
│
├── Images/
├── Data-Cleaning/
├── Feature-Engineering/
├── Machine-Learning/
├── Python/
└── Results/
```

---

## Key Learning Outcomes

- Data preparation in Dataiku.
- Feature engineering.
- Data leakage prevention.
- Train/Test split methodology.
- Handling class imbalance.
- Model comparison.
- Business interpretation of machine learning results.

---

## Conclusion

This project demonstrates a complete end-to-end machine learning workflow using Dataiku.

Beyond building predictive models, different sampling strategies were evaluated and compared, allowing the final model to be selected based on objective performance metrics rather than assumptions.
