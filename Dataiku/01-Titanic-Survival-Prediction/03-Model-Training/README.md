# 03 - Model Training

## Objective

Train and compare classification models using the feature-engineered Titanic dataset to identify the best-performing approach for predicting passenger survival.

---

## Dataset

| Metric | Value |
|---|---:|
| Input Dataset | feature_engineered_dataset.csv |
| Train/Test Split | 80% / 20% |
| Training Samples | 713 |
| Testing Samples | 178 |

The train/test split was performed before model training. The test set was kept separate from the training process for later evaluation.

---

## Models Trained

- Random Forest
- Logistic Regression

Both models were trained as binary classification models using the `Survived` variable as the target.

---

## Best-Performing Model

**Random Forest** achieved the best overall performance among the models trained and was therefore selected as the best-performing approach at this stage.

---

## Random Forest Performance

| Metric | Value |
|---|---:|
| ROC AUC | 0.8564 |
| Accuracy | 0.8258 |
| Precision | 0.7714 |
| Recall | 0.7826 |
| F1-Score | 0.7770 |

---

## Training Summary

- The feature-engineered dataset was divided into training and testing sets using an 80/20 split.
- Random Forest and Logistic Regression were trained and compared.
- Random Forest achieved the highest ROC AUC among the models trained.
- Feature importance was examined to identify the variables contributing most to the Random Forest predictions.
- No oversampling or undersampling was applied in this project.

---

## Conclusion

Random Forest was the best-performing model among the approaches trained in this stage. Further model evaluation and final prediction analysis are reserved for the following stages of the project.
