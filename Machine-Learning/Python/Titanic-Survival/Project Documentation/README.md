# Project Documentation

**Code: [Main analysis and models](../titanic_analysis.ipynb) · [Tree experiments](../titanic_survival_prediction.ipynb)**

## Data and Methodology

The included dataset contains **891 passengers** and 12 columns. `Survived=1` is the positive class. Its schema matches the [Kaggle Titanic dataset](https://www.kaggle.com/competitions/titanic/data); the original download route is unrecorded. [Dataset provenance and checksum](../Data/README.md) describe the supplied snapshot.

Both notebooks remove identifiers, original names, tickets and cabins after deriving retained features. They use median imputation for missing numerical values, one-hot encoding and a stratified **80/20** split with `random_state=42`. Their workflows differ:

| Notebook | Preparation and models | Training / evaluation rows |
| --- | --- | ---: |
| Main analysis | Removes two missing-`Embarked` rows before splitting. Family size and normalized titles; imputation and encoding inside model pipelines. Logistic Regression and Random Forest. Ticket frequency is EDA only; numerical features are not scaled. | 711 / 178 |
| Tree experiments | Removes missing-`Embarked` rows after splitting. Normalized titles, training-derived ticket frequency, training-median age imputation and aligned encoded columns. Decision Tree and Random Forest. | 710 / 179 |

Five-fold searches optimize ROC AUC in the main analysis and F1 in the tree experiments. The analysis notebook's selected Random Forest has 100 trees, maximum depth 10, `min_samples_split=2` and `min_samples_leaf=2`.

## Results

These three models use the main analysis notebook's same **178-passenger evaluation subset**.

| Model | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Logistic Regression | **0.8720** | **0.8315** | **0.8276** | 0.7059 | **0.7619** |
| Random Forest baseline | 0.8213 | 0.8034 | 0.7463 | **0.7353** | 0.7407 |
| Random Forest selected by CV | 0.8348 | 0.8090 | 0.7742 | 0.7059 | 0.7385 |

Logistic Regression leads on accuracy, precision, F1 and ROC AUC; baseline Random Forest has higher recall.

## Evaluation Limits

- Both notebooks perform full-dataset EDA before splitting, which may inform feature choices.
- The tree notebook repeatedly reuses `X_test` for model and parameter comparisons. Its age imputation, ticket frequencies and encoding are prepared before CV, causing preprocessing leakage between folds.
- The main analysis refits imputation and encoding within each CV fold, but compares multiple models on the same outer evaluation subset.
- Different passenger subsets prevent direct comparison between notebooks. These are exploratory results, with **no independent final evaluation**.

## Reproduction

Run from this project directory with **Python 3.14.6** and the [pinned direct dependencies](../requirements.txt):

```bash
python3.14 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python -m ipykernel install --sys-prefix --name titanic-portfolio
jupyter execute titanic_analysis.ipynb --kernel_name=titanic-portfolio --timeout=1800 --output=executed_{notebook_name}
jupyter execute titanic_survival_prediction.ipynb --kernel_name=titanic-portfolio --timeout=7200 --output=executed_{notebook_name}
```

Both notebooks read the included `Data/Titanic_dataset.csv`. The commands save executed copies alongside the sources. Searches use all available workers (`n_jobs=-1`); the tree notebook's 900-fit Random Forest search can take tens of minutes.

Code developed with assistance from **CODEX**.
