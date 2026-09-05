# 01 - Data Cleaning

## Objective

Prepare the original Titanic dataset for machine learning by handling missing values and removing features that were not considered useful for this project.

---

## Dataset

| Metric | Value |
|---|---:|
| Original Rows | 891 |
| Original Columns | 12 |
| Final Rows | 891 |
| Final Columns | 9 |

---

## Cleaning Summary

| Feature | Action | Reason |
|---|---|---|
| Age | Missing values replaced with the median | Preserve the variable while avoiding distortion from extreme values |
| Embarked | Missing values replaced with the mode | Small number of missing categorical values |
| Cabin | Removed | Large proportion of missing values (77%) |
| Ticket | Removed | High-cardinality alphanumeric field not used in this project |
| PassengerId | Removed | Unique identifier with no predictive purpose |

No rows were removed during cleaning.

---

## Final Features

- Survived
- Pclass
- Name
- Sex
- Age
- SibSp
- Parch
- Fare
- Embarked

---

## Conclusion

The dataset was cleaned while preserving all 891 passenger records. The resulting dataset was used as the input for the Feature Engineering phase.
