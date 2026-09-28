# Lasso Regression & Feature Selection

## Purpose

Evaluate L1 regularization and use Lasso for automatic feature reduction.

The first Lasso model used all 13 predictors. A second step applied automatic Lasso feature reduction in Dataiku.

## Feature selection

- Initial predictors: 13
- Selected predictors: 11
- Removed predictors: `AGE`, `INDUS`
- Selected feature-reduction alpha: **0.1**

## Test results

| Model | R² | MAE | MSE |
| --- | ---: | ---: | ---: |
| Lasso | 0.7204 | 3.413 | 19.237 |
| **Lasso + feature reduction** | **0.7244** | **3.395** | **18.949** |

Feature reduction simplified the model while slightly improving its test performance. This reduced Lasso specification is therefore the strongest of the evaluated linear models.