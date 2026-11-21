# Financial Fraud Anomaly Detection

**[Open the complete Python notebook](notebooks/financial_fraud_anomaly_detection.ipynb)** · [Dataset availability](data/README.md) · [Python projects](../)

## 1. Project title and objective

Explore unsupervised anomaly detection for financial transactions using **DBSCAN** and **Isolation Forest**, then assess how well each method identifies known fraud labels. The notebook preserves the preceding data-exploration exercise and continues with the IEP Unit 2 assignment.

## 2. Business problem and ML approach

Fraudulent transactions may be rare and costly to miss, while false alarms consume investigation capacity. Each row represents one financial transaction. The task is **unsupervised anomaly detection**: the algorithms are fitted without the label `Class`, and the known fraud outcomes are used only for retrospective assessment. An anomaly is not automatically a fraud.

The academic comparison uses precision, recall and F1-score as primary metrics, supplemented by confusion-matrix counts.

## 3. Dataset

- **10,492** transaction records with **30** columns.
- **10,000** legitimate transactions (`Class = 0`) and **492** fraudulent transactions (`Class = 1`).
- Predictor variables: **V1–V28** (anonymized numeric features) and **Amount**. `Class` is excluded from model inputs.
- No missing values were reported in the submitted notebook.
- The local input file is named `fraud (1).csv` (the assignment refers to `fraud.csv`).

**Provenance and usage restriction:** the CSV itself was not supplied for this repository publication. Its exact source, sampling method, redistribution permission and checksum cannot be verified, so the dataset is **not committed**. See [data availability](data/README.md).

## 4. Tools and environment

Python, pandas, NumPy, Matplotlib and scikit-learn. The notebook was authored as a Colab/Jupyter notebook; the exact original package versions were not captured. A compatible dependency range is provided in [requirements.txt](requirements.txt).

## 5. Methodology

1. **Data understanding:** inspect schema, nulls, class balance and transaction-amount outliers with IQR. Identified outliers are retained, not deleted.
2. **Features:** exclude `Class`; convert the remaining 29 numeric columns to a NumPy matrix; standardize using `StandardScaler`.
3. **DBSCAN:** inspect the tenth-nearest-neighbor distance curve as a supplementary heuristic; use `eps=5.0`, `min_samples=10` and Euclidean distance. Treat noise label `-1` as a predicted anomaly.
4. **Isolation Forest:** use `n_estimators=100`, `max_samples="auto"`, `random_state=42`; calculate the negated `decision_function` so higher values are more anomalous.
5. **Thresholds:** classify scores at or above the 95th percentile as anomalies. Explore the 85th percentile as a sensitivity comparison, preserving both sets of predictions.
6. **Evaluation:** compare model flags with the withheld-from-training `Class` labels using confusion matrices, precision, recall and F1-score.

## 6. Results

The following values are taken from the saved outputs of the submitted notebook. They have been checked against their confusion-matrix counts, but **not independently re-executed**, because the input CSV was unavailable during publication.

| Metric | DBSCAN | Isolation Forest P95 | Isolation Forest P85 |
| --- | ---: | ---: | ---: |
| Flagged anomalies | 334 | 525 | 1,574 |
| True positives (fraud detected) | 159 | 329 | 430 |
| True negatives | 9,825 | 9,804 | 8,856 |
| False positives | 175 | 196 | 1,144 |
| False negatives | 333 | 163 | 62 |
| Precision | 47.60% | **62.67%** | 27.32% |
| Recall | 32.32% | 66.87% | **87.40%** |
| F1-score | 38.50% | **64.70%** | 41.63% |

**Comparative baseline:** DBSCAN is the initial reference. Isolation Forest at P95 has the highest F1-score among the evaluated configurations. P85 catches 101 more fraudulent transactions than P95 but generates 948 additional false alarms.

## 7. Interpretation and limitations

Isolation Forest P95 offers the strongest observed precision–recall balance. P85 favors recall at a substantial false-alarm cost. This is a retrospective academic exercise, **not a validated bank fraud-control system**.

- There is **no independent test set** or out-of-sample evaluation: data preparation, anomaly identification and reported comparisons use the same available sample.
- The P85 experiment was inspected against true labels, so threshold choice based on these results cannot be described as an unbiased final assessment.
- The dataset source and sampling procedure are unverified; the observed fraud rate may not represent operational banking data.
- Detection costs, temporal drift, transaction processing latency and the risk of new fraud patterns have not been evaluated.
- Scores from Isolation Forest are **anomaly scores, not calibrated fraud probabilities**.

## 8. How to reproduce

1. Obtain the original CSV from its authorized source; this repository cannot distribute or verify it. Ensure the expected columns `V1`–`V28`, `Amount` and `Class` are present.
2. Make the file available in the notebook's **current working directory** using the exact filename `fraud (1).csv` (or update the `read_csv` path deliberately).
3. Use Google Colab or a local Jupyter environment. In a local Python environment, install dependencies:

   ```bash
   python -m pip install -r requirements.txt
   ```

4. Open [the notebook](notebooks/financial_fraud_anomaly_detection.ipynb) and run all code cells from the beginning. Compare freshly calculated metrics with the table above.

**Reproduction status:** notebook structure and Python syntax were inspected; full numerical reproduction remains pending receipt of the dataset. The version ranges may not reproduce floating-point results byte for byte.

## 9. Project status

**Exploratory complete.** All required exercise sections and an additional threshold comparison are documented. This is not an independently validated final model.

Course context: Instituto Europeo de Posgrado (IEP), financial fraud detection practical assignment. The notebook contains the student's educational work, not the copyrighted assignment statement.
