# Madrid Housing Price Analysis

## Overview

Analyze Madrid property listings from Idealista with statistical regression.

## Objective

Explore price associations and estimate residential property prices.

## Tools

Dataiku DSS.

## Methodology at a glance

Prepare variables and district encoding, perform size-group ANOVA, review duplicates (915 to 911 observations), and fit simple and multiple OLS models. Six dataset snapshots support the documented workflow.

## Results and current limits

Dataiku multiple OLS: R² **0.7141**, RMSE approximately **€538,900**, MAE approximately **€339,300**, MAPE **34.40%**. Final model comparison remains pending. Separate full-dataset inferential statistics are not the Dataiku evaluation; exact split and preprocessing are not preserved in the CSVs.

## Explore this project

- [Project Documentation — full explanation, experiments and conclusions](Project%20Documentation/)
- [Datasets — published snapshots](Datasets/)
- [Machine Learning catalogue](../../README.md)
