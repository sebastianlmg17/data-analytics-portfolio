# Titanic Survival Prediction · Python

## Overview

A standalone Python learning project for passenger-survival classification. Two notebooks document exploratory analysis, feature engineering and classifier comparisons. This complements the [Dataiku workflow](../../Dataiku/Titanic-Survival/) with executable Python experiments.

## Objective

Predict `Survived` from passenger and travel-related features, and examine how preprocessing and evaluation choices affect the credibility of a model comparison.

## Tools

Python, pandas, NumPy, Matplotlib, scikit-learn and Jupyter. Dependencies are listed in [requirements.txt](requirements.txt); the environment is not locked and a clean-environment execution remains pending.

## Methodology at a glance

- [Analysis and pipeline baselines](titanic_analysis.ipynb): EDA, family size and title features, Logistic Regression and Random Forest, with imputation and encoding inside scikit-learn pipelines. Two missing-embarkation rows are dropped before splitting: 711 training and 178 evaluation rows.
- [Exploratory tree experiments](titanic_survival_prediction.ipynb): Decision Tree and Random Forest comparisons, training-derived age imputation and ticket frequencies, and hyperparameter searches. Missing-embarkation rows are dropped after splitting: 710 training and 179 evaluation rows.

Both use a stratified 80/20 split with `random_state=42`, but the preparation order produces different subsets. Their scores should not be compared directly.

## Results and current limits

**Evaluation pending; no validated performance figures are reported.** All saved notebook outputs and execution counts were cleared for publication. Only static checks were performed; no cells were executed and no models were trained during publication.

The full labelled dataset is explored before splitting, which may inform feature choices. The tree notebook repeatedly uses `X_test` to compare hyperparameters, so that subset functions as reused validation rather than an independent final test. It also learns imputation and ticket-frequency transformations before cross-validation rather than within each fold. The analysis notebook had saved model outputs after a feature change, so those outputs could be stale.

Before reporting final performance, define a fresh evaluation protocol, fit every learned transformation within each training fold, and use an independent final assessment. The present code is retained as an exploratory learning record. It is not a deployed predictor or a Kaggle leaderboard submission.

## Explore this project

- [Analysis notebook](titanic_analysis.ipynb)
- [Tree experiments notebook](titanic_survival_prediction.ipynb)
- [Dataset snapshot and provenance note](Data/README.md)
- [Machine Learning catalogue](../../README.md)

To inspect locally, open this project directory in VS Code or Jupyter. Both notebooks expect the working directory to contain `Data/Titanic_dataset.csv`. Optional environment setup:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
jupyter lab
```

Opening a notebook does not validate its results. Model execution and methodological revision are separate future steps.
