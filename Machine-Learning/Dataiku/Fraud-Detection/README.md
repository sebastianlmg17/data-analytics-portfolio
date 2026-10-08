# Fraud Detection with Naive Bayes and KNN

## Overview

Compare fraud classifiers on a 10,000-transaction dataset.

## Objective

Identify potentially fraudulent transactions and compare model errors.

## Tools

Dataiku DSS · Python (custom GaussianNB model using Scikit-learn, documented in the project notes; standalone model code is not published).

## Methodology at a glance

Remove the leaking identifier and invalid negative values, encode predictors, configure model-specific scaling, and compare KNN and GaussianNB on the same 80/20 split.

## Results and current limits

Selected GaussianNB: test ROC AUC **0.9980**, precision **0.9880**, recall **0.9729**, F1 **0.9804**; **16** false negatives and **7** false positives. Exceptional performance requires caution: dataset provenance and real-world generalization are not established. Source data and an executable export are not published.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Machine Learning catalogue](../../README.md)
