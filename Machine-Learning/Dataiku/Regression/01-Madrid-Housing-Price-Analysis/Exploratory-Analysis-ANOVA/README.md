# Exploratory Analysis & ANOVA

## Objective

Evaluate whether residential property prices differ significantly across property-size groups.

## Initial ANOVA attempt

A first one-way ANOVA was configured directly with:

- Test variable: `price`
- Populations defined by: `sqft`

Because `sqft` is a continuous variable with many distinct values, Dataiku capped the analysis at the 10 most common surface values. This test used only 98 observations, so it was not retained as the main ANOVA for the project.

## Creating property-size groups

To use the complete dataset and obtain meaningful populations, a new categorical feature named `size_range` was created from `sqft` in a Prepare recipe.

The cut points were based on the quartiles of the original 915-row dataset:

- Q1: 104
- Median: 158
- Q3: 264

This produced four nearly balanced groups:

| Size group | Rule | Observations |
| --- | --- | ---: |
| Q1 - Small | `sqft <= 104` | 230 |
| Q2 - Medium | `104 < sqft <= 158` | 230 |
| Q3 - Large | `158 < sqft <= 264` | 230 |
| Q4 - Very Large | `sqft > 264` | 225 |
| **Total** | | **915** |

No observations were removed to create these groups.

## Final one-way ANOVA

The final test was configured in Dataiku as:

- Test variable: `price`
- Populations defined by: `size_range`
- Significance level: 0.05

### Results

| Size group | Observations | Mean price (€) |
| --- | ---: | ---: |
| Q1 - Small | 230 | 464,630.73 |
| Q2 - Medium | 230 | 913,029.99 |
| Q3 - Large | 230 | 1,362,623.48 |
| Q4 - Very Large | 225 | 2,447,160.00 |

ANOVA statistics:

- Degrees of freedom: 911
- F-value: 304.60548601
- p-value: < 0.00001

## Interpretation

The null hypothesis states that mean property price is identical across all four size groups. Since the p-value is far below the 0.05 significance level, the null hypothesis is rejected.

The results provide strong statistical evidence that mean property prices differ across property-size groups. Mean price also rises consistently from the smallest to the largest group, showing a clear association between property size and price in this dataset.

ANOVA establishes that the group means are not all equal, but it does not quantify the expected price increase for each additional unit of surface area or establish that the relationship is linear. That relationship will be examined in the next phase using simple linear regression with `sqft` as the predictor and `price` as the target.

## Archived datasets and historical scope

The original 915-row observations are available in [01-raw-idealista-madrid.csv](../Data/01-raw-idealista-madrid.csv). The saved snapshot containing `size_range` is [06-model-ready-data-with-size-groups.csv](../Data/06-model-ready-data-with-size-groups.csv) (911 × 26), after the later duplicate review. Its cut points remain 104, 158 and 264.

The ANOVA counts and statistics reported above describe the original 915-row analysis. File 06 is the cleaned counterpart and must not be presented as the exact input that produced those historical results.
