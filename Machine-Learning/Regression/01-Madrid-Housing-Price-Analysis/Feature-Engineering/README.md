# Feature Engineering

## Objective

Prepare the selected variables for regression modeling while preserving interpretability and avoiding unnecessary dimensionality.

## Variables Retained

The structured modeling dataset retains:

- `price` — target variable.
- `sqft` — numeric predictor representing built area.
- `rooms` — numeric predictor representing number of rooms.
- `baths` — numeric predictor representing number of bathrooms.

The variables `sqft`, `rooms` and `baths` remain numeric and are not encoded as categorical features.

## Variables Excluded

Columns not used in the initial regression model were excluded from the final modeling dataset. This includes `description`, which contains free text and would require text-processing or NLP techniques outside the scope of the current structured regression approach.

## Location Engineering

The original `address` variable contains neighborhood or area-level information with relatively high cardinality. To preserve the predictive value of location while reducing fragmentation, a new `district` variable was created using a neighborhood/area-to-district mapping table.

Using districts instead of directly encoding every `address` category reduces the number of categorical levels, avoids an excessively fragmented One-Hot representation and keeps the linear model more interpretable.

## Categorical Encoding

Two categorical variables were prepared using **One-Hot Encoding**:

- `district`
- `typology`

Empty values generated during the One-Hot Encoding step were replaced with `0`.

After the dummy variables were created, the original categorical columns were removed from the final modeling dataset:

- `address`
- `district`
- `typology`

## Reference Categories

For linear regression, one dummy variable from each categorical feature was removed to provide a reference category and avoid perfect multicollinearity among the encoded variables.

The reference categories are:

- **District:** `Arganzuela`
- **Typology:** `Pisos`

The coefficients of the remaining dummy variables can therefore be interpreted relative to these reference categories while holding the other model variables constant.

## Outliers and Special Values

No extreme values have been removed at this stage.

Records with `rooms = 0` have also been retained. Both potential outliers and these records will be evaluated during the diagnostic and modeling phases before any data-cleaning decision is made.

## Result

The feature-engineering stage produces a structured dataset suitable for regression modeling, combining numeric property characteristics with encoded district and property-type information while maintaining a clear and interpretable feature structure.

## Archived datasets

Inputs: [02-cleaned-housing-data.csv](../Data/02-cleaned-housing-data.csv) and the auxiliary lookup [03-address-district-mapping.csv](../Data/03-address-district-mapping.csv). The join produces [04-housing-with-district.csv](../Data/04-housing-with-district.csv) (911 × 8), and district encoding produces [05-model-ready-data.csv](../Data/05-model-ready-data.csv) (911 × 25).

These exports already incorporate the later duplicate review. Their comparison verifies the join and binary encodings, but cannot establish whether missing values existed temporarily during a Dataiku recipe.
