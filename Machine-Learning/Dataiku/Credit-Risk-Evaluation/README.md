# Credit Risk Evaluation

## Overview

Classify high and low credit risk across 50,000 loan applications.

## Objective

Compare tree-based models to identify high-risk applicants.

## Tools

Dataiku DSS.

## Methodology at a glance

Impute missing values, encode categorical predictors, and compare Decision Tree, Random Forest and Gradient Boosted Trees on a common test set.

## Results and current limits

Gradient Boosted Trees: test ROC AUC **0.9674**, accuracy **0.9137**, recall **0.8570** and F1 **0.8568**. The model missed **432** high-risk cases. Dataset provenance and future-loan generalization are not established; source data and an executable project export are not published.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Machine Learning catalogue](../../README.md)
