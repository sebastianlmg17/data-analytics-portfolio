# Multiple Linear Regression

## Objective and model specification

Model Madrid property prices with ordinary least squares (OLS), controlling simultaneously for built area, rooms, bathrooms, district and property type.

- Target: `price` in euros.
- Predictors: `sqft`, `rooms`, `baths`, the 20 district dummy variables and `Independientes`.
- Reference categories: Arganzuela for district and Pisos for property type.
- Excluded: `size_range`, which is used for ANOVA only. The redundant `Pisos` indicator, raw location labels and listing metadata are also excluded.
- An intercept is included.

Dataset: [05-model-ready-data.csv](../Data/05-model-ready-data.csv) (911 × 25). Alternatively, [06-model-ready-data-with-size-groups.csv](../Data/06-model-ready-data-with-size-groups.csv) contains the identical model values plus `size_range`, which must be excluded before fitting.

## Dataiku predictive evaluation

These are the reported Dataiku OLS evaluation results supplied with the project. The CSV exports alone do not retain the evaluation split or Visual ML preprocessing configuration, so they cannot independently reproduce this exact evaluation.

| Metric | Dataiku result |
| --- | ---: |
| R² | 0.7141 |
| RMSE | approximately €538,900 |
| MAE | approximately €339,300 |
| MAPE | 34.40% |
| Explained variance | 0.7168 |
| Pearson correlation | 0.8535 |

R² indicates that the model accounts for approximately 71.41% of price variation on the evaluated data relative to a mean-price baseline. RMSE penalizes large errors more heavily than MAE. MAPE expresses mean absolute error relative to actual prices. Explained variance measures residual variation relative to target variation, while Pearson correlation measures linear association between predictions and actual prices. These metrics describe predictive performance, not coefficient significance.

### Visible Dataiku coefficients

The following is the reported visible subset, not the complete fitted equation. Values are approximate euro changes holding other predictors constant.

| Predictor | Coefficient (€) |
| --- | ---: |
| Salamanca | +674,059 |
| Chamartín | +507,463 |
| Chamberí | +447,417 |
| Centro | +274,182 |
| baths | +239,981 |
| Retiro | +171,498 |
| sqft | +3,149 per recorded unit |
| rooms | +5,190 |
| Independientes | −337,142 |

District coefficients are differences relative to Arganzuela. `Independientes` is a conditional difference relative to Pisos, not an unconditional statement that independent homes cost less. No p-values are inferred from the size of these Dataiku coefficients.

## Statistical significance: separate full-dataset OLS

This analysis fits OLS to all 911 cleaned observations, using the same 24 predictors and an intercept, with `size_range` excluded. It was independently recalculated from the archived CSV using least squares and conventional OLS standard errors, two-sided t-tests and 886 residual degrees of freedom. It is an in-sample inferential fit, separate from the Dataiku evaluation.

| Statistic | Full-dataset OLS |
| --- | ---: |
| R² | 0.6626 |
| Adjusted R² | 0.6534 |
| F-statistic | 72.49 |
| Global p-value | < 0.0001 |

At alpha = 0.05, the following seven predictors are statistically significant. Two additional coefficients illustrate non-significant results.

| Predictor | Approximate coefficient (€) | p-value | Significant at 0.05? |
| --- | ---: | ---: | --- |
| sqft | +3,040 per recorded unit | < 0.0001 | Yes |
| baths | +234,241 | < 0.0001 | Yes |
| Salamanca | +673,251 | < 0.0001 | Yes |
| Chamberí | +488,098 | 0.0016 | Yes |
| Chamartín | +464,591 | 0.0028 | Yes |
| Independientes | −309,702 | 0.0002 | Yes |
| Fuencarral-El Pardo | −339,964 | 0.0432 | Yes |
| rooms | +1,665 | 0.9354 | No |
| Centro | +262,938 | 0.0796 | No |

The global F-test rejects the joint null that all slope coefficients are zero. After controlling for the other features, `rooms` does not show evidence of an additional association with price at this threshold. Centro also fails the 5% threshold despite its positive estimate. Non-significance does not prove an effect is zero. These conventional p-values depend on OLS assumptions and are not causal evidence.

### Why the two sets of results must remain separate

Dataiku metrics and full-dataset OLS inference are not directly identical because the evaluation split and preprocessing can differ. The exact split and preprocessing settings are not preserved in these CSVs. Dataiku's R² of 0.7141 and its visible coefficients belong to its reported model evaluation. The full-data R² of 0.6626 and the p-values above belong to the separate 911-row fit. Do not attach these p-values to Dataiku coefficients or combine the two sets into one model summary.

## Status and next step

Multiple Linear Regression is completed. Model Comparison & Conclusions is next: compare the simple and multiple models while accounting for differences in evaluation setup, and summarize predictive limitations and the main conditional price associations.
