# Class Imbalance

The target variable `Attrition` presented a significant class imbalance, with approximately **83% of employees remaining at the company and 17% leaving**.

To evaluate the impact of this imbalance on the Machine Learning model, three training datasets were created:

* **Original** — no resampling applied.
* **Oversampling** — the minority class (`Attrition = 1`) was increased to match the majority class.
* **Undersampling** — the majority class (`Attrition = 0`) was reduced to match the minority class.

The **test dataset remained unchanged** and was used to evaluate all three approaches under the same conditions.

The three datasets were later used to train and compare Decision Tree models.

