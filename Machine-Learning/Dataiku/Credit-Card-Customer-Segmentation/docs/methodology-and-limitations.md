# Methodology and interpretation notes

## Processing sequence

1. Read course-provided credit-card dataset (8,950 customers; 17 numeric features plus `CUST_ID`).
2. Impute the 313 missing `MINIMUM_PAYMENTS` and one missing `CREDIT_LIMIT` values using variable means.
3. Overwrite `MINIMUM_PAYMENTS` with zero wherever `PAYMENTS` equals zero (240 retained cases).
4. Remove `CUST_ID` and filter the six extreme-value thresholds stated in the assignment; 18 rows removed.
5. Validate that 8,932 records and 17 numeric columns remain, with no missing values.
6. Train K-Means in Dataiku with whole-data sampling, standard rescaling, dropping outliers, and 10 tested initial centroids; compare k=3,5,7.
7. Select k=5 for general segmentation after considering Silhouette and operationally meaningful segment sizes.
8. Deploy a retrainable Dataiku clustering model to a scoring recipe; score the prepared dataset, then group labeled rows and compute per-variable averages in original units.

## Technical distinctions

- `8,932` is the input population; the five numbered clusters total `8,720` rows. Exactly `212` scored rows have missing `cluster_labels`. This is consistent with outlier exclusion but is not a forensic record-level attribution.
- The `results/empirical-cluster-centers-original-units.csv` file reports arithmetic **means of rows assigned to each cluster** across all 17 original financial variables. It is *not* a faithful export of Dataiku's exact trained centroids after Standard rescaling. Do not use these values as a drop-in serialized model.
- Applying standard rescaling does not remove correlations between variables; highly correlated features may still create redundant weighting.
- The highest evaluated Silhouette was k=7 (0.229); preferring k=5 (0.2134) is a business-oriented choice with an explicit trade-off.
- Silhouette close to 0.2 suggests imperfectly separated clusters. Inertia should not be compared blindly across different values of k.
- No independent holdout, time-based stability, customer outcome targets, or uplift analysis are provided. The segments are exploratory and must not drive individual credit decisions without further validation.

## Comparison with the prior exercise

The previous exercise dropped 314 incomplete records (8,636 prepared; 8,504 assigned; k=9 chosen, Silhouette 0.2356, smallest cluster 93 customers). The updated exercise imputes missing values, applies the zero-payment rule and explicit thresholds (8,932 prepared; 8,720 assigned; k=5 chosen, Silhouette 0.2134, smallest cluster 1,054 customers). Changes in preprocessing, k, and initialization occur together, so **the score difference cannot be attributed to preprocessing alone**.

## Publication scope

The public repository contains aggregate descriptive outputs and methodology. It does not republish the source row-level CSV, proprietary course handouts, internal Dataiku snapshots, the academic report with individual attribution, or a deployed model artifact.
