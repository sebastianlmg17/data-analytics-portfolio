# Boston Housing — Regularized Regression

Regression project developed in Dataiku to predict `MEDV` (median home value) and compare standard linear regression with Ridge and Lasso regularization.

## Objective

Evaluate whether regularization improves prediction and whether Lasso can simplify the model through automatic feature selection.

## Models evaluated

| Model | R² | MAE | MSE |
|---|---:|---:|---:|
| OLS | 0.7168 | 3.451 | 19.475 |
| Ridge | 0.7201 | 3.417 | 19.255 |
| Lasso | 0.7204 | 3.413 | 19.237 |
| Lasso + feature reduction | **0.7244** | **3.395** | **18.949** |

## Key results

- Regularization produced only a small improvement over OLS.
- Automatic Lasso feature reduction selected **11 of the 13 predictors**.
- `AGE` and `INDUS` were removed.
- Dataiku selected **alpha = 0.1** for feature reduction.
- `LSTAT` and `RM` showed the strongest relationships with `MEDV` among the variables highlighted in the analysis.
- The reduced Lasso model provided the best balance between predictive performance, simplicity and interpretability among the evaluated linear models.

## Tools

- Dataiku
- Regression: OLS, Ridge and Lasso
- Feature selection with Lasso
- Model evaluation: R², MAE and MSE

## Structure

This folder contains only the material needed to understand the project and its main modeling decisions. Supporting screenshots and datasets can be added separately when needed.