# Hotel Booking Analysis

## Overview

Data Analytics project developed in **Dataiku** to explore hotel booking activity, enrich the dataset with external socioeconomic indicators, and communicate the main findings through visual analysis and a dashboard.

## Objective

The objective was to understand the evolution and distribution of tourism activity and investigate its relationship with economic, demographic and other country-level indicators.

## Workflow

```text
Data Sources
    ↓
Data Exploration
    ↓
Data Cleaning
    ↓
Date Transformation
    ↓
Feature Engineering
    ↓
Data Integration
    ↓
Aggregation & Analysis
    ↓
Visualizations
    ↓
Metrics / KPIs
    ↓
Dashboard
    ↓
Conclusions
```

## 01 — Data Exploration

The project began with exploration of the available datasets and their structure, variables and data quality.

The analysis focused on tourism-related information and country-level indicators.

## 02 — Data Cleaning

The datasets were prepared in Dataiku by reviewing missing values, data types and inconsistent representations.

Particular attention was given to date fields and to preparing the data for subsequent transformations and analysis.

## 03 — Date Transformation

Date-related fields required transformation so that Dataiku could correctly recognize and work with the dates.

**Smart Date Parsing** was used to correctly interpret date information and enable temporal analysis.

Month information was also transformed into a usable representation for analysis.

## 04 — Feature Engineering

New and transformed fields were created to support the analysis, including transformations involving dates, months and combined information.

The objective was to create variables that could be used consistently in subsequent aggregations and visualizations.

## 05 — Data Integration

The main tourism dataset was enriched with external country-level information, including:

- GDP
- Population

A **Join Recipe** was used to combine the datasets using the appropriate country keys.

This created a richer analytical dataset containing tourism activity together with socioeconomic context.

## 06 — Aggregation & Analysis

Aggregations were performed to analyze tourism activity by country and over time.

The analysis included indicators such as:

- International tourism arrivals
- Tourism receipts
- Tourism expenditures
- Tourism exports
- GDP
- Population

The resulting dataset supported comparisons between destinations and temporal analysis.

## 07 — Visualizations

Several types of Dataiku visualizations were created.

### Line charts

Used to analyze evolution over time, including:

- Tourism arrivals by year
- Tourism receipts by year
- Tourism expenditures by year
- Tourism exports by year

### Bar charts

Used to compare countries according to:

- Tourism arrivals
- Tourism receipts
- Tourism expenditures
- Tourism exports

### Scatter plots

Used to investigate relationships between tourism and other indicators, including:

- Tourism receipts vs. international tourism arrivals
- Tourism expenditures vs. tourism receipts

## 08 — Dashboard

The analysis was consolidated into a Dataiku dashboard titled:

**ANÁLISIS DE LA ACTIVIDAD TURÍSTICA 2015–2019**

The dashboard was organized into several sections:

1. Evolution of tourism activity
2. Main tourism KPIs
3. Main tourism destinations
4. Relationships between tourism indicators

The dashboard included **Insights, Tiles, KPIs, Metrics and cross-filtering**.

Metrics were calculated and then used to feed KPI visualizations.

A layout decision was made not to force the available white space in certain areas of the dashboard, since excessively stretching the charts reduced readability.

## 09 — KPIs and Metrics

The project used Dataiku Metrics to support the dashboard, including:

- Records count
- Dataset/file and column counts
- Column statistics

These metrics were used as the basis for KPI elements where appropriate.

An important Dataiku behavior observed during the project was that saving a Metric does not necessarily mean that its updated result is immediately reflected in the dashboard; the metric needs to be calculated and available before it can be used reliably.

## Main Analytical Questions

The project investigated the following questions:

1. How did international tourism arrivals evolve over time?
2. Which countries received the most international tourists?
3. Which countries generated the highest tourism receipts?
4. How did tourism-related income evolve?
5. How did GDP evolve over the analyzed period?
6. What relationship exists between tourism activity and GDP?
7. What relationship exists between tourism and air connectivity?
8. What relationship exists between tourism activity and cost of living?
9. What relationship exists between tourism and purchasing power?
10. What relationship exists between tourism activity and corruption indicators?

## Dataiku Techniques Used

- Dataset exploration
- Data Quality analysis
- Prepare Recipe
- Join Recipe
- Aggregation
- SQL / data transformation concepts
- Date parsing
- Smart Date Parsing
- Feature engineering
- Data integration
- Insights
- Metrics
- KPIs
- Cross-filtering
- Dashboard design

## Key Learning Outcomes

This project demonstrated an end-to-end Data Analytics workflow in Dataiku, from raw data preparation and integration through analysis, visualization and business communication.

The main learning was not simply how to create individual charts or transformations, but how to combine Dataiku components into a coherent analytical workflow and make the resulting analysis understandable through KPIs and a dashboard.
