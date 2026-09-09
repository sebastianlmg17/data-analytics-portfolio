# Data Cleaning & Model Reassessment

## Objective

Review potential data-quality issues after the baseline simple linear regression, apply only justified cleaning decisions, and reassess the same `price ~ sqft` model on the cleaned dataset.

## Outlier Review

Extreme values in `price` and `sqft` were reviewed before making any removal decision. Several very large or expensive properties were supported by their listing descriptions and were consistent with plausible luxury-market properties.

For this reason, statistical outliers were not automatically removed. A high price or large surface area was not considered a data-quality error by itself.

## Duplicate Property Review

The review identified four pairs with strong evidence of representing the same underlying property advertised more than once:

- `103628504` / `104179896`
- `28839965` / `101144968`
- `101980713` / `102107584`
- `103741155` / `104048199`

One observation from each confirmed pair was removed, reducing the analytical dataset from 915 to 911 rows.

The pair `99777508` / `102404641` was retained. Both records belong to the same residential development, but the available information was insufficient to establish that they represent the same individual unit.

The deduplication decision was based on data quality and property identity, not on whether removing observations improved model performance.

## Model Reassessment

The same degree-1 regression was fitted again after deduplication, using:

- Independent variable: `sqft`
- Dependent variable: `price`
- Model: simple linear regression

| Metric | Baseline model | Cleaned model |
| --- | ---: | ---: |
| Observations | 915 | 911 |
| R² | 0.4648 | 0.4973 |
| RMSE | €757,964.01 | €716,614.37 |
| Intercept | €489,872.36 | €431,208.23 |
| `sqft` coefficient | 3,685.83 | 3,962.39 |

The cleaned model can be approximated as:

`price = 431,208.23 + 3,962.39 × sqft`

After deduplication, R² increased from approximately 46.5% to 49.7%, while RMSE decreased by approximately €41,350. The estimated `sqft` coefficient increased by approximately 276.56.

These changes are interpreted as the result of removing repeated representations of confirmed properties. The records were not selected for removal because of their effect on R² or RMSE.

## Result

The cleaned dataset contains 911 observations and provides the dataset used for the next modeling stage. The next phase will extend the analysis with multiple linear regression using additional property characteristics.

## Archived datasets

Before review: [01-raw-idealista-madrid.csv](../Data/01-raw-idealista-madrid.csv) (915 rows). After review: [02-cleaned-housing-data.csv](../Data/02-cleaned-housing-data.csv) (911 rows). The same cleaned observations with encoded predictors are available in [05-model-ready-data.csv](../Data/05-model-ready-data.csv), and with the additional ANOVA grouping in [06-model-ready-data-with-size-groups.csv](../Data/06-model-ready-data-with-size-groups.csv).

File 06 differs from file 05 only by `size_range`; it does not represent another round of row removal. Reduced-column duplicate rows are retained because matching model features alone do not establish duplicate properties.

The [Multiple Linear Regression](../Multiple-Linear-Regression/README.md) phase is now completed. Model Comparison & Conclusions is next.
