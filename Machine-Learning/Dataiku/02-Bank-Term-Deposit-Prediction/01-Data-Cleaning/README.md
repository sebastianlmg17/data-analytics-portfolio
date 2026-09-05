# Data Cleaning

## Overview

This section documents the data cleaning process performed before training the machine learning models.

The objective was to ensure that the dataset was consistent, complete and suitable for predictive modeling while preserving as much useful information as possible.

---

## Original Dataset

The original dataset contains customer demographic information, financial attributes and historical marketing campaign data collected by a Portuguese banking institution.

The original dataset is included in this folder as:

- `bank-full.csv`

---

## Cleaning Process

The following steps were performed:

- Reviewed every variable individually.
- Verified data types.
- Checked for missing and inconsistent values.
- Evaluated each feature based on its business relevance.
- Preserved variables that could provide predictive value.
- Removed variables that could introduce data leakage.

---

## Removed Features

### duration

The **duration** variable was removed before model training.

This feature represents the duration of the phone call made during the marketing campaign.

Although it is highly correlated with the target variable, this information is only available **after** the call has finished.

Keeping this variable would introduce **data leakage**, allowing the model to learn from information that would not be available when making real-world predictions.

---

## Clean Dataset

The cleaned dataset is included in this folder as:

- `bank-full_clean.csv`

This dataset was used as the starting point for feature engineering and model development.

---

## Outcome

The cleaning process produced a dataset ready for machine learning while maintaining data quality and preventing information leakage.
