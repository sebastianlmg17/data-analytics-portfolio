# Customer Churn Prediction · Python

Compare Logistic Regression and Random Forest on **IBM Telco Customer Churn** (7,043 customers), including random oversampling and Logistic Regression tuning.

| Model | Accuracy | Precision | Recall | F1 | ROC-AUC |
| --- | ---: | ---: | ---: | ---: | ---: |
| Logistic Regression | 0.8055 | 0.6572 | 0.5588 | 0.6040 | 0.8420 |
| Random Forest | 0.7857 | 0.6233 | 0.4866 | 0.5465 | 0.8212 |
| Logistic Regression + OS | 0.7331 | 0.4983 | 0.7861 | 0.6100 | 0.8421 |
| Random Forest + OS | 0.7708 | 0.5684 | 0.5668 | 0.5676 | 0.8179 |
| Tuned Logistic Regression | 0.7544 | 0.5261 | 0.7540 | 0.6198 | 0.8408 |

Tuned LR (`C=0.1`, `class_weight="balanced"`, threshold `0.55`) captures more churn cases, with lower precision and accuracy than baseline LR. OS means random oversampling; positive class is churn.

**Exploratory evaluation:** these experiments reused the same test split. OHE was fitted before cross-validation. The figures are not an independent final evaluation.

## Reproduce

From this project folder, using **Python 3.14.6**:

```bash
python3.14 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python scripts/execute_notebook.py
```

On Windows, create the environment with `python` and activate with `.venv\Scripts\Activate.ps1`. The included CSV is checked by SHA-256. The runner executes all cells and writes recomputed tables and a notebook with outputs to `reports/`.

- [Implementation notebook](notebooks/customer_churn_prediction.ipynb)
- [Project Documentation](Project%20Documentation/README.md) — preparation, experiments, provenance and evaluation limits
- [Verified metric table](reports/metrics.csv)

Code in this project was developed with assistance from **CODEX**.

[Back to Python projects](../README.md)
