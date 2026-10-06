# Methodology and experiment notes

[Project overview](../README.md)

## Contents

- [Data Exploration](#01-data-exploration)
- [Data Cleaning](#02-data-cleaning)
- [Date Transformation](#03-date-transformation)
- [Feature Engineering](#04-feature-engineering)
- [Data Integration](#05-data-integration)
- [Aggregation & Analysis](#06-aggregation-analysis)
- [Visualization](#07-visualization)
- [Dashboard](#08-dashboard)
- [Metrics & KPIs](#09-metrics-kpis)

---

<a id="01-data-exploration"></a>

## Data Exploration

### Objective

Explore the available hotel and tourism datasets before performing transformations and analysis.

### Activities

- Reviewed dataset structure and available variables.
- Examined data quality and field types.
- Identified tourism, economic and demographic indicators relevant to the analysis.
- Determined which datasets could be combined to enrich the main tourism data.

This initial exploration defined the variables and transformations required for the following stages.

---

<a id="02-data-cleaning"></a>

## Data Cleaning

The datasets were prepared in Dataiku before analysis.

### Main activities

- Reviewed missing values.
- Reviewed data types and inconsistent representations.
- Prepared fields for later transformations.
- Ensured that the tourism and country-level datasets could be used consistently in the integration stage.

Data cleaning was performed as part of the Dataiku preparation workflow rather than as a separate external preprocessing script.

---

<a id="03-date-transformation"></a>

## Date Transformation

Date handling was an important part of the project because Dataiku needed the fields in a compatible date format before temporal analysis could be performed.

### Work performed

- Reviewed the original date representation.
- Transformed date fields into a format recognized correctly by Dataiku.
- Used **Smart Date Parsing** to interpret date information.
- Converted month information into a form suitable for analysis.

The resulting date fields enabled yearly and temporal tourism analysis.

---

<a id="04-feature-engineering"></a>

## Feature Engineering

New and transformed variables were created in Dataiku to make the tourism data more useful for analysis.

### Work performed

- Created variables derived from the available date information.
- Transformed month information for analysis.
- Concatenated columns where required to construct useful analytical fields.
- Prepared indicators for subsequent aggregation and visualization.

The feature engineering stage focused on analytical usability rather than Machine Learning feature selection.

---

<a id="05-data-integration"></a>

## Data Integration

The main tourism dataset was enriched with external country-level information.

### External information

- GDP
- Population

### Join

A **Join Recipe** was used to combine the datasets through the appropriate country identifiers.

This integration added socioeconomic context to the tourism data and allowed tourism activity to be compared with economic and demographic indicators.

---

<a id="06-aggregation-analysis"></a>

## Aggregation & Analysis

The prepared and enriched tourism dataset was aggregated to support comparisons across countries and over time.

### Main indicators

- International tourism arrivals
- Tourism receipts
- Tourism expenditures
- Tourism exports
- GDP
- Population

### Analysis

Aggregations were used to identify the countries with the highest tourism activity and to examine the evolution of the main indicators over time.

The analysis also investigated relationships between tourism activity and broader country-level indicators, including economic performance, air connectivity, cost of living, purchasing power and corruption.

---

<a id="07-visualization"></a>

## Visualization

The analysis was visualized in Dataiku using several chart types.

### Line Charts

Used for temporal evolution:

- International tourism arrivals by year
- Tourism receipts by year
- Tourism expenditures by year
- Tourism exports by year

### Bar Charts

Used for country comparisons:

- Tourism arrivals
- Tourism receipts
- Tourism expenditures
- Tourism exports

### Scatter Plots

Used to investigate relationships between variables, including:

- Tourism receipts vs. international tourism arrivals
- Tourism expenditures vs. tourism receipts

The visualizations were used as analytical tools and later incorporated into the dashboard.

---

<a id="08-dashboard"></a>

## Dashboard

The final analysis was consolidated into a Dataiku dashboard titled:

**ANÁLISIS DE LA ACTIVIDAD TURÍSTICA 2015–2019**

### Structure

#### 1. Evolution of Tourism Activity

Temporal views of the main tourism indicators.

#### 2. KPIs

The dashboard included key indicators for:

- Total international tourism arrivals
- Total tourism expenditures
- Total tourism exports
- Total tourism receipts

#### 3. Main Tourism Destinations

Country-level comparisons were used to identify the principal tourism destinations and the countries generating the highest tourism-related values.

#### 4. Relationships Between Tourism Indicators

The dashboard included visual analysis of relationships between tourism indicators.

### Dataiku Features Used

- Insights
- Tiles
- KPIs
- Metrics
- Cross-filtering

### Layout Decision

Some areas of the Dataiku dashboard contained unavoidable white space. The layout was not artificially stretched because doing so reduced chart readability. The final layout prioritized clarity over filling every available area.

---

<a id="09-metrics-kpis"></a>

## Metrics & KPIs

Dataiku Metrics were used to support the dashboard and KPI analysis.

### Metrics Used

- Records count
- Files / columns count
- Column statistics

Metrics were calculated on the relevant datasets and then used where appropriate as inputs for dashboard KPIs.

### Important Dataiku Learning

Saving a Metric does not necessarily mean that its updated result is immediately reflected in the dashboard. The metric must be calculated and available before it can be used correctly.

### Dashboard KPIs

The main tourism KPIs represented:

- Total international tourism arrivals
- Total tourism expenditures
- Total tourism exports
- Total tourism receipts
