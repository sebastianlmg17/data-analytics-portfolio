# Titanic Survival Prediction

## Project Overview

This project demonstrates an end-to-end machine learning workflow using the Titanic dataset in Dataiku. The objective is to build a classification model capable of predicting passenger survival based on demographic and travel-related features.

The project documents the main stages completed so far, from data cleaning and feature engineering to model training.

---

## Project Workflow

- Data Cleaning
- Feature Engineering
- Train/Test Split
- Model Training
- Model Evaluation
- Final Results

> Model Evaluation and Final Results are prepared as the next stages of the project and are not yet documented as completed phases.

---

## Technologies Used

- Dataiku DSS
- Machine Learning
- Random Forest
- Logistic Regression
- Data Preparation
- GitHub

---

## Dataset and evaluation

The target is `Survived`. The feature-engineered passenger dataset was split into 713 training observations and 178 test observations (approximately 80/20). Random Forest and Logistic Regression were compared; no oversampling or undersampling was applied.

## Results obtained so far

Random Forest was selected as the strongest model at the documented training stage.

| Metric | Random Forest |
| --- | ---: |
| ROC AUC | 0.8564 |
| Accuracy | 0.8258 |
| Precision | 0.7714 |
| Recall | 0.7826 |
| F1-score | 0.7770 |

## Conclusion and current limits

This introductory project demonstrates passenger feature preparation and comparison of two binary classifiers. These are the reported training-stage evaluation results; the later evaluation and final-results phases remain unfinished. Published data snapshots and images support the documentation, but an executable Dataiku project export is not included.


---

## Project Goal

Develop a complete and reproducible machine learning project, documenting the decisions and results at each stage of the workflow from the original dataset to the final predictive results.

---

## Author

Sebastián Leo Martínez

## Explore this project

- [Detailed methodology and experiment notes](docs/methodology.md)
- [Archived datasets](data/)
- [Published images](images/)
- [Project catalogue](../../README.md)
