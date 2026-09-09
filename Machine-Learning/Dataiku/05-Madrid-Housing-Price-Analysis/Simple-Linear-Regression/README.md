# Simple Linear Regression

## Objective

Build a baseline model to quantify the relationship between property surface area and price before applying any outlier-cleaning decisions.

## Model configuration

- Independent variable (X): `sqft`
- Dependent variable (Y): `price`
- Dataiku fit: Polynomial, degree 1
- Model type: Simple linear regression

No extreme observations were removed before fitting this model.

## Results

| Metric | Result |
| --- | ---: |
| R² | 0.4648 |
| RMSE | €757,964.01 |
| Intercept | €489,872.36 |
| `sqft` coefficient | €3,685.83 |

The fitted equation is approximately:

`price = 489,872.36 + 3,685.83 × sqft`

## Interpretation

The positive `sqft` coefficient indicates that each additional unit of surface area is associated with an estimated average increase of approximately €3,685.83 in property price within this simple model.

An R² of 0.4648 means that `sqft` alone explains approximately 46.5% of the observed variation in property prices. This confirms that surface area is an important pricing factor, while also showing that a substantial part of price variation depends on characteristics not included in this baseline model, such as location, property type and other structural features.

The RMSE is approximately €757,964, indicating substantial prediction error. The fitted chart also shows observations located far from the regression line, particularly among higher surface-area and higher-price properties.

These observations have not been classified as errors or removed at this stage. The purpose of this model is to establish a baseline that can be compared with the same regression after the data-cleaning and outlier-assessment phase.

## Next step

Review potential extreme or inconsistent values in `price` and `sqft`, justify any cleaning decisions, refit the simple linear regression and compare its metrics with this baseline model.
