# 02 - Feature Engineering

## Objective

Transform the cleaned Titanic dataset into a numerical format suitable for machine learning.

---

## Dataset

| Metric | Value |
|---|---|
| Input Dataset | train_clean.csv |
| Output Dataset | feature_engineered_dataset.csv |

---

## Feature Engineering Summary

| Feature | Transformation | Reason |
|---|---|---|
| Sex | One-Hot Encoding | Convert the categorical variable into numerical features |
| Embarked | One-Hot Encoding | Convert the categorical variable into numerical features |
| Name | Removed | Not used as a predictive feature in this project |
| Age | No scaling applied | Values were considered suitable for the selected tree-based model |
| Fare | No scaling applied | Values were considered suitable for the selected tree-based model |
| SibSp | No transformation | Kept as provided |
| Parch | No transformation | Kept as provided |

No oversampling or undersampling was applied during this phase.

---

## Final Features

- Survived
- Pclass
- Male_Passengers
- Female_Passengers
- Age
- SibSp
- Parch
- Fare
- Embarked_C
- Embarked_Q
- Embarked_S

---

## Conclusion

The cleaned dataset was transformed into a numerical format and prepared for the subsequent train-test split and model training stages.
