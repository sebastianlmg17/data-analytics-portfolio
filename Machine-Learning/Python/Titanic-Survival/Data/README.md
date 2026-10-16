# Dataset snapshot

`Titanic_dataset.csv` is the local CSV used by both notebooks: 891 passengers, 12 columns, including the target `Survived`. The file contains historical passenger records, not customer data.

The schema matches the training dataset used in the [Kaggle Titanic competition](https://www.kaggle.com/competitions/titanic/data). The original download route was not recorded in the local project, so that link is a reference rather than a claim of verified download provenance. This snapshot is also byte-identical to the portfolio's existing [Dataiku train.csv](../../../Dataiku/Titanic-Survival/Datasets/train.csv).

SHA-256: `7d118fef8b6ccf7f81111877bc388536f7b1e498a655e3d649d19aaa010e9f6f`.

There are 342 positive `Survived` labels and two missing `Embarked` values. This is one labelled dataset; no independent competition test set or submission is included. Counts were checked without fitting models.
