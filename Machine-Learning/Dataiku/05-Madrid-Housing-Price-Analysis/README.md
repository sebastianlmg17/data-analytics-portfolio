# Madrid Housing Price Analysis

Analysis of residential property prices in Madrid using statistical analysis and regression models in Dataiku.

## Objective

Identify the relationship between property size and sale price, evaluate the impact of data quality on model performance, and determine which property characteristics are most relevant for estimating housing prices.

## Dataset

The analysis uses a dataset of properties for sale in Madrid obtained from Idealista.

Key variables include:

- `price`: sale price in euros
- `sqft`: built area in square meters
- `rooms`: number of rooms
- `baths`: number of bathrooms
- `typology`: property type
- `address`: location or area
- Other property and listing characteristics

## Analysis

The project follows these steps:

1. Dataset exploration and data quality assessment
2. ANOVA analysis of price and property size
3. Simple linear regression using `sqft` to predict `price`
4. Data cleaning and model re-evaluation
5. Multiple linear regression using relevant property characteristics
6. Comparison of models and interpretation of results

## Data Cleaning & Preparation

The initial data quality review identified several columns that do not provide relevant predictive information for estimating property prices.

The following columns were excluded from the modeling dataset:

- `index`: record index with no predictive meaning.
- `url`: property listing URL; the property identifier is already represented by `id`.
- `listingUrl`: source listing page used to collect the property.
- `title`: free-text listing title, with information partially duplicated by structured variables such as `address` and `typology`.
- `id`: Idealista property identifier, used for record identification rather than prediction.
- `advertiserProfessionalName`: professional, agent, office or commercial team associated with the listing.
- `advertiserName`: agency or advertiser associated with the listing.

The last two variables were excluded because they describe the advertiser rather than the characteristics of the property. Their values are heterogeneous, including individual professionals, agencies, offices and generic commercial departments.

These variables are excluded from the dataset used for statistical analysis and regression modeling, while the original dataset is preserved for traceability.

## Tools

- Dataiku
- Statistical analysis
- Linear regression
- ANOVA

## Results

Results and conclusions will be added after completing the analysis.
