# Credit Risk Evaluation with Decision Trees, Bagging and Boosting

## Project Overview

This project develops a binary classification workflow in Dataiku to evaluate whether a loan application represents high or low credit risk.

The dataset contains 50,000 loan applications and 13 variables. The target is `riesgo_credito`, where `1` represents high risk and `0` represents low risk.

## Objective

Build and compare three tree-based approaches:

- Decision Tree
- Random Forest as a bagging approach
- Gradient Boosted Trees as a boosting approach

The final model is selected using a common test set and classification metrics relevant to credit-risk evaluation.

## Project Workflow

1. [Data Exploration](01-Data-Exploration/)
2. [Data Preparation](02-Data-Preparation/)
3. [Decision Tree](03-Decision-Tree/)
4. [Random Forest](04-Random-Forest/)
5. [Gradient Boosting](05-Gradient-Boosting/)
6. [Model Comparison](06-Model-Comparison/)

## Dataset

- Rows: 50,000
- Columns: 13
- Target: `riesgo_credito`
- Low risk: 35,000 records (70%)
- High risk: 15,000 records (30%)
- Exact duplicate rows: none detected

Missing values were identified in `estabilidad_laboral` and `cuenta_corriente`, with 5,000 missing values in each.

## Data Preparation

- `estabilidad_laboral`: missing values imputed with median **4.2**.
- `cuenta_corriente`: missing values replaced with category **desconocido**.
- Statistical outliers were retained because they were not identified as invalid observations.
- One-Hot Encoding was applied to the categorical predictors.

The final split used approximately 80% for training and 20% for testing:

- Training: 39,970 rows
- Test: 10,030 rows

The same test set was used for all three models.

## Model Comparison

| Model | ROC AUC | Accuracy | Precision | Recall | F1-score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Decision Tree | 0.9328 | 0.8783 | 0.7815 | 0.8273 | 0.8037 |
| Random Forest | 0.9592 | 0.8991 | 0.8174 | 0.8564 | 0.8365 |
| **Gradient Boosted Trees** | **0.9674** | **0.9137** | **0.8565** | **0.8570** | **0.8568** |

## Final Model

**Gradient Boosted Trees** was selected as the final model.

It achieved the strongest overall performance and produced the lowest number of false negatives:

- True positives: 2,590
- False negatives: 432
- False positives: 434
- True negatives: 6,574

Because class `1` represents high credit risk, a false negative corresponds to a high-risk applicant being classified as low risk.

## Tool

Dataiku DSS
