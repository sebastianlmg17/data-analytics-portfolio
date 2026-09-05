# Model Evaluation

## Overview

This section compares the three class-imbalance strategies evaluated during the initial model experiments. All models were evaluated on the same unchanged testing dataset.

## Performance Comparison

| Training Strategy | ROC AUC | Accuracy | Precision | Recall | F1-Score |
|---|---:|---:|---:|---:|---:|
| Original Dataset | **0.9283** | **0.8975** | **0.5537** | **0.6609** | **0.6026** |
| Oversampling | 0.7982 | 0.8722 | 0.4461 | 0.4797 | 0.4623 |
| Undersampling | 0.8026 | 0.8671 | 0.4347 | 0.5338 | 0.4792 |

## Class Imbalance Results

Neither Oversampling nor Undersampling improved the baseline Random Forest. The original dataset therefore remained the strongest approach for the initial model comparison.

## Next Step: Model Optimization

The original Random Forest was then used as the baseline for hyperparameter optimization. Two optimization experiments were performed. V1 reduced performance, while V2 achieved a test ROC AUC of **0.9535**.

Therefore, the class-imbalance comparison and hyperparameter optimization are treated as separate stages of the model development process.

## Conclusion

The experiments demonstrate that class balancing should be evaluated empirically rather than assumed to improve performance. In this project, the original class distribution performed better than both sampling approaches, after which hyperparameter optimization was used to further improve the Random Forest.