# Titanic Survival Prediction

## Overview

Compare passenger-survival classifiers using 891 Titanic records and two Python notebooks.

## Objective

Predict `Survived` and assess feature preparation, tree regularization and model-selection tradeoffs.

## Tools

Python · Pandas · NumPy · Matplotlib · Scikit-learn · Jupyter notebooks. The code was developed with assistance from **CODEX**.

## Methodology at a glance

Explore passenger data, engineer family-size and title features, and compare Logistic Regression, Decision Tree and Random Forest with stratified 80/20 splits and cross-validation searches. The notebooks preserve separate preparation and evaluation workflows.

## Results and current limits

Analysis-notebook Logistic Regression: accuracy **0.8315**, precision **0.8276**, recall **0.7059**, F1 **0.7619** and ROC AUC **0.8720**. These are exploratory results: full-dataset EDA precedes splitting, the tree notebook reuses its evaluation subset and preprocesses before CV, and different row-filtering orders prevent direct comparison between notebooks. No independent final evaluation is claimed.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Analysis and pipeline baselines](titanic_analysis.ipynb)
- [Tree experiments](titanic_survival_prediction.ipynb)
- [Dataset and provenance](Data/README.md)
- [Dependencies](requirements.txt)
- [Dataiku counterpart](../../Dataiku/Titanic-Survival/)
- [Machine Learning catalogue](../../README.md)
