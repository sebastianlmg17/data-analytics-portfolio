# Methodology and experiment notes

[Project overview](../README.md)

## Contents

- [01 - Data Cleaning](#01-data-cleaning)
- [02 - Feature Engineering](#02-feature-engineering)
- [Data](#02-feature-engineering-data)
- [03 - Model Training](#03-model-training)

---

<a id="01-data-cleaning"></a>

## 01 - Data Cleaning

### Objective

Prepare the original Titanic dataset for machine learning by handling missing values and removing features that were not considered useful for this project.

---

### Dataset

| Metric | Value |
|---|---:|
| Original Rows | 891 |
| Original Columns | 12 |
| Final Rows | 891 |
| Final Columns | 9 |

---

### Cleaning Summary

| Feature | Action | Reason |
|---|---|---|
| Age | Missing values replaced with the median | Preserve the variable while avoiding distortion from extreme values |
| Embarked | Missing values replaced with the mode | Small number of missing categorical values |
| Cabin | Removed | Large proportion of missing values (77%) |
| Ticket | Removed | High-cardinality alphanumeric field not used in this project |
| PassengerId | Removed | Unique identifier with no predictive purpose |

No rows were removed during cleaning.

---

### Final Features

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

### Conclusion

The dataset was cleaned while preserving all 891 passenger records. The resulting dataset was used as the input for the Feature Engineering phase.

---

<a id="02-feature-engineering"></a>

## 02 - Feature Engineering

### Objective

Transform the cleaned Titanic dataset into a numerical format suitable for machine learning.

---

### Dataset

| Metric | Value |
|---|---|
| Input Dataset | train_clean.csv |
| Output Dataset | feature_engineered_dataset.csv |

---

### Feature Engineering Summary

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

### Final Features

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

### Conclusion

The cleaned dataset was transformed into a numerical format and prepared for the subsequent train-test split and model training stages.

---

<a id="02-feature-engineering-data"></a>

## Data

This folder contains the dataset generated during the Feature Engineering phase.

### Files

| File | Description |
|------|-------------|
| feature_engineered_dataset.csv | Dataset after applying feature engineering transformations, ready for train-test splitting and model training. |

---

<a id="03-model-training"></a>

## 03 - Model Training

### Objective

Train and compare classification models using the feature-engineered Titanic dataset to identify the best-performing approach for predicting passenger survival.

---

### Dataset

| Metric | Value |
|---|---:|
| Input Dataset | feature_engineered_dataset.csv |
| Train/Test Split | 80% / 20% |
| Training Samples | 713 |
| Testing Samples | 178 |

The train/test split was performed before model training. The test set was kept separate from the training process for later evaluation.

---

### Models Trained

- Random Forest
- Logistic Regression

Both models were trained as binary classification models using the `Survived` variable as the target.

---

### Best-Performing Model

**Random Forest** achieved the best overall performance among the models trained and was therefore selected as the best-performing approach at this stage.

---

### Random Forest Performance

| Metric | Value |
|---|---:|
| ROC AUC | 0.8564 |
| Accuracy | 0.8258 |
| Precision | 0.7714 |
| Recall | 0.7826 |
| F1-Score | 0.7770 |

---

### Training Summary

- The feature-engineered dataset was divided into training and testing sets using an 80/20 split.
- Random Forest and Logistic Regression were trained and compared.
- Random Forest achieved the highest ROC AUC among the models trained.
- Feature importance was examined to identify the variables contributing most to the Random Forest predictions.
- No oversampling or undersampling was applied in this project.

---

### Conclusion

Random Forest was the best-performing model among the approaches trained in this stage. Further model evaluation and final prediction analysis are reserved for the following stages of the project.
