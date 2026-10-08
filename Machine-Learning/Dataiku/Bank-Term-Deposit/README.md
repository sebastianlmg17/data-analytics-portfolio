# Bank Term Deposit Prediction

## Overview

Predict term-deposit subscriptions from the UCI Bank Marketing dataset.

## Objective

Help prioritize customers for direct marketing campaigns.

## Tools

Dataiku DSS · Python (Pandas and Scikit-learn sampling recipes).

## Methodology at a glance

Remove the post-call `duration` feature to prevent leakage, encode predictors, split train/test 80/20, compare original and resampled training data, and tune Random Forest with five-fold cross-validation.

## Results and current limits

Optimized Random Forest V2: test ROC AUC **0.9535**, accuracy **0.9008**, precision **0.5522**, recall **0.8284** and F1 **0.6627**. Production performance and campaign savings have not been measured; the complete executable Dataiku project is not published.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Datasets — published snapshots](Datasets/)
- [Python Code — supporting recipes](Python%20Code/)
- [Machine Learning catalogue](../../README.md)
