# Ridge Regression

## Purpose

Evaluate L2 regularization as an alternative to OLS. Ridge reduces coefficient magnitude while retaining all predictors, which can help stabilize a linear model when predictors share information.

## Test results

| Metric | Result |
| --- | ---: |
| R² | 0.7201 |
| MAE | 3.417 |
| MSE | 19.255 |

Ridge slightly improves the OLS baseline, although the difference is small. All 13 predictors remain in the model.