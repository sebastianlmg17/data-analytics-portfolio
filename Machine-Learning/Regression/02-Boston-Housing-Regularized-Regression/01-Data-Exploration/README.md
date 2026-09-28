# Data Exploration

## Purpose

Review the Boston Housing dataset before modeling and identify the relationships most relevant to predicting `MEDV`.

## Main findings

- 506 observations and 13 predictors.
- Target variable: `MEDV`.
- No missing values or exact duplicate rows were detected.
- Statistical extreme values were retained because there was no evidence that they were data errors.
- `LSTAT` showed the strongest highlighted relationship with `MEDV` (r = -0.738).
- `RM` showed a strong positive relationship with `MEDV` (r = +0.695).
- `RAD` and `TAX` were strongly correlated with each other (r = 0.910), supporting the comparison of OLS with regularized regression.

No separate data-cleaning stage was required because the review did not identify issues that justified modifying or removing observations.