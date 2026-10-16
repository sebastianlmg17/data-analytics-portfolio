# Project Documentation

[Project overview](../README.md)

## Contents

- [Data Cleaning](#01-data-cleaning)
- [Feature Engineering](#02-feature-engineering)
- [Train/Test Split](#03-train-test-split)
- [Model Training](#04-model-training)
- [Model Optimization](#05-model-optimization)
- [Model Evaluation](#06-model-evaluation)
- [Conclusions and Current Limits](#07-conclusions-and-current-limits)
- [Python](#python)

---

<a id="01-data-cleaning"></a>

## Data Cleaning

### Overview

Predict passenger survival using the included [dataset snapshot](../Data/README.md). The target is `Survived`: `0` = did not survive and `1` = survived.

| Dataset property | Value |
| --- | ---: |
| Passenger records | 891 |
| Columns, including the target | 12 |
| Positive labels | 342 |
| Missing `Embarked` values | 2 |

### Cleaning Decisions

Both notebooks remove the passenger identifier, original name, ticket and cabin after deriving the retained features. Missing numerical values are handled with median imputation; the two rows missing `Embarked` are removed. The order of removal and splitting differs between notebooks and produces different evaluation subsets.

---

<a id="02-feature-engineering"></a>

## Feature Engineering

### Overview

The notebooks preserve two exploratory approaches rather than a single final model.

| Notebook | Features and preprocessing |
| --- | --- |
| [Analysis and pipeline baselines](../titanic_analysis.ipynb) | Family size and normalized titles; median imputation and one-hot encoding inside `Pipeline`/`ColumnTransformer`. Ticket frequency is explored in EDA only. Numerical predictors are not scaled. |
| [Tree experiments](../titanic_survival_prediction.ipynb) | Normalized titles and training-derived ticket frequency; training-median age imputation; one-hot encoding followed by column alignment between training and evaluation data. |

### Methodological Consideration

The analysis notebook learns imputation and encoding within its model pipelines, including each CV fold. The tree notebook prepares age imputation, ticket frequencies and encoding on the outer training split before CV, so those transformations are not relearned within each fold.

---

<a id="03-train-test-split"></a>

## Train/Test Split

### Configuration

Both notebooks use a stratified **80/20** split with `random_state=42`.

| Notebook | Missing-`Embarked` removal | Training rows | Evaluation rows |
| --- | --- | ---: | ---: |
| Analysis and pipeline baselines | Before splitting | 711 | 178 |
| Tree experiments | After splitting | 710 | 179 |

### Conclusion

Models can be compared within their notebook. The different passenger subsets prevent a direct comparison of scores across the two notebooks.

---

<a id="04-model-training"></a>

## Model Training

### Models Evaluated

| Notebook | Models |
| --- | --- |
| Analysis and pipeline baselines | Logistic Regression and Random Forest in preprocessing pipelines |
| Tree experiments | Decision Tree and Random Forest, including depth and minimum split/leaf comparisons |

### Evaluation Metrics

Accuracy, precision, recall, F1 and ROC AUC describe binary classification, with `Survived=1` as the positive class. Model comparisons and tuning are exploratory; the outer evaluation subsets are not independent final assessments.

---

<a id="05-model-optimization"></a>

## Model Optimization

### Configuration

| Notebook | Cross-validation searches |
| --- | --- |
| Analysis and pipeline baselines | Five-fold ROC AUC searches over Logistic Regression `C` and Random Forest tree count, depth, minimum split size and minimum leaf size |
| Tree experiments | Five-fold F1 searches over Decision Tree and Random Forest parameters; the Random Forest grid requires 900 fits |

### Selected Random Forest

The analysis notebook's CV-selected Random Forest uses **100 trees**, maximum depth **10**, `min_samples_split=2` and `min_samples_leaf=2`. Its evaluation metrics appear alongside the baselines below; the search does not establish an independent final model.

---

<a id="06-model-evaluation"></a>

## Model Evaluation

### Execution Check

On **2026-10-16**, both notebooks executed successfully from fresh kernels with **Python 3.14.6** and the listed dependency versions, including all CV searches. The check used four search workers and a noninteractive plotting backend. Source notebook outputs remain cleared; local executed copies provide the run record. This verified execution and metrics, not independent final performance.

### Analysis Notebook Results

All three rows use the same **178-passenger evaluation subset** and `Survived=1` as the positive class.

| Model | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Logistic Regression | **0.8720** | **0.8315** | **0.8276** | 0.7059 | **0.7619** |
| Random Forest baseline | 0.8213 | 0.8034 | 0.7463 | **0.7353** | 0.7407 |
| Random Forest selected by CV | 0.8348 | 0.8090 | 0.7742 | 0.7059 | 0.7385 |

### Interpretation

Logistic Regression achieved the strongest accuracy, precision, F1 and ROC AUC in this comparison. The baseline Random Forest achieved slightly higher recall. CV selection improved the Random Forest's accuracy, precision and ROC AUC over its baseline, while recall and F1 declined.

---

<a id="07-conclusions-and-current-limits"></a>

## Conclusions and Current Limits

### Evaluation Limits

- Both notebooks explore the full labelled dataset before splitting, which may inform feature choices.
- The tree notebook repeatedly evaluates depth, split/leaf settings and models on `X_test`. This is a reused validation subset.
- Its age median, ticket frequencies and encoding are prepared before `GridSearchCV`, introducing preprocessing leakage between training and validation folds.
- The analysis notebook refits imputation and encoding within each CV fold, but multiple model comparisons still use the same outer evaluation subset.

### Conclusion

The project demonstrates passenger feature preparation, classifier comparison and the limits of exploratory model selection. An independent final evaluation would require a new validation plan, every learned transformation inside each fold, and a final assessment kept separate from model selection. No Kaggle submission or deployed predictor is included.

---

<a id="python"></a>

## Python

### Published Code and Data

The actual notebook code, CSV snapshot and pinned direct [dependencies](../requirements.txt) are included. Both notebooks read `Data/Titanic_dataset.csv` relative to the project directory; model seeds and split settings are in the source. See [dataset provenance](../Data/README.md) for the snapshot's source limitations and checksum.

### Reproduction

Run from this project directory, using the tested **Python 3.14.6** environment:

```bash
python3.14 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python -m ipykernel install --sys-prefix --name titanic-portfolio
jupyter execute titanic_analysis.ipynb --kernel_name=titanic-portfolio --timeout=1800 --output=executed_{notebook_name}
jupyter execute titanic_survival_prediction.ipynb --kernel_name=titanic-portfolio --timeout=7200 --output=executed_{notebook_name}
```

These commands register a named kernel in the virtual environment and save executed copies alongside the source notebooks. Notebook execution uses `nbclient` and `ipykernel`; a graphical editor is optional. Grid searches use all available workers by default (`n_jobs=-1`), and the tree notebook's 900-fit Random Forest search can take tens of minutes, depending on hardware. The dependency file records tested direct package versions; it is not a full transitive lock or a cross-platform guarantee.

### Code Assistance

The code was developed with assistance from **CODEX**.

### Explore this project

- [Project overview](../README.md)
- [Analysis and pipeline baselines](../titanic_analysis.ipynb)
- [Tree experiments](../titanic_survival_prediction.ipynb)
- [Dataset and provenance](../Data/README.md)
- [Dependencies](../requirements.txt)
- [Project catalogue](../../../README.md)
