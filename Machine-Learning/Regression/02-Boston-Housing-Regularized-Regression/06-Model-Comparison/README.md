# Model Comparison

## Final comparison

| Model | R² | MAE | MSE |
| --- | ---: | ---: | ---: |
| OLS | 0.7168 | 3.451 | 19.475 |
| Ridge | 0.7201 | 3.417 | 19.255 |
| Lasso | 0.7204 | 3.413 | 19.237 |
| **Lasso + feature reduction** | **0.7244** | **3.395** | **18.949** |

## Selected model

**Lasso with automatic feature reduction** is selected as the final linear model.

Regularization provides only a modest improvement over OLS, but Lasso reduces the model from 13 to 11 predictors while also obtaining the best test metrics. The main benefit is therefore the combination of slightly better predictive performance and a simpler model rather than a large increase in accuracy.