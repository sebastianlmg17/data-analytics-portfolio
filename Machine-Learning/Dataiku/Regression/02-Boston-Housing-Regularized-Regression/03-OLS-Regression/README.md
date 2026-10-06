# OLS Regression

## Purpose

Use Ordinary Least Squares as the baseline linear regression model for predicting `MEDV` before introducing regularization.

## Test results

| Metric | Result |
| --- | ---: |
| R² | 0.7168 |
| MAE | 3.451 |
| MSE | 19.475 |

OLS provides a strong baseline, explaining approximately 71.7% of the variation in `MEDV` on the test set. Its results are used as the reference for evaluating Ridge and Lasso.