# Machine Learning

The core of this portfolio is Machine Learning applied to financial and business problems. Each project has a brief README linking to its full documentation or implementation notebooks.

Predictive projects with a business objective, documented evaluation and explicit limitations. Implementations include Dataiku workflows and standalone Python notebooks; supporting Python recipes remain with the Dataiku projects they serve.

## Browse by tool

- [Dataiku](Dataiku/) — current projects, including those with supporting Python.
- [Python](Python/) — Customer Churn Prediction and Titanic Survival, with executable code and evaluation limits.

## Project catalogue

| Project | Problem | Distinct contribution | Tools | Status |
| --- | --- | --- | --- | --- |
| [Credit Risk Evaluation](Dataiku/Credit-Risk-Evaluation/) | High/low credit-risk classification | Decision Tree, Random Forest and Gradient Boosting comparison; credit-risk error interpretation | Dataiku | Model comparison documented |
| [Bank Term Deposit](Dataiku/Bank-Term-Deposit/) | Campaign-response classification | Leakage prevention, sampling experiments and optimized Random Forest | Dataiku, Python | Final model documented |
| [Fraud Detection](Dataiku/Fraud-Detection/) | Transaction-fraud classification | KNN vs GaussianNB; scaling and threshold comparison | Dataiku, Python | Final comparison documented; dataset/generalization limits apply |
| [Madrid Housing](Dataiku/Madrid-Housing/) | Property-price regression | Data integration, district encoding, ANOVA and multiple OLS | Dataiku | Final comparison pending |
| [Employee Attrition](Dataiku/Employee-Attrition/) | Employee-departure classification | Sampling tradeoffs, cross-validation leakage awareness and Logistic Regression | Dataiku, Python | Final interpretation pending |
| [Boston Housing](Dataiku/Boston-Housing-Regularization/) | Housing-value regression | OLS, Ridge, Lasso and feature reduction | Dataiku | Final model documented |
| [Titanic Survival](Dataiku/Titanic-Survival/) | Passenger-survival classification | Introductory feature engineering and classifier comparison | Dataiku | Further evaluation and final results pending |
| [Titanic Survival · Python](Python/Titanic-Survival/) | Passenger-survival classification | Executable EDA and pipeline baselines; explicit validation review | Python | Exploratory notebooks published; methodological revision and final evaluation pending |
| [Customer Churn Prediction · Python](Python/Customer-Churn-Prediction/) | Customer-churn classification | Logistic Regression vs Random Forest, oversampling and LR threshold tuning | Python | Reproduced exploratory comparison; independent final evaluation pending |

## Tools and future implementations

[Dataiku projects](Dataiku/) are grouped in one accessible list. [Python](Python/) contains standalone churn and Titanic implementations with dependencies and reproduction instructions. Their exploratory status and remaining validation work are documented. The Tools column reflects published scripts or explicit implementation notes. Fraud Detection documents a custom Python GaussianNB model; its standalone code is not published. Supporting Python components stay with their Dataiku project.

New work should add a different problem family or a substantial contribution in reproducibility and validation. Repeated algorithms can be useful baselines; they do not justify duplicating a complete project.

[Back to portfolio](../README.md)
