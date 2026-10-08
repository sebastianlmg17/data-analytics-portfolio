# Employee Attrition Prediction

## Overview

Analyze employee departures using the 1,470-record IBM HR dataset.

## Objective

Predict attrition and assess the tradeoff between detecting departures and false alarms.

## Tools

Dataiku DSS · Python (Pandas and Scikit-learn sampling recipes).

## Methodology at a glance

Prepare and encode predictors, keep an untouched test set, compare sampling strategies, then optimize models on the original training data with five-fold stratified cross-validation to avoid duplication leakage between folds.

## Results and current limits

Selected Logistic Regression: accuracy **87.76%**, precision **77.50%**, recall **53.45%**, F1 **63.27%**, ROC AUC **86.27%**. Final variable interpretation remains pending. Results do not establish causes of departure or retention impact; the executable Dataiku export is not published.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Datasets — published snapshots](Datasets/)
- [Python Code — supporting recipes](Python%20Code/)
- [Machine Learning catalogue](../../README.md)
