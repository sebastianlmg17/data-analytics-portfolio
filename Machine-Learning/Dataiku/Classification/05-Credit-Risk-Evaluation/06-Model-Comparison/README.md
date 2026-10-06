# Model Comparison

All three models were evaluated on the same 10,030-row test set.

| Model | ROC AUC | Accuracy | Precision | Recall | F1-score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Decision Tree | 0.9328 | 0.8783 | 0.7815 | 0.8273 | 0.8037 |
| Random Forest | 0.9592 | 0.8991 | 0.8174 | 0.8564 | 0.8365 |
| **Gradient Boosted Trees** | **0.9674** | **0.9137** | **0.8565** | **0.8570** | **0.8568** |

## Final Selection

**Gradient Boosted Trees** was selected because it achieved the strongest overall performance across the principal metrics.

It also produced the fewest false negatives: **432** high-risk cases were classified as low risk, compared with 434 for Random Forest and 522 for the Decision Tree.
