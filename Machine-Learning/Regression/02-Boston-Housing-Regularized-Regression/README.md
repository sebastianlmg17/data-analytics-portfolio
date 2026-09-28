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

## Project Structure

- **Data Exploration** — review data quality and the main relationships with `MEDV`.
- **OLS Regression** — establish the baseline linear regression model.
- **Ridge Regression** — evaluate L2 regularization while retaining all predictors.
- **Lasso Regression** — evaluate L1 regularization and automatic feature selection.
- **Model Comparison** — compare predictive performance and select the most useful model.

## Dataset

- Rows: 506
- Predictors: 13
- Target: `MEDV`
- Missing values: none detected
- Exact duplicate rows: none detected

No observations were removed. Statistical extreme values were retained because there was no evidence that they represented data errors.

Among the relationships highlighted during exploration, `LSTAT` showed the strongest linear association with `MEDV` (r = -0.738), followed by `RM` (r = +0.695). `RAD` and `TAX` were also strongly correlated with each other (r = 0.910), which is relevant when interpreting linear-model coefficients and motivates the comparison with regularized regression.

## Modeling Approach

All models use `MEDV` as the target and the same train/test partition: 399 observations for training and 107 for testing, approximately 79% / 21% of the dataset. Keeping the same test set allows the models to be compared under equivalent conditions.

OLS is used as the baseline. Ridge applies L2 regularization to reduce coefficient magnitude while retaining every predictor. Lasso applies L1 regularization and can reduce some coefficients to zero, allowing automatic feature selection.

For the final Lasso feature-reduction step, Dataiku selected **alpha = 0.1**. The model retained **11 of the original 13 predictors**, excluding `AGE` and `INDUS`.

## Final Model Comparison

| Model | R² | MAE | MSE |
| --- | ---: | ---: | ---: |
| OLS | 0.7168 | 3.451 | 19.475 |
| Ridge | 0.7201 | 3.417 | 19.255 |
| Lasso | 0.7204 | 3.413 | 19.237 |
| **Lasso + feature reduction** | **0.7244** | **3.395** | **18.949** |

Regularization only produced a small predictive improvement over OLS. Ridge and the initial Lasso model achieved very similar results, while the reduced Lasso model obtained the best metrics of the evaluated approaches.

The most relevant result is therefore not a large increase in predictive accuracy, but the ability to simplify the model. Removing `AGE` and `INDUS` reduced the number of predictors from 13 to 11 while slightly improving performance on the test set.

## Final Model

**Lasso with automatic feature reduction** is selected as the final model.

It provides the best balance between predictive performance, simplicity and interpretability among the evaluated linear models:

- R²: **0.7244**
- MAE: **3.395**
- MSE: **18.949**
- Selected predictors: **11**
- Removed predictors: `AGE`, `INDUS`
- Feature-selection alpha: **0.1**

The differences between the models are small, so the selection is based not only on the slightly better metrics but also on the simpler final specification.

## Tools

- Dataiku DSS
- Ordinary Least Squares Regression
- Ridge Regression
- Lasso Regression
- Lasso feature selection
- Regression evaluation: R², MAE and MSE

## Status

**Completed — Lasso with automatic feature reduction selected as the final model.**