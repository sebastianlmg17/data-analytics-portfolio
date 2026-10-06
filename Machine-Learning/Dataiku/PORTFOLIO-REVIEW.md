# Dataiku portfolio overlap review

Reviewed on 6 October 2026 against the six ML projects in the repository. This is a review of committed documentation and available artifacts, not a rerun of Dataiku models. Repeated algorithms do not establish identical fitted models; different datasets and targets can justify using the same algorithm.

## Project inventory

| Project | Problem and dataset | Documented algorithms | Distinct contribution |
| --- | --- | --- | --- |
| [Titanic](Classification/01-Titanic-Survival-Prediction/) | Binary survival classification; Titanic passenger data | Random Forest, Logistic Regression | Introductory workflow and passenger feature engineering; no resampling. Evaluation and final-results stages remain pending. |
| [Bank Term Deposit](Classification/02-Bank-Term-Deposit-Prediction/) | Binary campaign-subscription classification; UCI Bank Marketing | Random Forest, Logistic Regression; optimized RF selected | Marketing decisions, removal of post-call `duration` to prevent leakage, original/over/undersampling comparison and RF tuning. |
| [Employee Attrition](Classification/03-Employee-Attrition-Prediction/) | Binary employee-departure classification; IBM HR, 1,470 records | Decision Tree, Logistic Regression, Random Forest; LR selected | HR retention, recall/false-positive tradeoffs, and recognition of leakage when oversampling before cross-validation. Final interpretation remains pending. |
| [Fraud Detection](Classification/04-Fraud-Detection/) | Binary transaction-fraud classification; 10,000 initial transactions, `es_fraude`; source provenance is not specified in the overview | KNN, Gaussian Naive Bayes; GaussianNB selected | Different algorithm families, scaling decisions, thresholds, Average Precision/MCC, and identifier-leakage detection. |
| [Madrid Housing](Regression/01-Madrid-Housing-Price-Analysis/) | Price regression; Idealista Madrid listings, 915 raw / 911 cleaned | Simple and multiple OLS | Local property analysis, district encoding, joins, duplicate review, ANOVA and separate statistical inference. Final comparison remains pending. |
| [Boston Housing](Regression/02-Boston-Housing-Regularized-Regression/) | Housing-value regression; Boston Housing, 506 observations, `MEDV` | OLS, Ridge, Lasso, Lasso feature reduction | Regularization and simplification from 13 to 11 predictors; final selected model is reduced Lasso. |

## Main overlaps and recommendations

### Bank Term Deposit and Employee Attrition: strongest workflow overlap

Both compare original, oversampled and undersampled training data, then optimize classifiers and report similar metrics. They also share Logistic Regression and Random Forest. This is methodological repetition, not the same business problem or dataset.

Keep both, but make their different lessons prominent: Bank Marketing demonstrates leakage prevention and optimized Random Forest; Attrition demonstrates HR error tradeoffs, cross-validation leakage awareness and a Logistic Regression winner. Avoid expanding both with the same additional experiments solely to increase portfolio size.

### Madrid Housing and Boston Housing: strongest business/problem overlap

Both predict housing values and use OLS. Their datasets, geographical context and technical emphasis differ. Madrid contributes data integration, feature engineering, statistical analysis and interpretation; Boston contributes Ridge/Lasso regularization and feature selection.

Keep Madrid as the richer property-analysis case and Boston as a compact regularization case. OLS, Ridge and Lasso are justified comparison baselines within one project; the small performance differences do not make them redundant projects. A further housing-price project would need a clear additional contribution to justify the repetition.

### Titanic: introductory overlap with the classification projects

Titanic repeats binary classification and the Random Forest/Logistic Regression pairing seen in Bank Marketing and Attrition. It contributes a different dataset and feature engineering, but its current modeling scope is more introductory.

Retain it as an early learning milestone and give more portfolio prominence to the more complete projects. If implemented later in Python, make the added value explicit through a reproducible preprocessing/model pipeline and a documented validation procedure rather than duplicating the same write-up.

### Fraud Detection: complementary algorithms

Fraud shares the classification task and financial setting with Bank Marketing, but fraud detection and campaign response are different business decisions. KNN and GaussianNB add algorithm diversity. There is no documented evidence that its dataset duplicates another project's data.

Keep it. Document dataset provenance and retain the existing limitation about unusually high AUC and identifier leakage. The current metrics alone do not demonstrate performance on new real transactions.

## Internal documentation overlap

- Fraud's [03-KNN](Classification/04-Fraud-Detection/03-KNN/) is only a pointer to [03-KNN-Model](Classification/04-Fraud-Detection/03-KNN-Model/). It is not a second trained model. It can remain as a compatibility pointer; optional removal would be a separate approved cleanup.
- Bank Marketing's [Original-Model](Classification/02-Bank-Term-Deposit-Prediction/04-Model-Training/Original-Model/) contains two conclusion sections, and the later one calls the original model the final project model. The current project overview and final-selection stage instead select optimized RF V2. A future documentation cleanup should label the original model as the baseline/stage winner.
- Bank Marketing reports Logistic Regression AUC = 0.8940 in original, oversampling and undersampling pages. Equal rounded values do not prove duplication. Check the Dataiku experiment outputs before treating these as copied results.
- Madrid's data snapshots 05 and 06 share the same model values, with 06 adding `size_range` for ANOVA. They have documented separate purposes and should not be deleted merely because much of their content overlaps.
- Supporting Python sampling scripts inside Bank Marketing and Attrition belong to their Dataiku workflows. They are not standalone Python ML projects and have not been copied into the new Python section.

## Portfolio direction

No whole project is an established duplicate of another dataset/target combination. The main repetition is four binary classifiers and two housing regressions, with shared algorithms and sampling workflows. Keep all six and emphasize each project's distinct lesson. For future Python work, prioritize a new problem family or materially deeper validation/reproducibility rather than systematically recreating every Dataiku project.

Hotel Booking Analysis remains under Data Visualization: its documented contribution is analysis, integration, dashboards and KPIs. A separate credit-risk ML project is not present among these six; the Master's credit-risk subject page is academic context, not an additional completed ML implementation.

No projects, models, datasets or supporting scripts were removed as a result of this review.
