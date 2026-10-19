# Project Documentation

**[Open the model code →](../notebooks/customer_churn_prediction.ipynb)** · [Project overview](../README.md)

## Contents

[Data preparation](#01-data-preparation) · [Model training](#02-model-training) · [Optimization](#03-model-optimization) · [Results](#04-model-evaluation) · [Limits](#05-conclusions-and-current-limits) · [Run locally](#python)

---

<a id="01-data-preparation"></a>

## Data Preparation

[IBM Telco Customer Churn](../data/raw/Telco-Customer-Churn.csv): **7,043 rows**, **21 columns**, **1,869 churn cases**. The included file matches IBM's [fixed source snapshot](https://github.com/IBM/telco-customer-churn-on-icp4d/blob/d5371f5d83a446ad5673cbcca3b814b926491f8a/data/Telco-Customer-Churn.csv). See the [manifest and checksum](../data/raw/manifest.json) and [source-repository license](../data/IBM-LICENSE.txt).

| Step | Configuration |
| --- | --- |
| Target | `Churn`: `No=0`, `Yes=1` |
| Identifier | Exclude `customerID` |
| Missing charges | Convert `TotalCharges` to numeric; impute 11 whitespace-only entries with zero, all associated with `tenure=0` |
| Split | Stratified 80/20, `random_state=42`: 5,634 training / 1,409 test rows |
| Categorical encoding | Fit `OneHotEncoder(handle_unknown="ignore", sparse_output=False)` on training; transform test with the same encoder |
| Predictors | 45 columns after encoding, including numeric features |
| Scaling | Standardize `tenure`, `MonthlyCharges` and `TotalCharges` for LR; no scaling for RF |

The split precedes encoding, scaling and sampling. Numeric conversion and imputation are applied separately to training and test. The notebook checks the source hash, dimensions and zero-tenure condition.

---

<a id="02-model-training"></a>

## Model Training

| Model | Configuration |
| --- | --- |
| Logistic Regression | `max_iter=1000`, `random_state=42` |
| Random Forest | 200 trees, `random_state=42`, `n_jobs=-1` |

Other settings use the defaults in the pinned Scikit-learn version. `RandomOverSampler(random_state=42)` duplicates minority-class observations only in training, then both models are refitted. The test split remains unchanged. Baseline and oversampling models use the default **0.50** decision threshold.

---

<a id="03-model-optimization"></a>

## Model Optimization

LR uses five-fold `StratifiedKFold(shuffle=True, random_state=42)` with mean F1 for selection. The pipeline fits numeric scaling inside each fold; OHE has already been fitted on the full training split.

| Setting | Values |
| --- | --- |
| `C` search | 0.01, 0.1, 1, 10, 100 |
| `class_weight` search | `None`, `"balanced"` |
| Selected LR | `C=0.1`, `class_weight="balanced"`, `max_iter=2000` |
| Selected mean CV F1 | **0.6296** |
| Threshold search | 0.10–0.90, step 0.01, on out-of-fold training probabilities |
| Selected threshold | **0.55**, pooled training-CV F1 **0.6371** |

The selected LR is refitted on the full training split and evaluated at threshold 0.55. [CV results](../reports/cv_results.csv) and [threshold results](../reports/threshold_results.csv) contain the computed selection tables.

---

<a id="04-model-evaluation"></a>

## Model Evaluation

All rows use the same 1,409-row evaluation subset. Precision, recall and F1 use churn (`Yes=1`) as the positive class; ROC AUC uses predicted probabilities. OS means random oversampling.

| Model | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Logistic Regression | 0.8420 | 0.8055 | 0.6572 | 0.5588 | 0.6040 |
| Random Forest | 0.8212 | 0.7857 | 0.6233 | 0.4866 | 0.5465 |
| Logistic Regression + OS | 0.8421 | 0.7331 | 0.4983 | 0.7861 | 0.6100 |
| Random Forest + OS | 0.8179 | 0.7708 | 0.5684 | 0.5668 | 0.5676 |
| Tuned Logistic Regression | 0.8408 | 0.7544 | 0.5261 | 0.7540 | 0.6198 |

Tuned LR has the highest F1 in this comparison. Against baseline LR, recall rises from 0.5588 to 0.7540 and F1 from 0.6040 to 0.6198, with lower precision and accuracy and similar AUC. The operational choice depends on the costs of missed churn and unnecessary outreach; retention benefit has not been measured.

Computed values: [metrics.csv](../reports/metrics.csv).

---

<a id="05-conclusions-and-current-limits"></a>

## Conclusions and Current Limits

These are **exploratory results**, not an independent final evaluation:

- The same test set was inspected for baselines, oversampling and tuned LR.
- OHE was fitted on the whole training split before CV, exposing fold-validation category information. The tuned numeric scaler is inside CV; the encoder is not.
- Hyperparameter and threshold selection reuse the same folds; their CV figures are also selection results.

A follow-up should place all learned preprocessing inside the pipeline and separate model/threshold selection from assessment on untouched data, or use nested validation.

---

<a id="python"></a>

## Python

Run from the project folder with **CPython 3.14.6**:

```bash
python3.14 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python scripts/execute_notebook.py
```

On Windows, create the environment with `python` and activate with `.venv\Scripts\Activate.ps1`. The dataset is included. The [runner](../scripts/execute_notebook.py) uses the selected interpreter and a temporary kernel, writes `reports/customer_churn.executed.ipynb` with outputs, and recomputes the three CSV report tables.

Direct dependencies are pinned in [requirements.txt](../requirements.txt). The cleaned notebook was executed on macOS with CPython 3.14.6 on **2026-10-19**, reproducing the published metrics, CV scores and selected threshold.

Code developed with assistance from **CODEX**.
