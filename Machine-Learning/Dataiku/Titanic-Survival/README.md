# Titanic Survival Prediction

## Overview

An introductory passenger-survival classification workflow.

## Objective

Predict `Survived` using demographic and travel-related features.

## Tools

Dataiku DSS.

## Methodology at a glance

Clean and engineer passenger features, split into 713 training and 178 test observations, and compare Random Forest with Logistic Regression without resampling.

## Results and current limits

Random Forest led the documented training-stage comparison: ROC AUC **0.8564**, accuracy **0.8258**, precision **0.7714**, recall **0.7826**, F1 **0.7770**. Later evaluation and final-results phases remain unfinished; an executable Dataiku export is not included.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Datasets — published snapshots](Datasets/)
- [Published images](images/)
- [Machine Learning catalogue](../../README.md)
