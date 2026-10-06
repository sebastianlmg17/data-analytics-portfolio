# Methodology and experiment notes

[Project overview](../README.md)

## Contents

- [Data Exploration](#01-data-exploration)
- [Train / Test Split](#02-train-test-split)
- [OLS Regression](#03-ols-regression)
- [Ridge Regression](#04-ridge-regression)
- [Lasso Regression & Feature Selection](#05-lasso-regression-feature-selection)
- [Model Comparison](#06-model-comparison)

---

<a id="01-data-exploration"></a>

## Data Exploration

### Purpose

Review the Boston Housing dataset before modeling and identify the relationships most relevant to predicting `MEDV`.

### Main findings

- 506 observations and 13 predictors.
- Target variable: `MEDV`.
- No missing values or exact duplicate rows were detected.
- Statistical extreme values were retained because there was no evidence that they were data errors.
- `LSTAT` showed the strongest highlighted relationship with `MEDV` (r = -0.738).
- `RM` showed a strong positive relationship with `MEDV` (r = +0.695).
- `RAD` and `TAX` were strongly correlated with each other (r = 0.910), supporting the comparison of OLS with regularized regression.

No separate data-cleaning stage was required because the review did not identify issues that justified modifying or removing observations.

---

<a id="02-train-test-split"></a>

## Train / Test Split

### Configuration

The same partition was used for all models so their performance could be compared under equivalent conditions.

- Training set: 399 observations
- Test set: 107 observations
- Approximate split: 79% / 21%
- Target: `MEDV`
- Predictors before feature reduction: 13

The test set was kept separate from model fitting and used to compare predictive performance.

---

<a id="03-ols-regression"></a>

## OLS Regression

### Purpose

Use Ordinary Least Squares as the baseline linear regression model for predicting `MEDV` before introducing regularization.

### Test results

| Metric | Result |
| --- | ---: |
| R² | 0.7168 |
| MAE | 3.451 |
| MSE | 19.475 |

OLS provides a strong baseline, explaining approximately 71.7% of the variation in `MEDV` on the test set. Its results are used as the reference for evaluating Ridge and Lasso.

---

<a id="04-ridge-regression"></a>

## Ridge Regression

### Purpose

Evaluate L2 regularization as an alternative to OLS. Ridge reduces coefficient magnitude while retaining all predictors, which can help stabilize a linear model when predictors share information.

### Test results

| Metric | Result |
| --- | ---: |
| R² | 0.7201 |
| MAE | 3.417 |
| MSE | 19.255 |

Ridge slightly improves the OLS baseline, although the difference is small. All 13 predictors remain in the model.

---

<a id="05-lasso-regression-feature-selection"></a>

## Lasso Regression & Feature Selection

### Purpose

Evaluate L1 regularization and use Lasso for automatic feature reduction.

The first Lasso model used all 13 predictors. A second step applied automatic Lasso feature reduction in Dataiku.

### Feature selection

- Initial predictors: 13
- Selected predictors: 11
- Removed predictors: `AGE`, `INDUS`
- Selected feature-reduction alpha: **0.1**

### Test results

| Model | R² | MAE | MSE |
| --- | ---: | ---: | ---: |
| Lasso | 0.7204 | 3.413 | 19.237 |
| **Lasso + feature reduction** | **0.7244** | **3.395** | **18.949** |

Feature reduction simplified the model while slightly improving its test performance. This reduced Lasso specification is therefore the strongest of the evaluated linear models.

---

<a id="06-model-comparison"></a>

## Model Comparison

### Final comparison

| Model | R² | MAE | MSE |
| --- | ---: | ---: | ---: |
| OLS | 0.7168 | 3.451 | 19.475 |
| Ridge | 0.7201 | 3.417 | 19.255 |
| Lasso | 0.7204 | 3.413 | 19.237 |
| **Lasso + feature reduction** | **0.7244** | **3.395** | **18.949** |

### Selected model

**Lasso with automatic feature reduction** is selected as the final linear model.

Regularization provides only a modest improvement over OLS, but Lasso reduces the model from 13 to 11 predictors while also obtaining the best test metrics. The main benefit is therefore the combination of slightly better predictive performance and a simpler model rather than a large increase in accuracy.
