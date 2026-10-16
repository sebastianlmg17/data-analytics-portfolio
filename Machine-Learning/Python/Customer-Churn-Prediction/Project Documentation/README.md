# Project Documentation

[Project overview](../README.md)

## Contents

- [Data Cleaning](#01-data-cleaning)
- [Feature Engineering](#02-feature-engineering)
- [Train/Test Split](#03-train-test-split)
- [Original Models](#04-original-models)
- [Oversampling](#05-oversampling)
- [Model Optimization](#06-model-optimization)
- [Model Evaluation](#07-model-evaluation)
- [Conclusions and Current Limits](#08-conclusions-and-current-limits)
- [Python](#python)

---

<a id="01-data-cleaning"></a>

## Data Cleaning

### Overview

The IBM Telco Customer Churn dataset contains customer demographics, service subscriptions and account charges. The objective is to prepare these predictors for churn classification while preserving all observations.

### Original Dataset

| Setting | Value |
| --- | --- |
| Published file | [Telco-Customer-Churn.csv](../data/raw/Telco-Customer-Churn.csv) |
| Observations | 7,043 |
| Columns | 21, including identifier and target |
| Target | `Churn` |
| Churn cases | 1,869 |

The CSV matches IBM's [source snapshot](https://github.com/IBM/telco-customer-churn-on-icp4d/blob/d5371f5d83a446ad5673cbcca3b814b926491f8a/data/Telco-Customer-Churn.csv) byte for byte. The [manifest](../data/raw/manifest.json) records provenance, and the source-repository [license text](../data/IBM-LICENSE.txt) is retained.

SHA-256: `16320c9c1ec72448db59aa0a26a0b95401046bef5d02fd3aeb906448e3055e91`.

### Cleaning Decisions

| Feature | Action | Reason |
| --- | --- | --- |
| `TotalCharges` | Convert to numeric and impute the 11 whitespace-only entries with zero | All 11 records have `tenure=0`; retain these customers |
| `customerID` | Exclude from predictors | Customer identifier |

The notebook checks the dataset hash, dimensions and relationship between blank charges and zero tenure. Conversion and imputation are applied separately to training and test after splitting.

---

<a id="02-feature-engineering"></a>

## Feature Engineering

### Configuration

| Component | Transformation |
| --- | --- |
| Target | Map `No=0`, `Yes=1` |
| Categorical predictors | `OneHotEncoder(handle_unknown="ignore", sparse_output=False)` |
| Logistic Regression | Standardize `tenure`, `MonthlyCharges` and `TotalCharges` |
| Random Forest | Use unscaled predictors |

The encoder is fitted on training data and then applied to test, producing **45 predictors** including the numeric columns. Baseline scaling parameters also come from training only.

### Cross-Validation Consideration

One-Hot Encoding is performed on the whole training split **before** later cross-validation. The tuned LR scaler is inside its CV pipeline, but the encoder is outside it. This exposes fold-validation category information to preprocessing and limits interpretation of CV scores.

---

<a id="03-train-test-split"></a>

## Train/Test Split

### Split Configuration

| Setting | Value |
| --- | ---: |
| Training share | 80% |
| Test share | 20% |
| Training observations | 5,634 |
| Test observations | 1,409 |
| Random state | 42 |
| Stratification | `Churn` |

The split precedes learned encoding and scaling and all sampling experiments. Training data supplies model fits and CV selection; the same test rows are used for the reported comparisons.

### Evaluation Scope

The test split was inspected across baseline models, oversampling and tuned LR. It is therefore a reused evaluation subset, **not an independent final test** of the selected approach.

---

<a id="04-original-models"></a>

## Original Models

### Objective

Establish baselines on the original class distribution before testing balancing and tuning.

### Models Trained

| Model | Configuration |
| --- | --- |
| Logistic Regression | `max_iter=1000`, `random_state=42`; scaled continuous features |
| Random Forest | 200 trees, `random_state=42`, `n_jobs=-1`; no scaling |

Other estimator settings use the defaults in the pinned Scikit-learn version. Both models use their default **0.50** decision threshold; all five evaluation metrics are reported in [Model Evaluation](#07-model-evaluation).

### Interpretation

Baseline LR has higher accuracy, precision, recall, F1 and ROC AUC than baseline RF in this comparison. Its recall of **0.5588** also shows why strategies that detect more churn cases were explored.

---

<a id="05-oversampling"></a>

## Oversampling

### Implementation

`RandomOverSampler(random_state=42)` duplicates minority-class observations only in the training data. Both baseline models are refitted on their resampled training sets; test rows and their class distribution remain unchanged.

### Results

LR recall rises from **0.5588** to **0.7861**, while precision falls from **0.6572** to **0.4983**. RF recall rises from **0.4866** to **0.5668**, with lower precision and ROC AUC. Full results are included in the evaluation table below.

### Conclusion

Oversampling changes the balance between missed churn cases and false alarms. The results do not support treating class balancing as an automatic improvement across all metrics.

---

<a id="06-model-optimization"></a>

## Model Optimization

### Hyperparameter Search

Five-fold `StratifiedKFold(shuffle=True, random_state=42)` compares LR configurations using mean F1. Numeric scaling is fitted separately inside each fold through a pipeline; previously fitted OHE is retained outside that pipeline.

| Setting | Values |
| --- | --- |
| `C` | 0.01, 0.1, 1, 10, 100 |
| `class_weight` | `None`, `"balanced"` |
| Selection metric | Mean CV F1 |
| Selected configuration | `C=0.1`, `class_weight="balanced"`, `max_iter=2000` |
| Selected mean CV F1 | **0.6296** |

### Threshold Selection

Out-of-fold training probabilities for the selected configuration are compared at thresholds from **0.10 to 0.90**, in increments of 0.01. Maximum pooled F1 selects **0.55**, with training-CV F1 **0.6371**. The model is refitted on the full training split and this threshold is applied to the reused test split.

Hyperparameter and threshold selection reuse the same folds. These CV figures measure the exploratory selection process, rather than an independent estimate of its final performance.

The computed [CV results](../reports/cv_results.csv) and [threshold results](../reports/threshold_results.csv) are published with the project.

---

<a id="07-model-evaluation"></a>

## Model Evaluation

### Evaluation Metrics

Accuracy, precision, recall, F1 and ROC AUC are computed on the same 1,409-row evaluation subset. Precision, recall and F1 use churn (`Yes=1`) as the positive class. ROC AUC uses predicted probabilities. OS denotes random oversampling.

### Results

| Model | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Logistic Regression | 0.8420 | 0.8055 | 0.6572 | 0.5588 | 0.6040 |
| Random Forest | 0.8212 | 0.7857 | 0.6233 | 0.4866 | 0.5465 |
| Logistic Regression + OS | 0.8421 | 0.7331 | 0.4983 | 0.7861 | 0.6100 |
| Random Forest + OS | 0.8179 | 0.7708 | 0.5684 | 0.5668 | 0.5676 |
| Tuned Logistic Regression | 0.8408 | 0.7544 | 0.5261 | 0.7540 | 0.6198 |

[metrics.csv](../reports/metrics.csv) contains the computed values. Baseline and OS models use the default 0.50 threshold; tuned LR uses 0.55.

### Interpretation

Tuned LR has the highest F1 in this exploratory comparison. Compared with baseline LR, recall increases from **0.5588** to **0.7540** and F1 from **0.6040** to **0.6198**, while precision and accuracy decrease. Its ROC AUC remains similar to baseline LR.

---

<a id="08-conclusions-and-current-limits"></a>

## Conclusions and Current Limits

Tuned LR is the selected configuration within the exploratory comparison when prioritizing F1 and churn detection. Baseline LR remains stronger on accuracy and precision. An operational choice would require the relative costs of missed churn and unnecessary outreach; retention costs, causal effects and commercial benefit have not been measured.

The reused test subset, OHE before CV, and shared folds for hyperparameter and threshold selection prevent treating these figures as an independent final evaluation. A follow-up should place all learned preprocessing inside the pipeline and separate selection from assessment on untouched data, or use nested validation.

---

<a id="python"></a>

## Python

### Published Implementation

The [implementation notebook](../notebooks/customer_churn_prediction.ipynb) contains the actual preparation, model comparison, sampling and tuning code. Source outputs are cleared; execution produces a notebook with outputs and the three CSV report tables.

The published notebook retains the original model configurations and selection logic, with data assertions, portable paths and CSV exports added for reproduction. The applied threshold is calculated from training CV.

The code was developed with assistance from **CODEX**.

### Reproduce the Project

From the project folder, using **CPython 3.14.6**:

```bash
python3.14 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python scripts/execute_notebook.py
```

On Windows, create the environment with `python` and activate with `.venv\Scripts\Activate.ps1`. The dataset is included and checked by SHA-256. The runner uses the selected interpreter and a temporary Jupyter kernel, then saves `reports/customer_churn.executed.ipynb` and recomputes the three CSV tables. Rerunning overwrites those report tables.

Direct dependencies are pinned in [requirements.txt](../requirements.txt). The verified environment is CPython 3.14.6 on macOS, with pandas 3.0.6, NumPy 2.5.4, Scikit-learn 1.9.1, SciPy 1.18.1 and Imbalanced-learn 0.14.2. Other platforms have not been verified; dependencies and floating-point behavior can affect exact reproduction.

### Execution Check

All cells executed successfully on **2026-10-16**, including a repeat from a new virtual environment installed with `requirements.txt`. Both runs produced identical `metrics.csv` files. The five comparison rows, selected hyperparameters, mean CV F1 and threshold match the original analysis. The isolated dependency check reported no conflicts.

### Explore the Implementation

- [Dataset and provenance](../data/raw/)
- [Implementation notebook](../notebooks/customer_churn_prediction.ipynb)
- [Execution script](../scripts/execute_notebook.py)
- [Computed reports](../reports/)
- [Project overview](../README.md)
