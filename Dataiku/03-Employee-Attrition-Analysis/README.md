# Employee Attrition Prediction

## Project Overview

Machine Learning project developed in **Dataiku** using the IBM HR Analytics Employee Attrition dataset.

The objective is to analyze employee attrition and build a Machine Learning model capable of predicting whether an employee is likely to leave the company.

The project covers data preparation, class imbalance handling, model training, cross-validation, hyperparameter optimization and model comparison.

## Dataset

The IBM HR Analytics Employee Attrition dataset contains **1,470 employee records**. The target variable is `Attrition`, with approximately **83% of employees remaining** at the company and **17% leaving**.

## Data Preparation

The dataset was prepared in Dataiku by removing variables without useful predictive information, converting `Attrition` from `Yes/No` to `1/0`, applying One-Hot Encoding to categorical variables, handling empty values generated during encoding, reviewing numerical variables and splitting the data into **80% training and 20% test data**.

The test dataset was kept separate throughout the modeling process and was not resampled.

## Class Imbalance

Three training approaches were evaluated:

* Original training dataset
* Oversampling of the minority class
* Undersampling of the majority class

Oversampling and undersampling were implemented using **Python Recipes with Pandas and `sklearn.utils.resample`**. The same original test dataset was used to compare the approaches.

## Machine Learning

Initial Decision Tree models were trained using the original, oversampled and undersampled training datasets. The experiments showed that Oversampling improved Recall and F1-Score compared with the original Decision Tree, while Undersampling achieved the highest Recall but generated substantially more false positives.

The initial Oversampled Decision Tree achieved:

* Accuracy: **80.95%**
* Precision: **51.28%**
* Recall: **68.97%**
* F1-Score: **58.82%**
* ROC AUC: **80.94%**

## Model Optimization

The initial Decision Tree was subsequently compared with optimized Machine Learning approaches using **5-Fold Stratified Cross-Validation** and **Hyperparameter Optimization**.

The models evaluated on the original training dataset were:

* Decision Tree
* Logistic Regression
* Random Forest

The final test-set comparison was:

| Model | Accuracy | Precision | Recall | F1-Score | ROC AUC |
|---|---:|---:|---:|---:|---:|
| Decision Tree + Oversampling | 80.95% | 51.28% | 68.97% | 58.82% | 80.94% |
| Optimized Decision Tree | 74.49% | 40.86% | 65.52% | 50.33% | 74.09% |
| **Logistic Regression** | **87.76%** | **77.50%** | 53.45% | **63.27%** | **86.27%** |
| Random Forest | 78.91% | 47.44% | 63.79% | 54.41% | 79.19% |

## Methodological Consideration

During the optimization process, it was identified that applying Oversampling before Cross-Validation can introduce **data leakage between folds**, because duplicated observations may appear in both training and validation folds.

For this reason, the subsequent optimization was performed using the **original training dataset**, with Cross-Validation and model optimization applied without pre-resampling the full training data.

## Final Model

**Logistic Regression** was selected as the final model.

It achieved the highest:

* Accuracy: **87.76%**
* Precision: **77.50%**
* F1-Score: **63.27%**
* ROC AUC: **86.27%**

Although the Decision Tree with Oversampling achieved higher Recall, Logistic Regression provided the best overall balance among the evaluated models, particularly in Precision, F1-Score and ROC AUC.

## Next Step

A final interpretative analysis of employee characteristics and their relationship with attrition will be performed in Dataiku before the project is considered complete.

## Tools

**Dataiku · Python · Pandas · Scikit-learn · Machine Learning**
