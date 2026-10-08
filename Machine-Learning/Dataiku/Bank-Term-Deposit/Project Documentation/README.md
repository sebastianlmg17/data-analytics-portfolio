# Project Documentation

[Project overview](../README.md)

## Contents

- [Data Cleaning](#01-data-cleaning)
- [Categorical Features](#02-feature-engineering)
- [Train/Test Split](#03-train-test-split)
- [Original Model](#04-model-training-original-model)
- [Machine Learning](#04-model-training)
- [Oversampling](#05-class-imbalance-oversampling)
- [Undersampling](#05-class-imbalance-undersampling)
- [Model Evaluation](#06-model-evaluation)
- [Model Optimization](#07-model-optimization)
- [Final Model Selection](#08-final-model-selection)
- [Python](#python)

---

<a id="01-data-cleaning"></a>

## Data Cleaning

### Overview

This section documents the data cleaning process performed before training the machine learning models.

The objective was to ensure that the dataset was consistent, complete and suitable for predictive modeling while preserving as much useful information as possible.

---

### Original Dataset

The original dataset contains customer demographic information, financial attributes and historical marketing campaign data collected by a Portuguese banking institution.

The original dataset is included in this folder as:

- `bank-full.csv`

---

### Cleaning Process

The following steps were performed:

- Reviewed every variable individually.
- Verified data types.
- Checked for missing and inconsistent values.
- Evaluated each feature based on its business relevance.
- Preserved variables that could provide predictive value.
- Removed variables that could introduce data leakage.

---

### Removed Features

#### duration

The **duration** variable was removed before model training.

This feature represents the duration of the phone call made during the marketing campaign.

Although it is highly correlated with the target variable, this information is only available **after** the call has finished.

Keeping this variable would introduce **data leakage**, allowing the model to learn from information that would not be available when making real-world predictions.

---

### Clean Dataset

The cleaned dataset is included in this folder as:

- `bank-full_clean.csv`

This dataset was used as the starting point for feature engineering and model development.

---

### Outcome

The cleaning process produced a dataset ready for machine learning while maintaining data quality and preventing information leakage.

---

<a id="02-feature-engineering"></a>

### Categorical Features

Several variables in the dataset are categorical, including:

- job
- marital
- education
- contact
- month
- housing
- loan
- default
- poutcome

Although these variables require categorical encoding, **One-Hot Encoding was intentionally not performed manually during data preparation**.

Instead, the encoding process was delegated to Dataiku's machine learning pipeline.

This approach offers several advantages:

- Keeps the data preparation workflow simpler and easier to maintain.
- Ensures consistent preprocessing during model training.
- Automatically handles categorical variables within the training pipeline.
- Avoids creating unnecessary intermediate datasets.

This workflow reflects a common practice when using machine learning platforms such as Dataiku, where feature encoding is integrated into the modeling pipeline.

---

<a id="03-train-test-split"></a>

## Train/Test Split

### Overview

Before training any machine learning model, the dataset was divided into separate training and testing sets.

This step ensures that the model is evaluated on unseen data, providing a reliable estimate of its performance on new customers.

---

### Split Configuration

The dataset was divided using the following ratio:

- **Training Set:** 80%
- **Testing Set:** 20%

The training dataset was used to train the machine learning models, while the testing dataset was reserved exclusively for evaluation.

---

### Why Perform a Train/Test Split?

Separating the data before model training helps prevent overfitting and provides an unbiased evaluation of model performance.

The model learns patterns from the training data and is then tested on completely unseen observations.

This process simulates how the model would perform in a real-world scenario when predicting whether a new customer will subscribe to a term deposit.

---

### Important Consideration

The Train/Test Split was performed **before** applying any sampling techniques.

This is an essential machine learning practice because the testing dataset must always preserve the original class distribution.

Only the training dataset was used to create the Oversampling and Undersampling versions.

This prevents data leakage and guarantees a fair comparison between all trained models.

---

### Outcome

The resulting datasets served as the foundation for all subsequent machine learning experiments performed in this project.

---

<a id="04-model-training-original-model"></a>

## Original Model

### Overview

The original model was trained using the **original training dataset**, preserving the natural class distribution of the target variable.

This experiment served as the **baseline** for evaluating whether class balancing techniques such as Oversampling and Undersampling could improve predictive performance.

---

### Dataset

The model was trained using the original training dataset obtained after the Train/Test Split.

No sampling techniques were applied before training.

This allowed the models to learn directly from the original distribution of customer responses.

---

### Models Evaluated

Two classification algorithms were trained:

* Random Forest
* Logistic Regression

Both models were evaluated using the same testing dataset later used for the Oversampling and Undersampling experiments, ensuring a fair comparison between the three training strategies.

---

### Evaluation Metrics

Model performance was measured using:

* ROC AUC
* Accuracy
* Precision
* Recall
* F1-Score

These metrics provide a broader evaluation of classification performance than relying on Accuracy alone, particularly because the target variable presents class imbalance.

---

### Results

The original training experiment produced the following results:

| Model               |    ROC AUC |   Accuracy |  Precision |     Recall |   F1-Score |
| ------------------- | ---------: | ---------: | ---------: | ---------: | ---------: |
| Random Forest       | **0.9283** | **0.8975** | **0.5537** | **0.6609** | **0.6026** |
| Logistic Regression |     0.8940 |          — |          — |          — |          — |

The Random Forest model achieved a ROC AUC of **0.9283**, together with an Accuracy of **0.8975**, Precision of **0.5537**, Recall of **0.6609**, and an F1-Score of **0.6026**.

These results provided the strongest overall performance among the Random Forest experiments conducted in the project.

---

### Comparison with Sampling Experiments

The Random Forest ROC AUC obtained with each training strategy was:

| Training Strategy |    ROC AUC |
| ----------------- | ---------: |
| Original Dataset  | **0.9283** |
| Oversampling      |     0.7982 |
| Undersampling     |     0.8026 |

Neither Oversampling nor Undersampling improved the Random Forest model compared with training on the original class distribution.

---

### Conclusion

The **Random Forest model trained on the original dataset** was selected as the final model for this stage of the project.

The experiments demonstrated that applying class balancing techniques did not automatically lead to better predictive performance.

For this dataset, preserving the original training information produced better results than either duplicating minority-class observations through Oversampling or removing majority-class observations through Undersampling.

This comparison reinforces the importance of evaluating preprocessing strategies empirically rather than assuming that balancing an imbalanced dataset will necessarily improve model performance.


The original model is the baseline winner of the sampling comparison. The final project model is optimized Random Forest V2, documented in Final Model Selection.

---

<a id="04-model-training"></a>

## Machine Learning

### Overview

This section describes the machine learning workflow used to predict whether a customer would subscribe to a term deposit.

Several classification models and sampling strategies were evaluated to identify the most effective solution.

---

### Train/Test Split

The cleaned dataset was divided into:

- **80% Training Set**
- **20% Test Set**

The test dataset remained unchanged throughout the experiments to ensure a consistent evaluation.

---

### Models Evaluated

Two classification algorithms were initially evaluated:

- Random Forest
- Logistic Regression

The models were evaluated using ROC AUC, Accuracy, Precision, Recall and F1-Score.

The Random Forest achieved the strongest baseline performance and was selected for further experimentation.

---

### Handling Class Imbalance

Three training strategies were evaluated:

- **Original Dataset**
- **Oversampling**
- **Undersampling**

Neither sampling technique improved the baseline Random Forest performance.

---

### Hyperparameter Optimization

The baseline Random Forest was subsequently optimized using Grid Search with 5-fold cross-validation.

Two optimization experiments were performed. V1 performed worse than the baseline, while V2 improved the model substantially, reaching a test ROC AUC of **0.9535**.

The optimized model is documented in **Model-Optimization** and was selected as the strongest model obtained in the project.

---


---

<a id="05-class-imbalance-oversampling"></a>

## Oversampling

### Overview

This experiment evaluates the impact of **Oversampling** on the performance of the machine learning models.

The objective was to determine whether increasing the representation of the minority class could improve the model's ability to identify customers who subscribe to a term deposit.

---

### Why Oversampling?

The original training dataset presented an imbalanced class distribution.

* Majority class: Customers who **did not subscribe** (`y = 0`)
* Minority class: Customers who **subscribed** (`y = 1`)

An imbalanced dataset may cause machine learning models to favor the majority class, reducing their ability to correctly classify minority class observations.

Oversampling addresses this issue by increasing the number of minority class examples.

---

### Implementation

The minority class was randomly duplicated until it contained the same number of observations as the majority class.

Only the training dataset was modified.

The testing dataset remained unchanged to ensure that model evaluation reflected the original data distribution.

---

### Model Training

The balanced training dataset was used to train the following classification models:

* Random Forest
* Logistic Regression

Model performance was evaluated using:

* ROC AUC
* Accuracy
* Precision
* Recall
* F1-Score

---

### Results

The Oversampling experiment produced the following results:

| Model               | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| ------------------- | ------: | -------: | --------: | -----: | -------: |
| Random Forest       |  0.7982 |   0.8722 |    0.4461 | 0.4797 |   0.4623 |
| Logistic Regression |  0.8940 |        — |         — |      — |        — |

Although Oversampling successfully balanced the training data, it did not improve the overall predictive performance of the Random Forest model compared with the original training dataset.

The Random Forest model achieved a ROC AUC of **0.7982**, while the Logistic Regression model achieved a ROC AUC of **0.8940**.

---

### Conclusion

Oversampling proved to be a valuable experiment for evaluating the effect of class balancing.

However, for this dataset, duplicating minority class observations did not improve the performance of the Random Forest model.

The results suggest that increasing the representation of the minority class did not provide additional information that improved the model's ability to generalize to the unchanged test dataset.


---

<a id="05-class-imbalance-undersampling"></a>

## Undersampling

### Overview

This experiment evaluates the impact of **Undersampling** on the performance of the machine learning models.

The objective was to determine whether balancing the training dataset by reducing the majority class could improve the model's ability to predict customers who subscribe to a term deposit.

---

### Why Undersampling?

The original training dataset presented a significant class imbalance.

* Majority class: Customers who **did not subscribe** (`y = 0`)
* Minority class: Customers who **subscribed** (`y = 1`)

Machine learning models trained on imbalanced data may become biased toward the majority class, making it more difficult to correctly identify customers belonging to the minority class.

Undersampling addresses this issue by reducing the number of observations in the majority class.

---

### Implementation

The majority class was randomly sampled until it contained the same number of observations as the minority class.

As a result, the training dataset became balanced while the testing dataset remained unchanged.

This approach ensured that model evaluation was always performed using the original test data distribution.

---

### Model Training

The balanced training dataset was used to train the following classification models:

* Random Forest
* Logistic Regression

Model performance was evaluated using:

* ROC AUC
* Accuracy
* Precision
* Recall
* F1-Score

---

### Results

The Undersampling experiment produced the following results:

| Model               | ROC AUC | Accuracy | Precision | Recall | F1-Score |
| ------------------- | ------: | -------: | --------: | -----: | -------: |
| Random Forest       |  0.8026 |   0.8671 |    0.4347 | 0.5338 |   0.4792 |
| Logistic Regression |  0.8940 |        — |         — |      — |        — |

Although Undersampling successfully balanced the training data, it did not improve the overall predictive performance of the Random Forest model compared with the original training dataset.

The Random Forest model achieved a ROC AUC of **0.8026**, while the Logistic Regression model achieved a ROC AUC of **0.8940**.

---

### Conclusion

Undersampling proved to be a useful experiment for evaluating the effect of class balancing.

However, reducing the majority class did not improve the performance of the Random Forest model.

Removing observations from the majority class also meant removing potentially useful information from the training data, which may have contributed to the lower predictive performance observed in comparison with the original training dataset.


---

<a id="06-model-evaluation"></a>

## Model Evaluation

### Overview

This section compares the three class-imbalance strategies evaluated during the initial model experiments. All models were evaluated on the same unchanged testing dataset.

### Performance Comparison

| Training Strategy | ROC AUC | Accuracy | Precision | Recall | F1-Score |
|---|---:|---:|---:|---:|---:|
| Original Dataset | **0.9283** | **0.8975** | **0.5537** | **0.6609** | **0.6026** |
| Oversampling | 0.7982 | 0.8722 | 0.4461 | 0.4797 | 0.4623 |
| Undersampling | 0.8026 | 0.8671 | 0.4347 | 0.5338 | 0.4792 |

### Class Imbalance Results

Neither Oversampling nor Undersampling improved the baseline Random Forest. The original dataset therefore remained the strongest approach for the initial model comparison.

### Next Step: Model Optimization

The original Random Forest was then used as the baseline for hyperparameter optimization. Two optimization experiments were performed. V1 reduced performance, while V2 achieved a test ROC AUC of **0.9535**.

Therefore, the class-imbalance comparison and hyperparameter optimization are treated as separate stages of the model development process.

### Conclusion

The experiments demonstrate that class balancing should be evaluated empirically rather than assumed to improve performance. In this project, the original class distribution performed better than both sampling approaches, after which hyperparameter optimization was used to further improve the Random Forest.

---

<a id="07-model-optimization"></a>

## Model Optimization

### Overview

This section documents the hyperparameter optimization performed on the baseline Random Forest model.

Two Grid Search experiments were performed using 5-fold cross-validation.

#### Optimization V1

Best configuration:

- `max_depth`: 15
- `min_samples_leaf`: 2
- `n_estimators`: 300
- `min_samples_split`: 6

**Test ROC AUC: 0.9105**

V1 performed worse than the original model and was rejected.

#### Optimization V2

Best configuration:

- `max_depth`: 20
- `min_samples_leaf`: 3
- `n_estimators`: 500
- `min_samples_split`: 9

**Test ROC AUC: 0.9535**

| Metric | Original | Optimized V2 |
|---|---:|---:|
| ROC AUC | 0.9283 | **0.9535** |
| Accuracy | 0.8975 | **0.9008** |
| Recall | 0.6609 | **0.8284** |
| F1-Score | 0.6026 | **0.6627** |

The selected classification threshold was **0.475**, chosen by Dataiku to optimize F1-Score.

### Result

Optimization V2 produced the strongest Random Forest performance obtained in the project and was selected for the next stage.

---

<a id="08-final-model-selection"></a>

## Final Model Selection

### Overview

The final model was selected after comparing the original Random Forest, class imbalance experiments, and hyperparameter optimization results.

### Selected Model

**Optimized Random Forest V2**

- `max_depth`: 20
- `min_samples_leaf`: 3
- `n_estimators`: 500
- `min_samples_split`: 9
- Threshold: **0.475**

### Final Performance

| Metric | Score |
|---|---:|
| ROC AUC | **0.9535** |
| Accuracy | **0.9008** |
| Precision | 0.5522 |
| Recall | **0.8284** |
| F1-Score | **0.6627** |
| MCC | **0.6244** |

### Conclusion

The optimized Random Forest V2 achieved the strongest overall performance obtained in the project and was selected as the final model at this stage.

The model improved the baseline ROC AUC from **0.9283 to 0.9535** while substantially increasing Recall.

---

<a id="python"></a>

## Python

### Overview

Although most of the project was developed using Dataiku's visual interface, Python was used to perform tasks that required greater flexibility during data preparation.

The scripts in this folder were created to address the class imbalance problem before training the machine learning models.

---

### Scripts Included

#### `oversampling.py`

This script applies **Oversampling** to the training dataset.

The minority class is randomly duplicated until both classes contain the same number of observations.

This approach preserves all original data while increasing the representation of the minority class.

---

#### `undersampling.py`

This script applies **Undersampling** to the training dataset.

The majority class is randomly reduced until both classes become balanced.

This approach creates a smaller but balanced training dataset by removing a portion of the majority class.

---

### Why Python?

Although Dataiku provides visual recipes for many preprocessing tasks, Python was used because it offered greater control over the sampling process and allowed the balancing techniques to be implemented in a simple and reproducible way.

This demonstrates the ability to combine visual workflows with custom Python code when required.

---

### Objective

The generated datasets were used to compare three different machine learning training strategies:

- Original dataset
- Oversampling
- Undersampling

The objective was to evaluate whether balancing the training data improved the predictive performance of the models.


---

## Extended project overview

# Bank Term Deposit Prediction

## Project Overview

This project uses the UCI Bank Marketing dataset to build a machine learning model capable of predicting whether a customer will subscribe to a term deposit after a direct marketing campaign.

The project was developed in **Dataiku DSS**, combining visual data preparation, Python recipes and machine learning experimentation. Different sampling strategies and hyperparameter configurations were evaluated to improve model performance.

## Business Objective

Predict whether a customer will subscribe to a **term deposit** based on demographic information, financial attributes and previous marketing interactions.

Accurate predictions can help financial institutions improve campaign efficiency and focus marketing efforts on customers with a higher probability of subscription.

## Dataset

**Source:** UCI Machine Learning Repository – Bank Marketing Dataset

**Target variable:** `y`
- `1` = Customer subscribed to a term deposit
- `0` = Customer did not subscribe

## Technologies Used

- Dataiku DSS
- Python
- Pandas
- Random Forest
- Logistic Regression

## Project Workflow

1. Data Cleaning
2. Feature Engineering
3. Train/Test Split
4. Model Training
5. Class Imbalance Experiments
6. Model Evaluation
7. Hyperparameter Optimization
8. Final Model Selection

## Data Preparation

Main preprocessing steps included data quality review, variable type verification, removal of the **duration** feature to prevent data leakage, target encoding, categorical variable preparation and an 80/20 Train/Test split.

## Class Imbalance

Three training strategies were evaluated:

- Original Dataset
- Oversampling
- Undersampling

The original class distribution produced the strongest results during the initial comparison.

## Model Optimization

The baseline Random Forest was subsequently optimized using Grid Search with 5-fold cross-validation.

- Optimization V1: Test ROC AUC **0.9105**
- Optimization V2: Test ROC AUC **0.9535**

V2 became the strongest model obtained in the project.

## Final Model

**Optimized Random Forest V2**

- `max_depth`: 20
- `min_samples_leaf`: 3
- `n_estimators`: 500
- `min_samples_split`: 9
- Threshold: **0.475**

Final results:

| Metric | Score |
|---|---:|
| ROC AUC | **0.9535** |
| Accuracy | **0.9008** |
| Precision | 0.5522 |
| Recall | **0.8284** |
| F1-Score | **0.6627** |

## Interpretation and limitations

Random Forest V2 offers the strongest documented result after the sampling and tuning experiments. Recall of 0.8284 is accompanied by precision of 0.5522, so many predicted subscribers still do not subscribe. Removing `duration` avoids using information unavailable before a call.

The reported metrics describe the project test set. Campaign savings, production performance and generalization to another bank have not been measured. The repository includes data snapshots and sampling scripts, but no executable Dataiku project export preserving the complete training configuration.

## Key Learning Outcomes

- Data preparation in Dataiku.
- Feature engineering and data leakage prevention.
- Train/Test split methodology.
- Handling class imbalance.
- Model evaluation and comparison.
- Hyperparameter optimization.
- Data-driven model selection.

## Explore this project

- [Detailed methodology and experiment notes](README.md)
- [Archived datasets](../Datasets/)
- [Supporting Python scripts](../Python%20Code/)
- [Project catalogue](../../../README.md)
