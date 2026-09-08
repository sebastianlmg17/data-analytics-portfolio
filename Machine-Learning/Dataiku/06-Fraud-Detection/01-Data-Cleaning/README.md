# 01 - Data Cleaning

## Purpose

This stage documents the initial data-quality review and the cleaning decisions applied before feature engineering and model training.

## Initial Quality Review

The original dataset contains 10,000 transactions and 11 columns.

- No missing values were detected.
- No exact duplicate rows were detected.
- No infinite numerical values were detected.
- No constant variables were detected.
- The target `es_fraude` contains 7,000 legitimate transactions (70%) and 3,000 fraudulent transactions (30%).

## Cleaning Decisions

### 1. Remove `id_transaccion`

`id_transaccion` is a unique transaction identifier and does not represent a meaningful behavioral or financial characteristic of a transaction.

The exploratory analysis also found that IDs 1-7,000 correspond exactly to `es_fraude = 0`, while IDs 7,001-10,000 correspond exactly to `es_fraude = 1`. Keeping this field would therefore introduce a severe risk of data leakage and allow a model to exploit the construction of the dataset instead of learning genuine fraud patterns.

**Decision:** remove the entire `id_transaccion` column before model training.

### 2. Remove negative `distancia_ip` records

The case-study documentation defines `distancia_ip` as the estimated geographic distance between the origin IP and destination IP. A geographic distance cannot logically be negative.

- Negative records: 131
- Share of original dataset: 1.31%

Because the affected proportion is small and there is no reliable information with which to reconstruct the true distance, these values will not be imputed using a mean or median.

**Decision:** remove rows where `distancia_ip < 0`.

### 3. Remove negative `monto` records

The dataset documentation defines `monto` as the transaction amount in dollars. It does not provide a documented interpretation for negative amounts, such as refunds or accounting reversals.

- Negative records: 56
- Share of original dataset: 0.56%

Without information about the true amount or the reason for the negative sign, replacing these values with a mean, median or absolute value would introduce unsupported assumptions.

**Decision:** remove rows where `monto < 0`.

### Combined row removal

One transaction contains both a negative amount and a negative IP distance. Therefore, the two filters remove 186 unique rows rather than 187.

- Original rows: 10,000
- Rows removed: 186
- Remaining rows: 9,814
- Data retained: 98.14%

## Outliers

Statistical outliers are intentionally retained. In fraud detection, unusually high amounts, transaction frequencies, elapsed times or geographic distances may represent meaningful fraud behavior rather than data errors. Removing them solely because they are statistically extreme could discard valuable predictive information.

## Not Part of This Stage

The following actions are deferred to feature engineering/model preprocessing:

- Feature scaling or normalization
- Encoding categorical variables
- Treatment of class imbalance
- Model-specific transformations

This separation keeps data cleaning focused on clear data-quality inconsistencies rather than predictive transformations.
