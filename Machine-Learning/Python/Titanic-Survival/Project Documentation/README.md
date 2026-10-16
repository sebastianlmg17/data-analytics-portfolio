# Titanic Survival Prediction — Project Documentation

## Objective and data

Predict passenger survival (`Survived`: 0 = did not survive, 1 = survived) using the included [dataset snapshot](../Data/README.md). It contains 891 passengers, 12 columns and 342 positive labels. The two notebooks preserve separate exploratory approaches rather than a single final model.

## Notebook workflows

| Notebook | Preparation and models | Evaluation split |
| --- | --- | --- |
| [Analysis and pipeline baselines](../titanic_analysis.ipynb) | Family size and normalized title features; remove passenger ID, name, ticket and cabin; median imputation and one-hot encoding inside `Pipeline`/`ColumnTransformer`; Logistic Regression and Random Forest, followed by CV searches. Ticket frequency is EDA only. | Drop two missing `Embarked` rows first; 711 training / 178 evaluation rows. |
| [Tree experiments](../titanic_survival_prediction.ipynb) | Normalized title and training-derived ticket frequency; median age imputation; remove passenger ID, name, ticket and cabin; one-hot encode and align columns. Decision Tree and Random Forest with depth, split/leaf and CV searches. | Split first, then drop missing `Embarked` rows; 710 training / 179 evaluation rows. |

Both begin with a stratified 80/20 split and `random_state=42`. The analysis notebook does not scale numeric predictors. Different preparation orders produce different passenger subsets; compare models within a notebook, not across the two notebooks.

## Reproducibility

The repository includes the actual notebook code, CSV snapshot and pinned direct [dependencies](../requirements.txt). Run the commands in the [project README](../README.md) from the project directory. Each notebook loads `Data/Titanic_dataset.csv` with a relative path. Model seeds and split settings are present in the source.

The dependency file records the tested direct package versions; it is not a full transitive lock or a cross-platform guarantee. The setup registers a named kernel inside the virtual environment so execution uses that interpreter. Notebook execution uses `nbclient` and `ipykernel`; a graphical notebook editor is optional. Grid searches use all available workers by default (`n_jobs=-1`).

## Execution check and exploratory results

On 2026-10-16, both notebooks executed successfully from fresh kernels using Python 3.14.6 and the listed package versions, including all CV searches. Source notebook outputs remain cleared; local executed copies provide the run record. The check used four search workers and a noninteractive plotting backend; it verified code execution and metrics, not an independent final evaluation.

| Analysis notebook model | Accuracy | Precision | Recall | F1 | ROC-AUC |
| --- | ---: | ---: | ---: | ---: | ---: |
| Logistic Regression | 0.8315 | 0.8276 | 0.7059 | 0.7619 | 0.8720 |
| Random Forest baseline | 0.8034 | 0.7463 | 0.7353 | 0.7407 | 0.8213 |
| Random Forest selected by CV | 0.8090 | 0.7742 | 0.7059 | 0.7385 | 0.8348 |

Metrics use `Survived=1` as the positive class and the same 178-row evaluation subset. The selected Random Forest uses 100 trees, depth 10, `min_samples_split=2` and `min_samples_leaf=2`.

## Evaluation limits

- Both notebooks explore the full labelled dataset before splitting, which may inform feature choices.
- The tree notebook repeatedly evaluates depth, split/leaf settings and models on `X_test`. This is a reused validation subset, not an untouched final test.
- Its age median, ticket frequencies and encoding are prepared on the outer training split before `GridSearchCV`, rather than learned separately inside each CV fold. CV results therefore include preprocessing leakage between training and validation folds.
- In the analysis notebook, imputation and encoding are inside the model pipelines and are refitted per CV fold. Multiple model comparisons still use the same outer evaluation subset.

These experiments support learning and model comparison. An independent final evaluation would require a new validation plan, every learned transformation inside each fold, and a final assessment kept separate from model selection. No Kaggle submission or deployed predictor is included.

## Code assistance

The code was developed with assistance from **CODEX**.
