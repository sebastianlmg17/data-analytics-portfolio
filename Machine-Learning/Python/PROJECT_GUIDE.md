# Python Machine Learning — Project Governance Guide

**Purpose:** A permanent, lightweight standard for creating, learning from, documenting, and publishing Python ML projects in this portfolio. This guide applies to new Python projects; existing projects are not retroactively rewritten unless requested.

## 1. Principles

- **Learning first:** The student writes the analysis and model code. AI may explain concepts, review code, suggest tests, and debug with explanations; it must not silently complete the whole exercise.
- **One stage at a time:** Do not move to the next stage before the student understands the current one.
- **Reproducibility before presentation:** Results and model claims must be traceable to executable code, data, and an identified evaluation method.
- **No invented performance:** Never manufacture metrics, charts, experiments, conclusions, or claims of execution.
- **Lean documentation:** Avoid duplicate reports, unnecessary files, and repeated audits.
- **No automatic GitHub publishing:** Obtain approval before committing/pushing material or declaring a project complete.

## 2. Portfolio location and naming

Place new Python ML work at:

`Machine-Learning/Python/<Descriptive-Project-Name>/`

Use consistent English, descriptive names with hyphens; example: `House-Price-Regression`, `Customer-Segmentation`.

Suggested minimal structure (create only folders actually needed):

```text
Project-Name/
├── README.md
├── notebooks/
│   └── 01_analysis.ipynb
├── data/
│   └── README.md
├── reports/
│   └── metrics.csv                # only if produced
└── requirements.txt
```

Add `scripts/`, `src/`, `tests/`, or `Project Documentation/` **only when warranted by project complexity**. Do not commit API keys, credentials, local environments, large unnecessary outputs, or private financial/customer data.

## 3. Mandatory workflow

### A. Problem definition
- Define the business problem, unit of analysis, target/output, success criterion, and suitable ML task.
- Distinguish **learning type** (supervised/unsupervised) from **problem type** (regression/classification/clustering).
- Identify dataset provenance, usage/license conditions, and known limitations.

### B. Data understanding and EDA
- Inspect shape, schema, data types, target distribution (if supervised), missing values, duplicates, impossible values, and relevant distributions.
- Explain each cleaning decision and distinguish legitimate extreme values from errors.
- Visualize only where it helps answer a question. State observations rather than just displaying charts.

### C. Validation design — before learned transformations
- For supervised ML, create a train/test split **before fitting** imputers, encoders, scalers, selectors, resamplers, or models.
- Fit learned preprocessing using training data only; use a pipeline for cross-validation.
- Do not resample the test set. Keep a genuinely untouched test split for final assessment.
- Use time-ordered splits for temporal prediction and group-aware splits where entities repeat.
- For clustering, do not pretend there are supervised labels if none exist; document how stability and interpretability are assessed.

### D. Modeling
- Start with a simple, relevant baseline.
- Compare only models that add a meaningful lesson or business trade-off; avoid collecting algorithms for appearance.
- Record `random_state` where applicable, hyperparameters, input features and target.

### E. Evaluation and interpretation
- **Regression:** MAE, RMSE and R² as appropriate; inspect residuals and compare against baseline.
- **Classification:** confusion matrix, precision, recall, F1 and ROC-AUC/PR-AUC when appropriate; consider class balance and error costs.
- **Clustering:** silhouette/inertia or other suitable criteria, cluster sizes, stability, outliers and useful business profiles.
- Discuss limitations, leakage risks, uncertainty and what would be required before production use.
- Never present a test set used repeatedly for model selection as a final unbiased estimate.

### F. Conclusions
- Explain what the model learned, what the results imply for the business, what did not work, and honest next steps.
- Keep conclusions proportionate to the evidence.

## 4. README — required sections

Each project `README.md` should contain, in order:

1. **Project title and objective**
2. **Business problem and ML approach**
3. **Dataset** — source, size, target or clustering features, usage restrictions
4. **Tools and environment**
5. **Methodology** — preprocessing, validation and models
6. **Results** — metric table and baseline comparison, only once computed
7. **Interpretation and limitations**
8. **How to reproduce** — environment, dependencies, commands, data availability
9. **Project status** — `In progress`, `Exploratory complete`, or `Final evaluation complete`

Link to the main notebook directly near the top. README prose should be in English; coaching and step-by-step explanations may be in Spanish. Use original plots and tables derived from the actual runs.

## 5. Completion and publication checklist

Before requesting publication, confirm:

- [ ] Code/notebook runs from a documented starting point.
- [ ] Dataset provenance and any exclusion of data from Git are clear.
- [ ] Train/test and preprocessing avoid known leakage, or limitations are explicit.
- [ ] Metrics and conclusions match actual computed outputs.
- [ ] Notebook is legible, organized, and free of irrelevant experiments or secrets.
- [ ] README links work, dependencies are specified, and reproduction is documented.
- [ ] Project status accurately distinguishes exploratory work from independent final evaluation.
- [ ] The project is added to `Machine-Learning/Python/README.md` and the catalogue `Machine-Learning/README.md` after approval.

## 6. Responsibilities and governance

- **Student:** writes code, decides scope and approves publication.
- **ChatGPT:** teaches, reviews methodology, interprets results, checks documentation, and flags errors or leakage.
- **Codex (optional):** limited to explicitly delegated mechanical tasks such as repository cleanup, reproducibility checks and formatting; it must not replace student-led modeling.
- **GitHub:** source of truth for versioned code, reproducible artifacts and stated project status.

Avoid duplicating evidence in multiple reports. Use the notebook as computational evidence, the README as the concise explanation, and supplementary reports only when they contain unique useful information.

## 7. Rules for starting the next projects

1. **Regression first:** choose a suitable dataset; implement a baseline, linear regression and regularized models only when justified. Evaluate with regression metrics and residual diagnostics.
2. **Clustering second:** explore and scale relevant features; compare candidate numbers of clusters, inspect quality and stability, and interpret profiles in business terms.
3. Follow the learning-first workflow in both. No automatic full-solution code dumps unless explicitly requested.

**Change control:** Revise this guide only when a concrete learning or portfolio need justifies it; do not broaden it into a general-purpose software governance framework.
