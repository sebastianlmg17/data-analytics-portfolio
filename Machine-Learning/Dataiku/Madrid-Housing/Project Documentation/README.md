# Project Documentation

[Project overview](../README.md)

## Contents

- [Data Cleaning & Model Reassessment](#data-cleaning-model-reassessment)
- [Data Wrangling](#data-wrangling)
- [Data snapshots](#data)
- [Exploratory Analysis & ANOVA](#exploratory-analysis-anova)
- [Feature Engineering](#feature-engineering)
- [Multiple Linear Regression](#multiple-linear-regression)
- [Simple Linear Regression](#simple-linear-regression)

---

<a id="data-cleaning-model-reassessment"></a>

## Data Cleaning & Model Reassessment

### Objective

Review potential data-quality issues after the baseline simple linear regression, apply only justified cleaning decisions, and reassess the same `price ~ sqft` model on the cleaned dataset.

### Outlier Review

Extreme values in `price` and `sqft` were reviewed before making any removal decision. Several very large or expensive properties were supported by their listing descriptions and were consistent with plausible luxury-market properties.

For this reason, statistical outliers were not automatically removed. A high price or large surface area was not considered a data-quality error by itself.

### Duplicate Property Review

The review identified four pairs with strong evidence of representing the same underlying property advertised more than once:

- `103628504` / `104179896`
- `28839965` / `101144968`
- `101980713` / `102107584`
- `103741155` / `104048199`

One observation from each confirmed pair was removed, reducing the analytical dataset from 915 to 911 rows.

The pair `99777508` / `102404641` was retained. Both records belong to the same residential development, but the available information was insufficient to establish that they represent the same individual unit.

The deduplication decision was based on data quality and property identity, not on whether removing observations improved model performance.

### Model Reassessment

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

### Result

The cleaned dataset contains 911 observations and provides the dataset used for the next modeling stage. The next phase will extend the analysis with multiple linear regression using additional property characteristics.

### Archived datasets

Before review: [01-raw-idealista-madrid.csv](../Datasets/01-raw-idealista-madrid.csv) (915 rows). After review: [02-cleaned-housing-data.csv](../Datasets/02-cleaned-housing-data.csv) (911 rows). The same cleaned observations with encoded predictors are available in [05-model-ready-data.csv](../Datasets/05-model-ready-data.csv), and with the additional ANOVA grouping in [06-model-ready-data-with-size-groups.csv](../Datasets/06-model-ready-data-with-size-groups.csv).

File 06 differs from file 05 only by `size_range`; it does not represent another round of row removal. Reduced-column duplicate rows are retained because matching model features alone do not establish duplicate properties.

The [Multiple Linear Regression](README.md#multiple-linear-regression) phase is now completed. Model Comparison & Conclusions is next.

---

<a id="data-wrangling"></a>

## Data Wrangling

### Objective

Prepare the Madrid housing dataset for statistical analysis and regression modeling by reviewing the available variables and removing information that does not provide relevant predictive value.

### Initial Dataset

The archived original CSV contains **915 rows and 13 columns**. It has no `index` column.

The initial review focused on the meaning and usefulness of each variable for a property-price model. The objective was to distinguish actual property characteristics from identifiers, source metadata and advertiser information.

### Columns Removed

Six source metadata columns were excluded during the documented initial variable selection:

| Column | Reason for removal |
|---|---|
| `url` | Listing URL. It is metadata from the source and contains the property identifier already represented by `id`. |
| `listingUrl` | Source/search-results page used to collect the listing. It describes the data-collection source rather than the property. |
| `title` | Free-text listing title. Its information is partially duplicated by structured variables such as `address` and `typology`. It is not used in this initial structured modeling approach. |
| `id` | Idealista property identifier. Although numeric-looking, it is an identifier and has no meaningful relationship with property price. |
| `advertiserProfessionalName` | Identifies the professional, agent, office or commercial team associated with the listing rather than a characteristic of the property. Values are heterogeneous and not suitable as structural predictors. |
| `advertiserName` | Identifies the agency or advertiser. It describes who markets the property rather than the property itself and may introduce advertiser-specific effects or bias. |

### Resulting Dataset

After this first variable-selection step:

- **Original columns:** 13
- **Removed columns:** 6
- **Remaining columns:** 7

The variables retained for the next stages are:

- `price`
- `baths`
- `rooms`
- `sqft`
- `description`
- `address`
- `typology`

These variables contain information that can potentially contribute to understanding or estimating property prices.

### Data Traceability

The original dataset is preserved. The variables described above are excluded from the dataset used for statistical analysis and regression modeling, while the original data remains available for traceability and future analysis.

### Scope of This Phase

This phase covers the **initial variable selection** only. It does not yet include the treatment of missing values, outliers or other inconsistent records. Those data-quality issues will be assessed in the following analysis stages before the final models are built.

### Archived datasets

Source: [01-raw-idealista-madrid.csv](../Datasets/01-raw-idealista-madrid.csv) (915 × 13). Later cleaned export: [02-cleaned-housing-data.csv](../Datasets/02-cleaned-housing-data.csv) (911 × 7).

The seven-variable intermediate described above is not a separate supplied snapshot. File 02 also omits `description`, replaces `typology` with `Pisos` and `Independientes`, and includes the four-row reduction from the subsequent duplicate review. It should not be interpreted as the immediate output of initial variable selection alone.

---

<a id="data"></a>

## Data snapshots

The six source CSV exports are preserved byte for byte under descriptive names. Each snapshot is stored once in this folder. Numbering describes data dependencies, not the historical order in which the project analyses were performed: the mapping is an auxiliary input, and the cleaned exports already reflect the later duplicate review.

### Verified inventory

| Snapshot | Original export | Rows × columns | Verified content or relationship |
| --- | --- | ---: | --- |
| [01-raw-idealista-madrid.csv](../Datasets/01-raw-idealista-madrid.csv) | `idealista_madrid.csv` | 915 × 13 | Original listings, identifiers, descriptions, location and typology. |
| [02-cleaned-housing-data.csv](../Datasets/02-cleaned-housing-data.csv) | `idealista_madrid_Clean.csv` | 911 × 7 | Retains price, baths, rooms, sqft and address; replaces typology with Pisos and Independientes. Four fewer row occurrences than the projected raw data. |
| [03-address-district-mapping.csv](../Datasets/03-address-district-mapping.csv) | `address_to_district.csv` | 105 × 2 | Auxiliary address-to-district lookup with 105 unique addresses. This is not a housing observation snapshot derived from file 02. |
| [04-housing-with-district.csv](../Datasets/04-housing-with-district.csv) | `address_to_district_joined.csv` | 911 × 8 | Exactly the result of joining 02 to 03 on address; all 911 observations retained, with 21 districts. |
| [05-model-ready-data.csv](../Datasets/05-model-ready-data.csv) | `address_to_district_joined_prepared-2.csv` | 911 × 25 | Replaces district with 20 binary columns; omits address and Pisos. Arganzuela and Pisos are the reference categories. Numeric values are unchanged. |
| [06-model-ready-data-with-size-groups.csv](../Datasets/06-model-ready-data-with-size-groups.csv) | `address_to_district_joined_prepared_prepared_cleaned.csv` | 911 × 26 | Exactly the same 25 columns and row order as 05, plus size_range; no further rows removed. |

### Schema and data-quality checks

All processed exports have zero missing values. The raw export has one missing value. The raw file has 13 columns and no `index` column.

The two typology indicators are mutually exclusive and exhaustive: 777 rows have `Pisos = 1` and 134 have `Independientes = 1`. The district encoding was checked against the joined district labels for every row.

Full-row duplicate counts are 0, 41, 0, 41, 66 and 66 in files 01–06 respectively. Identical rows after removing listing identifiers do not by themselves prove duplicate properties. These rows have been preserved. The four removed row occurrences are consistent with the documented duplicate review; the reduced exports cannot independently establish property identity or reconstruct every Dataiku recipe.

`size_range` matches these rules on every row: Q1 - Small (`sqft <= 104`), Q2 - Medium (`104 < sqft <= 158`), Q3 - Large (`158 < sqft <= 264`), Q4 - Very Large (`sqft > 264`). The historical ANOVA used 915 observations; file 06 is its later 911-row cleaned counterpart, not the exact original ANOVA input.

The name `sqft` is retained as exported. Coefficients are expressed per recorded unit of built area; the CSV header alone does not verify a physical unit conversion. Snapshots establish their observed differences, but do not reveal transient missing values, intermediate recipes, split settings or the exact timing of each operation.

#### Exact columns

- **01-raw-idealista-madrid.csv**: `url`, `listingUrl`, `title`, `id`, `price`, `baths`, `rooms`, `sqft`, `description`, `address`, `typology`, `advertiserProfessionalName`, `advertiserName`.
- **02-cleaned-housing-data.csv**: `price`, `baths`, `rooms`, `sqft`, `address`, `Pisos`, `Independientes`.
- **03-address-district-mapping.csv**: `address`, `district`.
- **04-housing-with-district.csv**: `address`, `district`, `price`, `baths`, `rooms`, `sqft`, `Pisos`, `Independientes`.
- **05-model-ready-data.csv**: `Usera`, `Chamberí`, `San Blas-Canillejas`, `Moncloa-Aravaca`, `Barajas`, `Salamanca`, `Tetuán`, `Chamartín`, `Carabanchel`, `Villaverde`, `Latina`, `Hortaleza`, `Centro`, `Ciudad Lineal`, `Vicálvaro`, `Villa de Vallecas`, `Retiro`, `Fuencarral-El Pardo`, `Moratalaz`, `Puente de Vallecas`, `price`, `baths`, `rooms`, `sqft`, `Independientes`.
- **06-model-ready-data-with-size-groups.csv**: `Usera`, `Chamberí`, `San Blas-Canillejas`, `Moncloa-Aravaca`, `Barajas`, `Salamanca`, `Tetuán`, `Chamartín`, `Carabanchel`, `Villaverde`, `Latina`, `Hortaleza`, `Centro`, `Ciudad Lineal`, `Vicálvaro`, `Villa de Vallecas`, `Retiro`, `Fuencarral-El Pardo`, `Moratalaz`, `Puente de Vallecas`, `price`, `baths`, `rooms`, `sqft`, `size_range`, `Independientes`.

---

<a id="exploratory-analysis-anova"></a>

## Exploratory Analysis & ANOVA

### Objective

Evaluate whether residential property prices differ significantly across property-size groups.

### Initial ANOVA attempt

A first one-way ANOVA was configured directly with:

- Test variable: `price`
- Populations defined by: `sqft`

Because `sqft` is a continuous variable with many distinct values, Dataiku capped the analysis at the 10 most common surface values. This test used only 98 observations, so it was not retained as the main ANOVA for the project.

### Creating property-size groups

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

### Final one-way ANOVA

The final test was configured in Dataiku as:

- Test variable: `price`
- Populations defined by: `size_range`
- Significance level: 0.05

#### Results

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

### Interpretation

The null hypothesis states that mean property price is identical across all four size groups. Since the p-value is far below the 0.05 significance level, the null hypothesis is rejected.

The results provide strong statistical evidence that mean property prices differ across property-size groups. Mean price also rises consistently from the smallest to the largest group, showing a clear association between property size and price in this dataset.

ANOVA establishes that the group means are not all equal, but it does not quantify the expected price increase for each additional unit of surface area or establish that the relationship is linear. That relationship will be examined in the next phase using simple linear regression with `sqft` as the predictor and `price` as the target.

### Archived datasets and historical scope

The original 915-row observations are available in [01-raw-idealista-madrid.csv](../Datasets/01-raw-idealista-madrid.csv). The saved snapshot containing `size_range` is [06-model-ready-data-with-size-groups.csv](../Datasets/06-model-ready-data-with-size-groups.csv) (911 × 26), after the later duplicate review. Its cut points remain 104, 158 and 264.

The ANOVA counts and statistics reported above describe the original 915-row analysis. File 06 is the cleaned counterpart and must not be presented as the exact input that produced those historical results.

---

<a id="feature-engineering"></a>

## Feature Engineering

### Objective

Prepare the selected variables for regression modeling while preserving interpretability and avoiding unnecessary dimensionality.

### Variables Retained

The structured modeling dataset retains:

- `price` — target variable.
- `sqft` — numeric predictor representing built area.
- `rooms` — numeric predictor representing number of rooms.
- `baths` — numeric predictor representing number of bathrooms.

The variables `sqft`, `rooms` and `baths` remain numeric and are not encoded as categorical features.

### Variables Excluded

Columns not used in the initial regression model were excluded from the final modeling dataset. This includes `description`, which contains free text and would require text-processing or NLP techniques outside the scope of the current structured regression approach.

### Location Engineering

The original `address` variable contains neighborhood or area-level information with relatively high cardinality. To preserve the predictive value of location while reducing fragmentation, a new `district` variable was created using a neighborhood/area-to-district mapping table.

Using districts instead of directly encoding every `address` category reduces the number of categorical levels, avoids an excessively fragmented One-Hot representation and keeps the linear model more interpretable.

### Categorical Encoding

Two categorical variables were prepared using **One-Hot Encoding**:

- `district`
- `typology`

Empty values generated during the One-Hot Encoding step were replaced with `0`.

After the dummy variables were created, the original categorical columns were removed from the final modeling dataset:

- `address`
- `district`
- `typology`

### Reference Categories

For linear regression, one dummy variable from each categorical feature was removed to provide a reference category and avoid perfect multicollinearity among the encoded variables.

The reference categories are:

- **District:** `Arganzuela`
- **Typology:** `Pisos`

The coefficients of the remaining dummy variables can therefore be interpreted relative to these reference categories while holding the other model variables constant.

### Outliers and Special Values

No extreme values have been removed at this stage.

Records with `rooms = 0` have also been retained. Both potential outliers and these records will be evaluated during the diagnostic and modeling phases before any data-cleaning decision is made.

### Result

The feature-engineering stage produces a structured dataset suitable for regression modeling, combining numeric property characteristics with encoded district and property-type information while maintaining a clear and interpretable feature structure.

### Archived datasets

Inputs: [02-cleaned-housing-data.csv](../Datasets/02-cleaned-housing-data.csv) and the auxiliary lookup [03-address-district-mapping.csv](../Datasets/03-address-district-mapping.csv). The join produces [04-housing-with-district.csv](../Datasets/04-housing-with-district.csv) (911 × 8), and district encoding produces [05-model-ready-data.csv](../Datasets/05-model-ready-data.csv) (911 × 25).

These exports already incorporate the later duplicate review. Their comparison verifies the join and binary encodings, but cannot establish whether missing values existed temporarily during a Dataiku recipe.

---

<a id="multiple-linear-regression"></a>

## Multiple Linear Regression

### Objective and model specification

Model Madrid property prices with ordinary least squares (OLS), controlling simultaneously for built area, rooms, bathrooms, district and property type.

- Target: `price` in euros.
- Predictors: `sqft`, `rooms`, `baths`, the 20 district dummy variables and `Independientes`.
- Reference categories: Arganzuela for district and Pisos for property type.
- Excluded: `size_range`, which is used for ANOVA only. The redundant `Pisos` indicator, raw location labels and listing metadata are also excluded.
- An intercept is included.

Dataset: [05-model-ready-data.csv](../Datasets/05-model-ready-data.csv) (911 × 25). Alternatively, [06-model-ready-data-with-size-groups.csv](../Datasets/06-model-ready-data-with-size-groups.csv) contains the identical model values plus `size_range`, which must be excluded before fitting.

### Dataiku predictive evaluation

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

#### Visible Dataiku coefficients

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

### Statistical significance: separate full-dataset OLS

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

#### Why the two sets of results must remain separate

Dataiku metrics and full-dataset OLS inference are not directly identical because the evaluation split and preprocessing can differ. The exact split and preprocessing settings are not preserved in these CSVs. Dataiku's R² of 0.7141 and its visible coefficients belong to its reported model evaluation. The full-data R² of 0.6626 and the p-values above belong to the separate 911-row fit. Do not attach these p-values to Dataiku coefficients or combine the two sets into one model summary.

### Status and next step

Multiple Linear Regression is completed. Model Comparison & Conclusions is next: compare the simple and multiple models while accounting for differences in evaluation setup, and summarize predictive limitations and the main conditional price associations.

---

<a id="simple-linear-regression"></a>

## Simple Linear Regression

### Objective

Build a baseline model to quantify the relationship between property surface area and price before applying any outlier-cleaning decisions.

### Model configuration

- Independent variable (X): `sqft`
- Dependent variable (Y): `price`
- Dataiku fit: Polynomial, degree 1
- Model type: Simple linear regression

No extreme observations were removed before fitting this model.

### Results

| Metric | Result |
| --- | ---: |
| R² | 0.4648 |
| RMSE | €757,964.01 |
| Intercept | €489,872.36 |
| `sqft` coefficient | €3,685.83 |

The fitted equation is approximately:

`price = 489,872.36 + 3,685.83 × sqft`

### Interpretation

The positive `sqft` coefficient indicates that each additional unit of surface area is associated with an estimated average increase of approximately €3,685.83 in property price within this simple model.

An R² of 0.4648 means that `sqft` alone explains approximately 46.5% of the observed variation in property prices. This confirms that surface area is an important pricing factor, while also showing that a substantial part of price variation depends on characteristics not included in this baseline model, such as location, property type and other structural features.

The RMSE is approximately €757,964, indicating substantial prediction error. The fitted chart also shows observations located far from the regression line, particularly among higher surface-area and higher-price properties.

These observations have not been classified as errors or removed at this stage. The purpose of this model is to establish a baseline that can be compared with the same regression after the data-cleaning and outlier-assessment phase.

### Next step

Review potential extreme or inconsistent values in `price` and `sqft`, justify any cleaning decisions, refit the simple linear regression and compare its metrics with this baseline model.

### Archived dataset

The baseline uses `price` and `sqft` from [01-raw-idealista-madrid.csv](../Datasets/01-raw-idealista-madrid.csv) (915 observations). The later cleaned observations are available in [02-cleaned-housing-data.csv](../Datasets/02-cleaned-housing-data.csv) (911 observations); their reassessment is documented in [Data Cleaning & Model Reassessment](README.md#data-cleaning-model-reassessment).


---

## Extended project overview

# Madrid Housing Price Analysis

Analysis of residential property prices in Madrid using statistical analysis and regression models in Dataiku.

## Objective

Build a data-driven approach to understand residential property prices in Madrid, identify the main factors associated with price, and evaluate regression models for estimating market value.

## Dataset

The analysis uses a dataset of properties for sale in Madrid obtained from Idealista.

The six verified CSV snapshots are stored once in [Data](README.md#data), from the 915 × 13 raw export to the 911-row cleaned modeling exports. Each phase links to the relevant dataset. Snapshot numbering follows data dependencies; the existing phase order records the analytical workflow.

Key variables include:

- `price`: property price in euros
- `sqft`: built area
- `rooms`: number of rooms
- `baths`: number of bathrooms
- `address`: location or area
- `typology`: property type
- `description`: property description

## Project Workflow

The project is structured as a progressive data analysis workflow:

1. **Data Wrangling** — review the dataset structure, select relevant variables and remove non-predictive metadata.
2. **Feature Engineering** — prepare numeric and categorical predictors, engineer district-level location information and encode categorical variables for regression modeling.
3. **Exploratory Analysis & ANOVA** — completed. Property size was divided into four quartile-based groups and a one-way ANOVA confirmed statistically significant differences in mean price across the groups.
4. **Simple Linear Regression** — completed. A baseline `price ~ sqft` model produced R² = 0.4648 and RMSE ≈ €757,964 before cleaning decisions.
5. **Data Cleaning & Model Reassessment** — completed. Potential outliers and duplicate listings were reviewed. Four confirmed duplicate property representations were removed, reducing the dataset from 915 to 911 observations. The refitted simple regression produced R² = 0.4973 and RMSE ≈ €716,614.
6. **[Multiple Linear Regression](README.md#multiple-linear-regression)** — completed. Dataiku OLS achieved R² = 0.7141 and RMSE ≈ €538,900. The phase separately documents statistical inference from a full-dataset OLS fit.
7. **Model Comparison & Conclusions** — next. Compare the models, interpret the results and determine which approach is most useful for estimating Madrid housing prices.

## Multiple-regression results

The reported Dataiku multiple OLS evaluation obtained:

| Metric | Result |
| --- | ---: |
| R² | 0.7141 |
| RMSE | approximately €538,900 |
| MAE | approximately €339,300 |
| MAPE | 34.40% |

## Interpretation and limitations

Property size, bathrooms and district are important parts of the documented price analysis. The multiple model describes conditional relationships; these are not causal effects.

A separate full-dataset OLS fit on 911 observations obtained R² = 0.6626 and supplies the inferential statistics in the detailed notes. Those statistics must not be attached to the Dataiku coefficients. The archived CSVs do not preserve the exact Dataiku split and preprocessing, so the evaluation cannot be independently reproduced from those files alone. Simple and multiple results should not be treated as a controlled model comparison until their evaluation setups are aligned. Final Model Comparison & Conclusions remains pending.

## Tools

- Dataiku
- Statistical analysis
- ANOVA
- Linear regression

## Status

**In progress — Multiple Linear Regression completed. Next: Model Comparison & Conclusions.**

## Explore this project

- [Detailed methodology and experiment notes](README.md)
- [Archived datasets](../Datasets/)
- [Project catalogue](../../../README.md)
