# Original Model

## Overview

The original model was trained using the **original training dataset**, preserving the natural class distribution of the target variable.

This experiment served as the **baseline** for evaluating whether class balancing techniques such as Oversampling and Undersampling could improve predictive performance.

---

## Dataset

The model was trained using the original training dataset obtained after the Train/Test Split.

No sampling techniques were applied before training.

This allowed the models to learn directly from the original distribution of customer responses.

---

## Models Evaluated

Two classification algorithms were trained:

* Random Forest
* Logistic Regression

Both models were evaluated using the same testing dataset later used for the Oversampling and Undersampling experiments, ensuring a fair comparison between the three training strategies.

---

## Evaluation Metrics

Model performance was measured using:

* ROC AUC
* Accuracy
* Precision
* Recall
* F1-Score

These metrics provide a broader evaluation of classification performance than relying on Accuracy alone, particularly because the target variable presents class imbalance.

---

## Results

The original training experiment produced the following results:

| Model               |    ROC AUC |   Accuracy |  Precision |     Recall |   F1-Score |
| ------------------- | ---------: | ---------: | ---------: | ---------: | ---------: |
| Random Forest       | **0.9283** | **0.8975** | **0.5537** | **0.6609** | **0.6026** |
| Logistic Regression |     0.8940 |          — |          — |          — |          — |

The Random Forest model achieved a ROC AUC of **0.9283**, together with an Accuracy of **0.8975**, Precision of **0.5537**, Recall of **0.6609**, and an F1-Score of **0.6026**.

These results provided the strongest overall performance among the Random Forest experiments conducted in the project.

---

## Comparison with Sampling Experiments

The Random Forest ROC AUC obtained with each training strategy was:

| Training Strategy |    ROC AUC |
| ----------------- | ---------: |
| Original Dataset  | **0.9283** |
| Oversampling      |     0.7982 |
| Undersampling     |     0.8026 |

Neither Oversampling nor Undersampling improved the Random Forest model compared with training on the original class distribution.

---

## Conclusion

The **Random Forest model trained on the original dataset** was selected as the final model for this stage of the project.

The experiments demonstrated that applying class balancing techniques did not automatically lead to better predictive performance.

For this dataset, preserving the original training information produced better results than either duplicating minority-class observations through Oversampling or removing majority-class observations through Undersampling.

This comparison reinforces the importance of evaluating preprocessing strategies empirically rather than assuming that balancing an imbalanced dataset will necessarily improve model performance.


## Conclusion

The original model was selected as the final model for this project.

The experiments demonstrated that, for this dataset, preserving the original class distribution produced better predictive performance than applying class balancing techniques.

This highlights the importance of validating different approaches instead of assuming that sampling techniques will always improve machine learning models.
