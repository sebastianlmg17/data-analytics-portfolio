# 05 - Model Comparison

## Evaluation Setup

Both models use 27 predictors and the same 80/20 random-split configuration, seed 1337, 7,869 training rows and 1,945 test rows. The target is `es_fraude`. Both retain the same One-Hot inputs and binary `cuenta_nueva`.

KNN applies standard scaling only to `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h` and `distancia_ip`; dummies and `cuenta_nueva` have no rescaling. GaussianNB has no rescaling on any feature.

| Model | Final configuration | Final threshold |
| --- | --- | ---: |
| KNN | K = 11; p = 2; no distance weighting | 0.100 |
| Gaussian Naive Bayes | Custom Python Model; `sklearn.naive_bayes.GaussianNB` | 0.825 |

## Final Results

| Metric | KNN | Gaussian Naive Bayes |
| --- | ---: | ---: |
| ROC AUC | 0.9897 | 0.9980 |
| Accuracy | 0.9861 | 0.9882 |
| Precision | 0.9829 | 0.9880 |
| Recall | 0.9712 | 0.9729 |
| F1-score | 0.9770 | 0.9804 |
| Average Precision | 0.9853 | 0.9968 |
| MCC | 0.9671 | 0.9720 |
| Threshold | 0.100 | 0.825 |
| TP | 574 | 575 |
| FN | 17 | 16 |
| FP | 10 | 7 |
| TN | 1344 | 1347 |

## Selected Model

**Gaussian Naive Bayes is selected for this dataset.** It slightly outperforms KNN across all principal metrics, reduces false negatives from 17 to 16 and false positives from 10 to 7.

## Interpretation Limits

Dataiku flagged the exceptional ROC AUC of 0.998. Although `id_transaccion` was removed for leakage, these results should be interpreted cautiously beyond this dataset.

## Model Documentation

- [03 - KNN Model](../03-KNN-Model/)
- [04 - Naive Bayes Model](../04-Naive-Bayes-Model/)
