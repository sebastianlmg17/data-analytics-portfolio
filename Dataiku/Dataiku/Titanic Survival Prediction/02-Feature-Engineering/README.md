# 02 - Feature Engineering

## Objective

Transform the cleaned dataset into a machine learning-ready dataset by converting categorical variables into numerical features.

---

## Dataset

| Metric | Value |
|--------|------:|
| Input Dataset | train_clean.csv |
| Output Dataset | feature_engineered_dataset.csv |

---

## Feature Engineering Summary

| Feature | Transformation |
|----------|----------------|
| Sex | One-Hot Encoding |
| Embarked | One-Hot Encoding |
| Name | Removed |

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

The dataset has been transformed into a numerical format suitable for machine learning algorithms and is ready for train-test splitting and model training.
