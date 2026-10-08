# Project Documentation

[Project overview](../README.md)

## Contents

- [01 - Data Cleaning](#01-data-cleaning)
- [02 - Feature Engineering](#02-feature-engineering)
- [03 - K-Nearest Neighbors (KNN)](#03-knn-model)
- [KNN Model Documentation](#03-knn)
- [04 - Gaussian Naive Bayes Model](#04-naive-bayes-model)
- [05 - Model Comparison](#05-model-comparison)

---

<a id="01-data-cleaning"></a>

## 01 - Data Cleaning

### Purpose

This stage documents the initial data-quality review and the cleaning decisions applied before feature engineering and model training.

### Initial Quality Review

The original dataset contains 10,000 transactions and 11 columns.

- No missing values were detected.
- No exact duplicate rows were detected.
- No infinite numerical values were detected.
- No constant variables were detected.
- The target `es_fraude` contains 7,000 legitimate transactions (70%) and 3,000 fraudulent transactions (30%).

### Cleaning Decisions

#### 1. Remove `id_transaccion`

`id_transaccion` is a unique transaction identifier and does not represent a meaningful behavioral or financial characteristic of a transaction.

The exploratory analysis also found that IDs 1-7,000 correspond exactly to `es_fraude = 0`, while IDs 7,001-10,000 correspond exactly to `es_fraude = 1`. Keeping this field would therefore introduce a severe risk of data leakage and allow a model to exploit the construction of the dataset instead of learning genuine fraud patterns.

**Decision:** remove the entire `id_transaccion` column before model training.

#### 2. Remove negative `distancia_ip` records

The case-study documentation defines `distancia_ip` as the estimated geographic distance between the origin IP and destination IP. A geographic distance cannot logically be negative.

- Negative records: 131
- Share of original dataset: 1.31%

Because the affected proportion is small and there is no reliable information with which to reconstruct the true distance, these values were not imputed using a mean or median.

**Decision:** remove rows where `distancia_ip < 0`.

#### 3. Remove negative `monto` records

The dataset documentation defines `monto` as the transaction amount in dollars. It does not provide a documented interpretation for negative amounts, such as refunds or accounting reversals.

- Negative records: 56
- Share of original dataset: 0.56%

Without information about the true amount or the reason for the negative sign, replacing these values with a mean, median or absolute value would introduce unsupported assumptions.

**Decision:** remove rows where `monto < 0`.

#### Combined row removal

One transaction contains both a negative amount and a negative IP distance. Therefore, the two filters remove 186 unique rows rather than 187.

- Original rows: 10,000
- Rows removed: 186
- Remaining rows: 9,814
- Data retained: 98.14%

### Outliers

Statistical outliers are intentionally retained. In fraud detection, unusually high amounts, transaction frequencies, elapsed times or geographic distances may represent meaningful fraud behavior rather than data errors. Removing them solely because they are statistically extreme could discard valuable predictive information.

### Next Stage

[02 - Feature Engineering](README.md#02-feature-engineering) documents categorical encoding and model-specific preprocessing.

---

<a id="02-feature-engineering"></a>

## 02 - Feature Engineering

### Purpose

The cleaned transaction data was prepared for modeling while retaining the documented cleaning decisions: remove the identifier and invalid negative values, and retain statistical outliers.

### 1. Encode Categorical Variables

One-Hot Encoding was applied to:

- `dispositivo`
- `pais_origen`
- `tipo_transaccion`
- `metodo_pago`

These categories have no natural numerical ordering. Empty cells created by the encoding were filled with `0`, and the four original categorical columns were removed.

`cuenta_nueva` was retained as a binary 0/1 variable and `es_fraude` as the target.

### 2. Configure KNN Preprocessing

| Variables | Role | Rescaling |
| --- | --- | --- |
| `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h`, `distancia_ip` | Input | Standard rescaling / Avg std |
| All One-Hot dummy variables | Input, ON | No rescaling |
| `cuenta_nueva` | Input, ON | No rescaling |
| `es_fraude` | Target | Not a predictor |

For **Gaussian Naive Bayes**, rescaling was disabled for all features, including the four numerical variables. The same One-Hot variables and `cuenta_nueva` remained active inputs.

### Final Inputs

Both models used the same 27 predictors, excluding the target.

### Next Stage

[03 - KNN](README.md#03-knn-model) documents the split, hyperparameter search and final evaluation.

---

<a id="03-knn-model"></a>

## 03 - K-Nearest Neighbors (KNN)

### Purpose

The KNN fraud classifier was trained and evaluated using the feature configuration from [02 - Feature Engineering](README.md#02-feature-engineering).

### 1. Configure the Training and Test Split

| Setting | Value |
| --- | --- |
| Target | `es_fraude` (1 = fraud; 0 = legitimate) |
| Train/test split | 80/20 |
| Split method | Random |
| Random seed | 1337 |
| Training rows | 7,869 |
| Test rows | 1,945 |
| Features after preprocessing | 27 |

Standard scaling was applied only to `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h` and `distancia_ip`. All One-Hot dummies and `cuenta_nueva` remained active inputs with **No rescaling**.

### 2. Search and Select Hyperparameters

| Setting | Value |
| --- | --- |
| Search method | Grid search |
| Candidate K values | 3, 5, 7, 9, 11 |
| Validation | 5-fold cross-validation |
| Hyperparameter optimization metric | ROC AUC |
| Selected K | 11 |
| Distance parameter | `p = 2` (Euclidean) |
| Distance weighting | No |
| Final threshold | 0.100 |

K = 11 was selected within the evaluated grid using ROC AUC. The final classification threshold was 0.100.

### 3. Final Test Metrics

| Metric | Result |
| --- | ---: |
| ROC AUC | 0.9897 |
| Accuracy | 0.9861 |
| Precision | 0.9829 |
| Recall | 0.9712 |
| F1-score | 0.9770 |
| Average Precision | 0.9853 |
| MCC | 0.9671 |

Classification results use the final threshold of **0.100**.

### 4. Confusion Matrix

| Actual class | Predicted fraud | Predicted legitimate |
| --- | ---: | ---: |
| Fraud | 574 (TP) | 17 (FN) |
| Legitimate | 10 (FP) | 1,344 (TN) |

The test matrix contains 1,945 transactions: 591 fraudulent and 1,354 legitimate. KNN detects 574 frauds, misses 17 and generates 10 false alerts, for 27 classification errors.

The reported partition contains 7,869 training rows and 1,945 test rows, totaling the 9,814 cleaned transactions.

### Next Phase

Continue with [04 - Naive Bayes Model](README.md#04-naive-bayes-model) and [05 - Model Comparison](README.md#05-model-comparison) for the final selection.

---

<a id="03-knn"></a>

## KNN Model Documentation

The current documentation is maintained in [03-KNN-Model](README.md#03-knn-model), including the final configuration and results.

---

<a id="04-naive-bayes-model"></a>

## 04 - Gaussian Naive Bayes Model

### 1. Implementation

Gaussian Naive Bayes was implemented as a **Custom Python Model** in Dataiku using `sklearn.naive_bayes.GaussianNB`.

### 2. Configuration

| Setting | Final value |
| --- | --- |
| Target | `es_fraude` (1 = fraud; 0 = legitimate) |
| Predictors after preprocessing | 27 |
| Inputs | Same numerical features, One-Hot variables and binary `cuenta_nueva` as KNN |
| Rescaling | No rescaling on any feature |
| Train/test | 80/20, random split |
| Seed | 1337 |
| Training rows | 7,869 |
| Test rows | 1,945 |
| Final threshold | 0.825 |

All 27 features remain **Input/ON**. See [02 - Feature Engineering](README.md#02-feature-engineering) for the encoding workflow.

### 3. Final Test Metrics

| Metric | Result |
| --- | ---: |
| ROC AUC | 0.9980 |
| Accuracy | 0.9882 |
| Precision | 0.9880 |
| Recall | 0.9729 |
| F1-score | 0.9804 |
| Average Precision | 0.9968 |
| MCC | 0.9720 |

### 4. Confusion Matrix

| Actual class | Predicted fraud | Predicted legitimate |
| --- | ---: | ---: |
| Fraud | 575 (TP) | 16 (FN) |
| Legitimate | 7 (FP) | 1,347 (TN) |

At threshold **0.825**, the model detects 575 of 591 frauds, misses 16 and generates 7 false alerts: 23 errors across 1,945 test transactions.

### 5. Performance Interpretation

See [interpretation limits](README.md#05-model-comparison).

### Next Stage

[05 - Model Comparison](README.md#05-model-comparison) compares the final results and documents the selected model.

---

<a id="05-model-comparison"></a>

## 05 - Model Comparison

### Evaluation Setup

Both models use 27 predictors and the same 80/20 random-split configuration, seed 1337, 7,869 training rows and 1,945 test rows. The target is `es_fraude`. Both retain the same One-Hot inputs and binary `cuenta_nueva`.

KNN applies standard scaling only to `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h` and `distancia_ip`; dummies and `cuenta_nueva` have no rescaling. GaussianNB has no rescaling on any feature.

| Model | Final configuration | Final threshold |
| --- | --- | ---: |
| KNN | K = 11; p = 2; no distance weighting | 0.100 |
| Gaussian Naive Bayes | Custom Python Model; `sklearn.naive_bayes.GaussianNB` | 0.825 |

### Final Results

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

### Selected Model

**Gaussian Naive Bayes is selected for this dataset.** It slightly outperforms KNN across all principal metrics, reduces false negatives from 17 to 16 and false positives from 10 to 7.

### Interpretation Limits

Dataiku flagged the exceptional ROC AUC of 0.998. Although `id_transaccion` was removed for leakage, these results should be interpreted cautiously beyond this dataset.

### Model Documentation

- [03 - KNN Model](README.md#03-knn-model)
- [04 - Naive Bayes Model](README.md#04-naive-bayes-model)


---

## Extended project overview

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

- [01-Data-Cleaning](README.md#01-data-cleaning) - Data quality and cleaning decisions.
- [02-Feature-Engineering](README.md#02-feature-engineering) - One-Hot encoding and model-specific preprocessing.
- [03-KNN-Model](README.md#03-knn-model) - Final configuration, hyperparameter selection and evaluation.
- [04-Naive-Bayes-Model](README.md#04-naive-bayes-model) - GaussianNB implementation, configuration and evaluation.
- [05-Model-Comparison](README.md#05-model-comparison) - Final comparison and model selection.

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

Statistical outliers are retained because unusual transaction behavior may contain relevant fraud signals. Categorical encoding and model-specific scaling are documented in [02-Feature-Engineering](README.md#02-feature-engineering).


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

Gaussian Naive Bayes slightly outperforms KNN across all principal metrics and makes fewer false-negative and false-positive errors. See [05-Model-Comparison](README.md#05-model-comparison) for configuration and interpretation.

## Interpretation Limits

Dataiku flagged the exceptional ROC AUC of 0.998. Although the identifier `id_transaccion` was removed for leakage, the results do not establish generalization to new real-world transactions. The source/provenance of the dataset is not specified in the published project overview.

GaussianNB made 16 false negatives and 7 false positives, compared with 17 and 10 for KNN, on the reported test set. Its small advantage supports selection within this evaluation rather than a claim of universal superiority. See [full comparison](README.md#05-model-comparison).

## Tool

Dataiku DSS

## Explore this project

- [Detailed methodology and experiment notes](README.md)
- [Project catalogue](../../../README.md)

## Reproducibility

The repository documents the reported Dataiku workflow and evaluation. The source dataset and an executable Dataiku project export are not currently published here, so the documented results cannot be independently rerun from this folder alone.
