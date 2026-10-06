# Fraud Detection with Naive Bayes and KNN

## Project Overview

This project develops a machine learning classification workflow in Dataiku to identify potentially fraudulent financial transactions.

The dataset contains 10,000 transactions described by numerical and categorical variables related to transaction amount, transaction behavior, geographic distance, device, origin country, transaction type, account age and payment method. The target variable is `es_fraude`, where `1` represents fraud and `0` represents a legitimate transaction.

## Objective

The objective is to build and compare two classification models:

- Naive Bayes
- K-Nearest Neighbors (KNN)

The workflow covers data preparation, train/test splitting, parameters and hyperparameters, model evaluation and final model comparison.

## Project Structure

- [01-Data-Cleaning](docs/methodology.md#01-data-cleaning) - Data quality and cleaning decisions.
- [02-Feature-Engineering](docs/methodology.md#02-feature-engineering) - One-Hot encoding and model-specific preprocessing.
- [03-KNN-Model](docs/methodology.md#03-knn-model) - Final configuration, hyperparameter selection and evaluation.
- [04-Naive-Bayes-Model](docs/methodology.md#04-naive-bayes-model) - GaussianNB implementation, configuration and evaluation.
- [05-Model-Comparison](docs/methodology.md#05-model-comparison) - Final comparison and model selection.

All five stages are documented. **Gaussian Naive Bayes is the selected model for this dataset.**

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

Statistical outliers are retained because unusual transaction behavior may contain relevant fraud signals. Categorical encoding and model-specific scaling are documented in [02-Feature-Engineering](docs/methodology.md#02-feature-engineering).


## Final Model Comparison

Both models use 27 predictors, an 80/20 random split with seed 1337, 7,869 training rows and 1,945 test rows.

| Metric | KNN | Gaussian Naive Bayes |
| --- | ---: | ---: |
| ROC AUC | 0.9897 | 0.9980 |
| Accuracy | 0.9861 | 0.9882 |
| Precision | 0.9829 | 0.9880 |
| Recall | 0.9712 | 0.9729 |
| F1-score | 0.9770 | 0.9804 |
| Average Precision | 0.9853 | 0.9968 |
| MCC | 0.9671 | 0.9720 |
| Threshold | 0.100 | 0.825 |
| TP | 574 | 575 |
| FN | 17 | 16 |
| FP | 10 | 7 |
| TN | 1344 | 1347 |

Gaussian Naive Bayes slightly outperforms KNN across all principal metrics and makes fewer false-negative and false-positive errors. See [05-Model-Comparison](docs/methodology.md#05-model-comparison) for configuration and interpretation.

## Interpretation Limits

Dataiku flagged the exceptional ROC AUC of 0.998. Although the identifier `id_transaccion` was removed for leakage, the results do not establish generalization to new real-world transactions. The source/provenance of the dataset is not specified in the published project overview.

GaussianNB made 16 false negatives and 7 false positives, compared with 17 and 10 for KNN, on the reported test set. Its small advantage supports selection within this evaluation rather than a claim of universal superiority. See [full comparison](docs/methodology.md#05-model-comparison).

## Tool

Dataiku DSS

## Explore this project

- [Detailed methodology and experiment notes](docs/methodology.md)
- [Project catalogue](../../README.md)

## Reproducibility

The repository documents the reported Dataiku workflow and evaluation. The source dataset and an executable Dataiku project export are not currently published here, so the documented results cannot be independently rerun from this folder alone.
