# Titanic Survival Prediction · Python

A Python classification project using 891 Titanic passenger records. Two notebooks cover exploratory analysis, feature engineering, Logistic Regression, Decision Tree and Random Forest experiments.

- [Analysis and pipeline baselines](titanic_analysis.ipynb): imputation and encoding inside scikit-learn pipelines.
- [Tree experiments](titanic_survival_prediction.ipynb): regularization comparisons and cross-validation searches.
- [Project Documentation](Project%20Documentation/README.md): methodology, execution checks and evaluation limits.
- [Dataset and provenance](Data/README.md) · [Dependencies](requirements.txt) · [Dataiku counterpart](../../Dataiku/Titanic-Survival/)

The experiments are exploratory. Full-dataset EDA precedes splitting, and the tree notebook reuses its evaluation subset during model comparison and preprocesses before CV. The notebooks use different row-filtering orders, so their scores are not directly comparable. See the documentation before interpreting results.

Run from this project directory (tested with Python 3.14.6):

```bash
python3.14 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python -m ipykernel install --sys-prefix --name titanic-portfolio
jupyter execute titanic_analysis.ipynb --kernel_name=titanic-portfolio --timeout=1800 --output=executed_{notebook_name}
jupyter execute titanic_survival_prediction.ipynb --kernel_name=titanic-portfolio --timeout=7200 --output=executed_{notebook_name}
```

These commands save executed copies alongside the source notebooks. The tree notebook's 900-fit Random Forest search can take tens of minutes, depending on hardware.

**Code assistance:** The code was developed with assistance from **CODEX**.
