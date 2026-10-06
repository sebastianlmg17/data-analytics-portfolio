# Dataiku portfolio overlap review

Reviewed on 6 October 2026 against the seven Dataiku ML projects currently in the repository.

Repeated algorithms do not make two projects duplicates by themselves. The key question is whether the projects demonstrate a different business problem, dataset, modeling lesson or validation challenge.

## Project inventory

| Project | Main problem | Main algorithms | Distinct contribution |
| --- | --- | --- | --- |
| Titanic Survival Prediction | Binary classification | Logistic Regression, Random Forest | Introductory classification workflow and passenger feature engineering. |
| Bank Term Deposit Prediction | Binary classification | Logistic Regression, Random Forest | Marketing response, leakage prevention, imbalance experiments and RF optimization. |
| Employee Attrition Prediction | Binary classification | Decision Tree, Logistic Regression, Random Forest | HR retention, error tradeoffs and leakage awareness around resampling and CV. |
| Fraud Detection | Binary classification | KNN, Gaussian Naive Bayes | Different algorithm families, scaling, threshold analysis and fraud-specific errors. |
| Credit Risk Evaluation | Binary classification | Decision Tree, Random Forest, Gradient Boosted Trees | Tree ensembles, bagging vs boosting and credit-risk false-negative analysis. |
| Madrid Housing Price Analysis | Regression | Simple and Multiple Linear Regression | Local property analysis, district feature engineering, ANOVA and regression interpretation. |
| Boston Housing — Regularized Regression | Regression | OLS, Ridge, Lasso | Regularization, feature reduction and model simplification. |

## Main overlaps

### Titanic, Bank Term Deposit and Employee Attrition

These projects share Logistic Regression and Random Forest, and all are binary classification problems. The strongest algorithm overlap is between Bank Term Deposit and Employee Attrition.

They are not whole-project duplicates because they solve different business problems and emphasize different lessons. Bank Term Deposit is strongest on leakage prevention, imbalance experiments and Random Forest optimization; Employee Attrition is strongest on HR error tradeoffs and resampling/CV methodology.

Titanic is the most introductory of the three. Once a stronger Python Titanic project exists, the Dataiku version should remain a secondary learning milestone rather than a flagship project.

### Employee Attrition and Credit Risk Evaluation

Both use Decision Trees and Random Forest. However, Credit Risk adds Gradient Boosting and directly compares a single tree, bagging and boosting. It also introduces a different business decision where false negatives have a clear credit-risk interpretation.

Keep both. Avoid adding the same boosting comparison to Attrition unless it serves a specific analytical purpose.

### Bank Term Deposit and Credit Risk Evaluation

Both are financial binary-classification projects and both use Random Forest. The business objectives are different: campaign conversion versus credit-risk assessment. Credit Risk also adds Gradient Boosting and a different evaluation focus.

They are complementary rather than redundant.

### Madrid Housing and Boston Housing

These have the strongest problem-domain overlap because both predict housing values and use OLS-style regression.

Keep both because their technical emphasis is different: Madrid focuses on data preparation, location engineering, ANOVA and multiple regression; Boston focuses on Ridge/Lasso regularization and feature selection.

A third conventional housing-price regression project would be redundant unless it adds a clearly different technique or business question.

### Fraud Detection

Fraud is the least redundant classification project from an algorithm perspective because it contributes KNN and Gaussian Naive Bayes rather than another tree/logistic comparison.

Keep it. Its very high metrics should be interpreted carefully and dataset provenance should remain documented when available.

## Internal redundancy

- Fraud contains both `03-KNN` and `03-KNN-Model`; the former is a pointer rather than a second trained model. This is documentation duplication, not model duplication.
- Bank Term Deposit contains repeated workflow stages around baseline/optimized models. They are useful if clearly labeled as progression rather than separate final models.
- Supporting Python recipes inside Dataiku projects should remain inside those projects and should not be counted as standalone Python ML projects.

## Recommendation

No current Dataiku project needs to be removed.

The main portfolio repetition is the use of Logistic Regression and Random Forest across several binary-classification projects, plus the two housing-regression projects. The projects remain defensible because each contributes a distinct modeling lesson.

For future Python projects, prioritize either new problem families or clearly deeper implementations. Do not systematically recreate every Dataiku project in Python.
