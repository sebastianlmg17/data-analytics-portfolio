# Madrid Housing Price Analysis

Analysis of residential property prices in Madrid using statistical analysis and regression models in Dataiku.

## Objective

Build a data-driven approach to understand residential property prices in Madrid, identify the main factors associated with price, and evaluate regression models for estimating market value.

## Dataset

The analysis uses a dataset of properties for sale in Madrid obtained from Idealista.

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
6. **Multiple Linear Regression** — next. Incorporate relevant numeric and categorical property characteristics to evaluate a more complete pricing model.
7. **Model Comparison & Conclusions** — compare the models, interpret the results and determine which approach is most useful for estimating Madrid housing prices.

## Project Structure

```text
05-Madrid-Housing-Price-Analysis/
├── README.md
├── Data-Wrangling/
│   └── README.md
├── Feature-Engineering/
│   └── README.md
├── Exploratory-Analysis-ANOVA/
│   └── README.md
├── Simple-Linear-Regression/
│   └── README.md
└── Data-Cleaning-Model-Reassessment/
    └── README.md
```

Each phase documents the decisions made, the methodology applied and the relevant results. Additional project artifacts will be added as the analysis progresses.

## Tools

- Dataiku
- Statistical analysis
- ANOVA
- Linear regression

## Status

**In progress — Data Cleaning & Model Reassessment completed. Next: Multiple Linear Regression.**
