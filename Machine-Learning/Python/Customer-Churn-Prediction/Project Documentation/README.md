# Customer Churn Prediction · Project Documentation

## Objective and data

Compare classifiers for identifying customers likely to leave a telecom service. Higher recall may help find more potential churn cases, while precision affects how many retained customers would receive unnecessary outreach. No retention costs, causal effects or commercial benefit have been estimated.

The included **IBM Telco Customer Churn** CSV has **7,043 rows and 21 columns**, with 1,869 churn cases. It comes from IBM's [source repository at a fixed commit](https://github.com/IBM/telco-customer-churn-on-icp4d/tree/d5371f5d83a446ad5673cbcca3b814b926491f8a). The [source CSV](https://github.com/IBM/telco-customer-churn-on-icp4d/blob/d5371f5d83a446ad5673cbcca3b814b926491f8a/data/Telco-Customer-Churn.csv) and the included copy match byte for byte. Source-repository license text is retained in [data/IBM-LICENSE.txt](../data/IBM-LICENSE.txt); dataset provenance is recorded in [manifest.json](../data/raw/manifest.json).

SHA-256: `16320c9c1ec72448db59aa0a26a0b95401046bef5d02fd3aeb906448e3055e91`.

## Preparation

- Map `Churn`: `No=0`, `Yes=1`; exclude `customerID` from predictors.
- Use an 80/20 stratified split with `random_state=42`: **5,634 training / 1,409 test** rows.
- Convert `TotalCharges` to numeric. Its **11 whitespace-only entries all have `tenure=0`** and are imputed with zero. The notebook checks this condition before modeling.
- Fit `OneHotEncoder(handle_unknown="ignore", sparse_output=False)` on training categorical columns and transform test with the same encoder, producing **45 predictors** including numeric columns.
- Standardize `tenure`, `MonthlyCharges` and `TotalCharges` for Logistic Regression. Random Forest uses unscaled features. Training data determines the scaling parameters.

## Experiments

1. **Baselines:** Logistic Regression (`max_iter=1000`, seed 42) and Random Forest (200 trees, seed 42). Other estimator settings use the defaults in the pinned scikit-learn version.
2. **Oversampling:** `RandomOverSampler(random_state=42)` duplicates minority-class rows only in the training split. Refit both baseline models; leave test unchanged.
3. **LR tuning:** five-fold `StratifiedKFold(shuffle=True, random_state=42)` searches `C=[0.01, 0.1, 1, 10, 100]` and `class_weight=[None, "balanced"]`. A pipeline fits numeric scaling separately inside each fold. Selection uses mean F1; the selected configuration is `C=0.1`, `class_weight="balanced"`, with mean CV F1 **0.6296**.
4. **Threshold:** compare 0.10–0.90 in 0.01 increments using out-of-fold training probabilities for the selected configuration. Maximum pooled F1 selects **0.55** (training-CV F1 **0.6371**). Refit on training and apply that threshold to the reused test split. Baselines and OS use the estimators' default 0.50 threshold.

The [README](../README.md) reports all five test comparisons. [metrics.csv](../reports/metrics.csv) stores computed values; [cv_results.csv](../reports/cv_results.csv) and [threshold_results.csv](../reports/threshold_results.csv) retain the selection tables. ROC-AUC uses probabilities; precision, recall and F1 use churn as the positive class.

Tuned LR raises recall from 0.5588 to 0.7540 and F1 from 0.6040 to 0.6198, while reducing precision from 0.6572 to 0.5261. Its AUC is similar to baseline LR. Random Forest and oversampling do not establish a universally better model; the choice depends on the relative costs of missed churn and unnecessary outreach.

## Evaluation limits

This publication preserves an **exploratory workflow**. The same test set was inspected for baseline models, oversampling and tuned LR, so it cannot serve as an independent final evaluation of the selected approach.

**OHE was fitted on the whole training split before CV**, rather than independently in each fold. It therefore exposes fold-validation category information to preprocessing. The tuned model's numeric scaler is inside CV, but the encoder is not. Hyperparameter selection and threshold selection also reuse the same CV folds; neither CV figure is an unbiased final estimate of the complete selection process.

A stronger follow-up would put all learned preprocessing inside the pipeline, separate model and threshold selection from final assessment, and evaluate once on new untouched data or use nested validation. No deployment, causal conclusion or validated retention return is claimed here.

## Reproduction and code provenance

Follow the [README commands](../README.md#reproduce). The dataset is included, so execution needs no data download. Direct dependencies are pinned in [requirements.txt](../requirements.txt). The verified environment is **CPython 3.14.6 on macOS**, with pandas 3.0.6, NumPy 2.5.4, scikit-learn 1.9.1, SciPy 1.18.1 and imbalanced-learn 0.14.2. Other platforms have not been verified; dependencies and floating-point behavior can affect exact reproduction.

The notebook was prepared from the actual local analysis: duplicate preparation cells and the in-notebook package installation were removed; section notes, data assertions, portable path handling and CSV exports were added. Model configurations and selection logic are retained. The evaluation uses the threshold calculated by the CV search, which is 0.55 in the verified run.

All notebook cells executed successfully on **2026-10-16**, including a repeat from a new virtual environment installed with `requirements.txt`. Both runs produced an identical `metrics.csv`. The five recomputed comparison rows match the README at four decimal places; the selected hyperparameters, mean CV F1 and threshold also match the original analysis. The isolated dependency check reported no conflicts.

The runner uses the current Python interpreter and a temporary Jupyter kernel registration. It executes from the project root, saves a notebook with outputs in `reports/customer_churn.executed.ipynb`, and recomputes the three CSV tables. The source notebook is distributed without outputs. Rerunning can overwrite the report tables.

Code in this project was developed with assistance from **CODEX**.
