# Employee Attrition Analysis

## Project Overview

Machine Learning project developed in **Dataiku** using the IBM HR Analytics Employee Attrition dataset.

The objective is to analyze employee attrition and build a Machine Learning model capable of predicting whether an employee is likely to leave the company.

## Data Preparation

The dataset was prepared by:

* Removing variables with no useful information.
* Converting `Attrition` into a binary target (`1/0`).
* Applying One-Hot Encoding to categorical variables.
* Handling missing values generated during encoding.
* Splitting the dataset into training and test sets.

## Machine Learning

A **Decision Tree** model was trained using three different approaches to address class imbalance:

* Original dataset
* Oversampling
* Undersampling

The three approaches were evaluated using the same test dataset.

## Tools

**Dataiku · Python · Pandas · Scikit-learn · Machine Learning**

