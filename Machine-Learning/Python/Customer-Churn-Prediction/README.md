# Customer Churn Prediction

**[Open the model code →](notebooks/customer_churn_prediction.ipynb)** · [Full results and methodology](Project%20Documentation/) · [Run locally](Project%20Documentation/#python)

## Overview

Customer-churn classification on the 7,043-record IBM Telco dataset.

## Objective

Compare churn detection against false alarms in potential retention outreach.

## Tools

Python · Scikit-learn · Imbalanced-learn · Pandas. Code developed with assistance from **CODEX**.

## Methodology at a glance

Stratified 80/20 split, categorical encoding, scaling for Logistic Regression, and comparison with Random Forest, random oversampling and LR tuning.

## Results and current limits

Tuned LR: F1 **0.6198**, recall **0.7540**, ROC AUC **0.8408**. Higher recall comes with lower precision and accuracy than baseline LR. Test reuse and OHE before CV make this an exploratory comparison, not an independent final evaluation.

## Explore this project

[Dataset](data/raw/Telco-Customer-Churn.csv) · [Computed results](reports/metrics.csv) · [Dependencies](requirements.txt) · [Python projects](../README.md)
