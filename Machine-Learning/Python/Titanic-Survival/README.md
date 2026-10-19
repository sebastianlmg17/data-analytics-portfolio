# Titanic Survival Prediction

**Code: [Main analysis and models](titanic_analysis.ipynb) · [Tree experiments](titanic_survival_prediction.ipynb)**

## Overview

Passenger-survival classification using 891 Titanic records.

## Objective

Compare Logistic Regression, Decision Tree and Random Forest.

## Tools

Python · Pandas · NumPy · Matplotlib · Scikit-learn · Jupyter. Code developed with assistance from **CODEX**.

## Methodology at a glance

Passenger features, missing-value handling, one-hot encoding, stratified 80/20 splits and cross-validation. The notebooks use different preparation workflows.

## Results and current limits

Main-analysis Logistic Regression: accuracy **0.8315**, F1 **0.7619**, ROC AUC **0.8720**. Results are exploratory: both notebooks use full-data EDA; the tree notebook reuses its evaluation subset and preprocesses before CV. Different passenger subsets prevent comparison across notebooks.

## Explore this project

- [Methodology, full results and reproduction commands](Project%20Documentation/)
- [Dataset and provenance](Data/README.md)
- [Pinned dependencies](requirements.txt)
