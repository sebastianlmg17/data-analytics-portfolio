# 01 - Data Cleaning

## Objective

Prepare the original Titanic dataset for machine learning by handling missing values, removing irrelevant features, and improving overall data quality.

---

## Dataset

| Metric           | Value |
| ---------------- | ----: |
| Original Rows    |   891 |
| Original Columns |    12 |
| Final Rows       |   891 |
| Final Columns    |     9 |

---

## Cleaning Summary

| Feature     | Action                                  |
| ----------- | --------------------------------------- |
| Age         | Missing values imputed using the median |
| Embarked    | Missing values imputed using the mode   |
| Cabin       | Removed (77% missing values)            |
| Ticket      | Removed (high-cardinality identifier)   |
| PassengerId | Removed (unique identifier)             |

---

## Final Features

* Survived
* Pclass
* Name
* Sex
* Age
* SibSp
* Parch
* Fare
* Embarked

---

## Conclusion

The dataset is now clean, complete, and ready for the next phase of the project: **Exploratory Data Analysis (EDA)**.

