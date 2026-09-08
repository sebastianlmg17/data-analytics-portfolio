# Madrid Housing Price Analysis

Analysis of residential property prices in Madrid using statistical analysis and regression models in Dataiku.

## Objective

Build a data-driven approach to understand residential property prices in Madrid, identify the main factors associated with price, and evaluate regression models for estimating market value.

## Dataset

The analysis uses a dataset of properties for sale in Madrid obtained from Idealista.

Key variables include:

- `price`: property price in euros
- `sqft`: built area in square meters
- `rooms`: number of rooms
- `baths`: number of bathrooms
- `address`: location or area
- `typology`: property type
- `description`: property description

## Project Workflow

The project is structured as a progressive data analysis workflow:

1. **Data Wrangling** — review the dataset structure, select relevant variables, remove non-predictive metadata and prepare the modeling dataset.
2. **Exploratory Analysis & ANOVA** — examine the relationship between property size and price and evaluate whether price differs significantly across size groups.
3. **Simple Linear Regression** — model `price` using `sqft` as the independent variable and evaluate the statistical significance and explanatory power of the model.
4. **Data Cleaning & Model Reassessment** — identify and address relevant data-quality issues, refit the simple regression model and compare the results with the initial model.
5. **Multiple Linear Regression** — incorporate relevant numeric and categorical property characteristics to evaluate a more complete pricing model.
6. **Model Comparison & Conclusions** — compare the models, interpret the results and determine which approach is most useful for estimating Madrid housing prices.

## Project Structure

```text
05-Madrid-Housing-Price-Analysis/
├── README.md
└── Data-Wrangling/
    └── README.md
```

Each phase will document the decisions made, the methodology applied and the relevant results. Additional project artifacts will be added as the analysis progresses.

## Tools

- Dataiku
- Statistical analysis
- ANOVA
- Linear regression

## Status

**In progress — Data Wrangling phase**
