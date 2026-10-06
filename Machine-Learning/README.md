# Machine Learning

Predictive projects with a business objective, documented evaluation and explicit limitations. The current implementations were developed in Dataiku; supporting Python recipes remain with the projects they serve.

## Project catalogue

| Project | Problem | Distinct contribution | Status |
| --- | --- | --- | --- |
| [Credit Risk Evaluation](Dataiku/Credit-Risk-Evaluation/) | High/low credit-risk classification | Decision Tree, Random Forest and Gradient Boosting comparison; credit-risk error interpretation | Model comparison documented |
| [Bank Term Deposit](Dataiku/Bank-Term-Deposit/) | Campaign-response classification | Leakage prevention, sampling experiments and optimized Random Forest | Final model documented |
| [Fraud Detection](Dataiku/Fraud-Detection/) | Transaction-fraud classification | KNN vs GaussianNB; scaling and threshold comparison | Final comparison documented; dataset/generalization limits apply |
| [Madrid Housing](Dataiku/Madrid-Housing/) | Property-price regression | Data integration, district encoding, ANOVA and multiple OLS | Final comparison pending |
| [Employee Attrition](Dataiku/Employee-Attrition/) | Employee-departure classification | Sampling tradeoffs, cross-validation leakage awareness and Logistic Regression | Final interpretation pending |
| [Boston Housing](Dataiku/Boston-Housing-Regularization/) | Housing-value regression | OLS, Ridge, Lasso and feature reduction | Final model documented |
| [Titanic Survival](Dataiku/Titanic-Survival/) | Passenger-survival classification | Introductory feature engineering and classifier comparison | Further evaluation and final results pending |

## Tools and future implementations

[Dataiku projects](Dataiku/) are grouped in one accessible list rather than nested by problem type. A Python section will be added with the first standalone implementation. Python recipes within Dataiku projects are supporting code, not additional projects.

New work should add a different problem family or a substantial contribution in reproducibility and validation. Repeated algorithms can be useful baselines; they do not justify duplicating a complete project.

[Back to portfolio](../README.md)
