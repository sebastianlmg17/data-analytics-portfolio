
# 03 - Model Training

## Objective

Train and compare machine learning models using the prepared dataset to identify the algorithm that best predicts passenger survival.

---

## Dataset

| Metric | Value |
|--------|------:|
| Input Dataset | feature_engineered_dataset.csv |
| Train/Test Split | 80% / 20% |
| Training Samples | 713 |
| Testing Samples | 178 |

---

## Models Trained

- Random Forest
- Logistic Regression

---

## Selected Model

**Random Forest** achieved the best overall performance and was selected as the final model.

---

## Model Performance

| Metric | Value |
|--------|------:|
| ROC AUC | 0.8564 |
| Accuracy | 0.8258 |
| Precision | 0.7714 |
| Recall | 0.7826 |
| F1-Score | 0.7770 |

---

## Training Summary

- Dataset split into training and testing sets (80/20).
- Two classification models were trained and compared.
- Random Forest achieved the highest ROC AUC and was selected as the final model.
- Feature importance analysis identified the variables with the greatest impact on survival prediction.

---

## Conclusion

The Random Forest model demonstrated strong predictive performance and was selected as the best-performing algorithm for this project. The trained model will be evaluated further in the next stage using additional performance analysis and prediction results.
