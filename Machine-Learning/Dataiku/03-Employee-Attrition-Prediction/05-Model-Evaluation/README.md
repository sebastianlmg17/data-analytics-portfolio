# Model Evaluation

## Evaluation Strategy

Model performance was evaluated on the **original test dataset of 294 records**. The test set was kept separate from the resampling procedures and was not modified.

This ensured that the different training strategies could be compared against the same unseen data.

## Metrics

Because employee attrition is an imbalanced classification problem, several complementary metrics were considered:

* **Accuracy** — overall proportion of correct predictions.
* **Precision** — proportion of predicted attrition cases that were actually attrition cases.
* **Recall** — proportion of actual attrition cases detected by the model.
* **F1-Score** — harmonic mean of Precision and Recall.
* **ROC AUC** — ability of the model to discriminate between the two classes across classification thresholds.
* **Confusion Matrix** — detailed view of True Positives, False Positives, True Negatives and False Negatives.

## Initial Decision Tree Evaluation

| Model | Accuracy | Precision | Recall | F1-Score | ROC AUC |
|---|---:|---:|---:|---:|---:|
| Original Decision Tree | 80.95% | 51.56% | 56.90% | 54.10% | 79.40% |
| Decision Tree + Oversampling | 80.95% | 51.28% | 68.97% | 58.82% | 80.94% |
| Decision Tree + Undersampling | 71.77% | 39.13% | 77.59% | 52.02% | 79.65% |

Oversampling improved Recall and F1-Score compared with the original Decision Tree while maintaining Accuracy. Undersampling achieved the highest Recall but produced considerably more false positives.

## Final Model Comparison

After model optimization and comparison, the final test-set results were:

| Model | Accuracy | Precision | Recall | F1-Score | ROC AUC |
|---|---:|---:|---:|---:|---:|
| Decision Tree + Oversampling | 80.95% | 51.28% | 68.97% | 58.82% | 80.94% |
| Optimized Decision Tree | 74.49% | 40.86% | 65.52% | 50.33% | 74.09% |
| **Logistic Regression** | **87.76%** | **77.50%** | 53.45% | **63.27%** | **86.27%** |
| Random Forest | 78.91% | 47.44% | 63.79% | 54.41% | 79.19% |

## Logistic Regression Confusion Matrix

The selected Logistic Regression model produced:

* True Positives: **31**
* False Negatives: **27**
* False Positives: **9**
* True Negatives: **227**

The model was considerably more selective than the Decision Tree approaches: it detected fewer attrition cases than the oversampled and undersampled models, but generated substantially fewer false positives and achieved the highest Precision, F1-Score and ROC AUC.

## Evaluation Conclusion

The evaluation shows why Accuracy alone should not determine model selection in this problem. Different training strategies produced different trade-offs between Recall and Precision.

Logistic Regression provided the strongest overall performance among the evaluated models and was therefore selected as the final model.
