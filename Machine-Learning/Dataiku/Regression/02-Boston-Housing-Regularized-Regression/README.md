# Boston Housing — Regularized Regression

## Project Overview

This project develops a regression workflow in Dataiku using the Boston Housing dataset to predict `MEDV`, the median value of owner-occupied homes expressed in thousands of dollars.

The dataset contains 506 observations and 13 predictors describing residential, socioeconomic, environmental and location characteristics. The project focuses on comparing Ordinary Least Squares (OLS) with Ridge and Lasso regularization and evaluating whether feature selection can simplify the final model without reducing predictive performance.

## Objective

The objective is to build and compare three linear regression approaches:

- Ordinary Least Squares (OLS)
- Ridge Regression
- Lasso Regression

The workflow covers data exploration, train/test splitting, model training, regularization, automatic feature selection, model evaluation and final comparison.

## Project Workflow

1. **[Data Exploration](01-Data-Exploration/)** — review data quality and the main relationships with `MEDV`.
2. **[Train / Test Split](02-Train-Test-Split/)** — define the common 399/107 partition used to compare all models.
3. **[OLS Regression](03-OLS-Regression/)** — establish the baseline linear regression model.
4. **[Ridge Regression](04-Ridge-Regression/)** — evaluate L2 regularization while retaining all predictors.
5. **[Lasso Regression & Feature Selection](05-Lasso-Regression-Feature-Selection/)** — evaluate L1 regularization and reduce the model from 13 to 11 predictors.
6. **[Model Comparison](06-Model-Comparison/)** — compare predictive performance and select the final model.

No separate Data Cleaning or Feature Engineering folders are included because those stages were not required in this project. The dataset review did not identify cleaning actions that justified changing the observations, and no engineered predictors were created.

## Dataset

- Rows: 506
- Predictors: 13
- Target: `MEDV`
- Missing values: none detected
- Exact duplicate rows: none detected

No observations were removed. Statistical extreme values were retained because there was no evidence that they represented data errors.

Among the relationships highlighted during exploration, `LSTAT` showed the strongest linear association with `MEDV` (r = -0.738), followed by `RM` (r = +0.695). `RAD` and `TAX` were also strongly correlated with each other (r = 0.910), which is relevant when interpreting linear-model coefficients and motivates the comparison with regularized regression.

## Final Model Comparison

| Model | R² | MAE | MSE |
| --- | ---: | ---: | ---: |
| OLS | 0.7168 | 3.451 | 19.475 |
| Ridge | 0.7201 | 3.417 | 19.255 |
| Lasso | 0.7204 | 3.413 | 19.237 |
| **Lasso + feature reduction** | **0.7244** | **3.395** | **18.949** |

Regularization only produced a small predictive improvement over OLS. Ridge and the initial Lasso model achieved very similar results, while the reduced Lasso model obtained the best metrics of the evaluated approaches.

## Final Model

**Lasso with automatic feature reduction** is selected as the final model. Dataiku selected **alpha = 0.1**, retaining **11 of the original 13 predictors** and excluding `AGE` and `INDUS`.

The reduced model provides the best balance between predictive performance, simplicity and interpretability among the evaluated linear models.

## Tools

- Dataiku DSS
- Ordinary Least Squares Regression
- Ridge Regression
- Lasso Regression
- Lasso feature selection
- Regression evaluation: R², MAE and MSE

## Status

**Completed — Lasso with automatic feature reduction selected as the final model.**