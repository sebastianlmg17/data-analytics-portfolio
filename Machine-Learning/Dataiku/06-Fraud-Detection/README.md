# Fraud Detection with Naive Bayes and KNN

## Project Overview

This project develops a machine learning classification workflow in Dataiku to identify potentially fraudulent financial transactions.

The dataset contains 10,000 transactions described by numerical and categorical variables related to transaction amount, transaction behavior, geographic distance, device, origin country, transaction type, account age and payment method. The target variable is `es_fraude`, where `1` represents fraud and `0` represents a legitimate transaction.

## Objective

The objective is to build and compare two classification models required by the academic case study:

- Naive Bayes
- K-Nearest Neighbors (KNN)

The workflow will cover data preparation, train/test splitting, parameters and hyperparameters, model evaluation and final model comparison.

## Current Project Structure

- `01-Data-Cleaning/` - Initial data-quality review and cleaning decisions.

Additional stages will be documented as the project progresses.

## Initial Dataset

- Rows: 10,000
- Columns: 11
- Target: `es_fraude`
- Class distribution: 70% legitimate transactions / 30% fraudulent transactions
- Missing values: none detected
- Exact duplicate rows: none detected

## Data Cleaning Summary

The initial review identified three cleaning actions:

1. Remove `id_transaccion` because it is an identifier rather than a meaningful transaction feature. It also has an artificial perfect separation with the target in this dataset, creating a serious risk of data leakage.
2. Remove records where `distancia_ip < 0`, because the variable represents an estimated geographic distance and negative distances are inconsistent with that definition.
3. Remove records where `monto < 0`, because the dataset documentation defines the field as the transaction amount and provides no business meaning for negative values.

There are 131 records with negative `distancia_ip` and 56 with negative `monto`. One record has both anomalies, so 186 unique rows are removed. The cleaned dataset therefore contains 9,814 transactions.

Statistical outliers are retained because unusual transaction behavior may contain relevant fraud signals. Scaling, categorical encoding and any class-imbalance treatment are intentionally deferred to the feature-engineering/model-preprocessing stage.

## Tool

Dataiku DSS
