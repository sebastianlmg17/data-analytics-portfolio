# Methodology and experiment notes

[Project overview](../README.md)

## Contents

- [Data Exploration](#01-data-exploration)
- [Data Preparation](#02-data-preparation)
- [Decision Tree](#03-decision-tree)
- [Random Forest](#04-random-forest)
- [Gradient Boosted Trees](#05-gradient-boosting)
- [Model Comparison](#06-model-comparison)

---

<a id="01-data-exploration"></a>

## Data Exploration

- 50,000 rows and 13 columns.
- Target: `riesgo_credito` (`1` high risk, `0` low risk).
- Class distribution: 70% low risk / 30% high risk.
- No exact duplicate rows.
- Missing values: 5,000 in `estabilidad_laboral` and 5,000 in `cuenta_corriente`.
- Potential IQR outliers were retained because they were not identified as invalid data.

---

<a id="02-data-preparation"></a>

## Data Preparation

### Missing Values

- `estabilidad_laboral`: imputed with median **4.2**.
- `cuenta_corriente`: replaced with category **desconocido**.

### Categorical Encoding

One-Hot Encoding was applied to `propiedad_vivienda`, `tipo_empleo`, `tipo_contrato`, `tipo_credito_activo`, `proposito_credito`, `ahorros` and `cuenta_corriente`.

### Train / Test Split

- Training: 39,970 rows
- Test: 10,030 rows

The same test set was used for all three algorithms.

---

<a id="03-decision-tree"></a>

## Decision Tree

### Configuration

- Split criterion: Gini
- Maximum depth: 5
- Minimum samples per leaf: 1
- Split strategy: Best

### Test Results

- ROC AUC: **0.9328**
- Accuracy: **0.8783**
- Precision: **0.7815**
- Recall: **0.8273**
- F1-score: **0.8037**

### Confusion Matrix

- TP: 2,500
- FN: 522
- FP: 699
- TN: 6,309

---

<a id="04-random-forest"></a>

## Random Forest

Random Forest was used as the bagging-based tree ensemble.

### Configuration

- Number of trees: 100
- Maximum depth: 6
- Minimum samples per leaf: 1
- Feature sampling strategy: Square root

### Test Results

- ROC AUC: **0.9592**
- Accuracy: **0.8991**
- Precision: **0.8174**
- Recall: **0.8564**
- F1-score: **0.8365**

### Confusion Matrix

- TP: 2,588
- FN: 434
- FP: 578
- TN: 6,430

---

<a id="05-gradient-boosting"></a>

## Gradient Boosted Trees

Gradient Boosted Trees was used as the boosting-based tree ensemble.

### Configuration

- Number of boosting stages: 100
- Learning rate: 0.1
- Maximum depth: 3
- Minimum samples per leaf: 1
- Loss: Deviance
- Feature sampling strategy: Square root

### Test Results

- ROC AUC: **0.9674**
- Accuracy: **0.9137**
- Precision: **0.8565**
- Recall: **0.8570**
- F1-score: **0.8568**

### Confusion Matrix

- TP: 2,590
- FN: 432
- FP: 434
- TN: 6,574

---

<a id="06-model-comparison"></a>

## Model Comparison

All three models were evaluated on the same 10,030-row test set.

| Model | ROC AUC | Accuracy | Precision | Recall | F1-score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Decision Tree | 0.9328 | 0.8783 | 0.7815 | 0.8273 | 0.8037 |
| Random Forest | 0.9592 | 0.8991 | 0.8174 | 0.8564 | 0.8365 |
| **Gradient Boosted Trees** | **0.9674** | **0.9137** | **0.8565** | **0.8570** | **0.8568** |

### Final Selection

**Gradient Boosted Trees** was selected because it achieved the strongest overall performance across the principal metrics.

It also produced the fewest false negatives: **432** high-risk cases were classified as low risk, compared with 434 for Random Forest and 522 for the Decision Tree.
