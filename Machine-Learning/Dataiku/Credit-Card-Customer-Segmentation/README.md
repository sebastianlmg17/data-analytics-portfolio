# Credit Card Customer Segmentation — K-Means

## Overview

Unsupervised segmentation of credit-card customers using **Dataiku DSS**. The goal is to identify behaviorally distinct groups that could inform exploratory portfolio analysis. This is an academic case study, **not a deployed credit-risk, fraud, or marketing decision system**.

## Business question

Can customers be grouped into interpretable segments based on card balances, purchase behavior, cash advances, payments, and credit limits, while avoiding overly fragmented segments?

## Data and preparation

- Source: course-provided `CC GENERAL(1).csv`, **8,950 records, 18 columns** (one customer identifier plus 17 numeric variables). The original dataset's upstream provenance is not established here.
- Missing values: **313** in `MINIMUM_PAYMENTS` and **1** in `CREDIT_LIMIT`. Imputed with each variable's mean (approximately 864.21 and 4,494.45, respectively).
- Applied the assignment's rule: if `PAYMENTS = 0`, then `MINIMUM_PAYMENTS = 0`; **240** zero-payment records retained.
- Removed `CUST_ID` before modeling.
- Kept only records satisfying all six strict thresholds: `BALANCE < 15000`, `PURCHASES < 40000`, `ONEOFF_PURCHASES < 30000`, `INSTALLMENTS_PURCHASES < 20000`, `CASH_ADVANCE < 40000`, `MINIMUM_PAYMENTS < 60000`.
- Those filters excluded **18 records**. Final prepared dataset: **8,932 rows × 17 numeric variables**, without missing values.

## Model configuration and selection

- Algorithm: **K-Means**, Dataiku DSS; **Standard rescaling** applied within model preprocessing.
- General settings: **No sampling (whole data)**; **Drop outliers** enabled.
- `Number of tested initial centroids`: **10**.
- Compared `k = 3`, `k = 5`, and `k = 7`.

| k | Silhouette | Smallest numbered group (share of 8,932 input records) |
| ---: | ---: | ---: |
| 3 | 0.206 | 15.11% |
| **5** | **0.2134** | **11.80%** |
| 7 | 0.229 | 5.56% |

**Selected k = 5** for general-purpose segmentation. Although k = 7 scored higher on Silhouette (by 0.0156), it produced two groups below 7% of the input population. The five-group solution balances interpretability and segment size. This is an operational trade-off, **not evidence that k = 5 is universally optimal**.

For k = 5, Dataiku reported inertia of approximately **65,670** (`6.567e+4`). Silhouette scores are modest, indicating limited cluster separation.

## Customer segments (k = 5)

The scored dataset contains **8,720 records with numbered cluster labels** and **212 without such labels**, consistent with the enabled `Drop outliers` setting (but without an independent record-by-record verification of why each was unassigned).

| Label | Customers | Share of 8,932 | Behavioral description | Mean balance | Mean purchases | Mean cash advance |
| --- | ---: | ---: | --- | ---: | ---: | ---: |
| `cluster_0` | 2,208 | 24.72% | Frequent installment purchasers | 726 | 885 | 202 |
| `cluster_1` | 1,235 | 13.83% | Active, higher-spend purchasers | 1,743 | 3,155 | 340 |
| `cluster_2` | 1,054 | 11.80% | High cash-advance use and larger balances | 4,441 | 425 | 4,139 |
| `cluster_3` | 2,921 | 32.70% | Recurring balances with limited purchasing | 1,431 | 270 | 698 |
| `cluster_4` | 1,302 | 14.58% | Very low overall card utilization | 110 | 331 | 324 |

Monetary numbers are rounded means in the **dataset's original units**, not necessarily a verified currency. Cluster 0 has higher **installment-purchase frequency**, whereas cluster 1 has the higher **mean installment-purchase amount**.

These groups suggest hypotheses for differentiated financial communications, engagement, or further analysis. **No commercial uplift or causal effect has been demonstrated.**

## Results and evidence

- [Model comparison metrics](results/model-comparison.csv)
- [All 17 empirical cluster-center coordinates, in original data units](results/empirical-cluster-centers-original-units.csv)
- [Preparation and interpretation notes](docs/methodology-and-limitations.md)

The empirical centers above are **per-cluster averages of the scored, labeled records**, and must not be presented as the exact internal standardized K-Means centroids.

## Reproducibility and limitations

This repository documents results computed in Dataiku and independently checked against the scoring CSV. It **does not contain a runnable exported Dataiku project or serialized fitted model**. The training/scoring pipeline would have to be exported from Dataiku for exact model reuse. The original row-level dataset and assessment screenshots are intentionally not republished here.

K-Means is descriptive: there is no outcome label for customer profitability, default, or fraud. Clusters need stability testing, business validation, and governance review before any operational use.

[Dataiku projects](../) · [Machine Learning catalogue](../../) · [Portfolio](../../../)
