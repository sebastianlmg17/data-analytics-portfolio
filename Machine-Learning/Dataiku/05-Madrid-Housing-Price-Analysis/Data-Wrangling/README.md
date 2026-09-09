# Data Wrangling

## Objective

Prepare the Madrid housing dataset for statistical analysis and regression modeling by reviewing the available variables and removing information that does not provide relevant predictive value.

## Initial Dataset

The archived original CSV contains **915 rows and 13 columns**. It has no `index` column.

The initial review focused on the meaning and usefulness of each variable for a property-price model. The objective was to distinguish actual property characteristics from identifiers, source metadata and advertiser information.

## Columns Removed

Six source metadata columns were excluded during the documented initial variable selection:

| Column | Reason for removal |
|---|---|
| `url` | Listing URL. It is metadata from the source and contains the property identifier already represented by `id`. |
| `listingUrl` | Source/search-results page used to collect the listing. It describes the data-collection source rather than the property. |
| `title` | Free-text listing title. Its information is partially duplicated by structured variables such as `address` and `typology`. It is not used in this initial structured modeling approach. |
| `id` | Idealista property identifier. Although numeric-looking, it is an identifier and has no meaningful relationship with property price. |
| `advertiserProfessionalName` | Identifies the professional, agent, office or commercial team associated with the listing rather than a characteristic of the property. Values are heterogeneous and not suitable as structural predictors. |
| `advertiserName` | Identifies the agency or advertiser. It describes who markets the property rather than the property itself and may introduce advertiser-specific effects or bias. |

## Resulting Dataset

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

## Data Traceability

The original dataset is preserved. The variables described above are excluded from the dataset used for statistical analysis and regression modeling, while the original data remains available for traceability and future analysis.

## Scope of This Phase

This phase covers the **initial variable selection** only. It does not yet include the treatment of missing values, outliers or other inconsistent records. Those data-quality issues will be assessed in the following analysis stages before the final models are built.

## Archived datasets

Source: [01-raw-idealista-madrid.csv](../Data/01-raw-idealista-madrid.csv) (915 × 13). Later cleaned export: [02-cleaned-housing-data.csv](../Data/02-cleaned-housing-data.csv) (911 × 7).

The seven-variable intermediate described above is not a separate supplied snapshot. File 02 also omits `description`, replaces `typology` with `Pisos` and `Independientes`, and includes the four-row reduction from the subsequent duplicate review. It should not be interpreted as the immediate output of initial variable selection alone.
