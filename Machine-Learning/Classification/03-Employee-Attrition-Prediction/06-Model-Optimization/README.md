# Model Optimization

## Overview

The initial Decision Tree model showed limited performance. A model optimization process was therefore carried out to improve the predictive performance and obtain a more robust evaluation.

## Methodology

A **5-Fold Stratified Cross-Validation** approach was used together with **Hyperparameter Optimization**.

Different Machine Learning algorithms were tested using the original training dataset:

* Decision Tree
* Logistic Regression
* Random Forest

The test dataset remained unchanged and was used for the final evaluation of each model.

## Model Comparison

| Model                        |   Accuracy |  Precision | Recall |   F1-Score |    ROC AUC |
| ---------------------------- | ---------: | ---------: | -----: | ---------: | ---------: |
| Decision Tree + Oversampling |     80.95% |     51.28% | 68.97% |     58.82% |     80.94% |
| Optimized Decision Tree      |     74.49% |     40.86% | 65.52% |     50.33% |     74.09% |
| **Logistic Regression**      | **87.76%** | **77.50%** | 53.45% | **63.27%** | **86.27%** |
| Random Forest                |     78.91% |     47.44% | 63.79% |     54.41% |     79.19% |

## Final Model

**Logistic Regression** was selected as the final model.

It achieved the highest:

* Accuracy: **87.76%**
* Precision: **77.50%**
* F1-Score: **63.27%**
* ROC AUC: **86.27%**

The model provided the best overall balance among the approaches tested, particularly in terms of Precision, F1-Score and ROC AUC.

## Conclusion

The optimization process showed that the initial Decision Tree was not the best approach for this dataset.

Although the Decision Tree with Oversampling improved the detection of the minority class, the optimized Logistic Regression model provided substantially better overall performance.

The final model was therefore selected based on the combination of predictive performance and the business objective of identifying employee attrition.

