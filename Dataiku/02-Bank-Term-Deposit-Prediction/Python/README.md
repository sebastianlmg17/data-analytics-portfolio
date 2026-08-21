# Python

## Overview

Although most of the project was developed using Dataiku's visual interface, Python was used to perform tasks that required greater flexibility during data preparation.

The scripts in this folder were created to address the class imbalance problem before training the machine learning models.

---

## Scripts Included

### `oversampling.py`

This script applies **Oversampling** to the training dataset.

The minority class is randomly duplicated until both classes contain the same number of observations.

This approach preserves all original data while increasing the representation of the minority class.

---

### `undersampling.py`

This script applies **Undersampling** to the training dataset.

The majority class is randomly reduced until both classes become balanced.

This approach creates a smaller but balanced training dataset by removing a portion of the majority class.

---

## Why Python?

Although Dataiku provides visual recipes for many preprocessing tasks, Python was used because it offered greater control over the sampling process and allowed the balancing techniques to be implemented in a simple and reproducible way.

This demonstrates the ability to combine visual workflows with custom Python code when required.

---

## Objective

The generated datasets were used to compare three different machine learning training strategies:

- Original dataset
- Oversampling
- Undersampling

The objective was to evaluate whether balancing the training data improved the predictive performance of the models.
