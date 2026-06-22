# GICCI — Global Inflation & Currency Crisis Index

An end-to-end Data Science project that analyzes global inflation and currency crises across 50 countries over a 55-year period (1970–2025). The project integrates MySQL, Python, Machine Learning, and Power BI to uncover economic patterns, predict crises, and evaluate recovery trends.

---

## Project Overview

The Global Inflation & Currency Crisis Index (GICCI) is a comprehensive analytics project designed to study economic instability and post-crisis recovery across countries.

The project was developed from scratch by designing a relational MySQL database, performing advanced SQL analysis, conducting exploratory data analysis in Python, building machine learning models, and creating interactive Power BI dashboards.

---

## Architecture

```text
                  Historical Economic Data
                         (1970–2025)
                                │
                                ▼
                  MySQL Relational Database
                                │
                                ▼
                     Advanced SQL Analysis
         (JOINs, CTEs, Window Functions, Subqueries)
                                │
                                ▼
                  Python-MySQL Integration
                                │
                                ▼
                 Exploratory Data Analysis (EDA)
          (Pandas, NumPy, Matplotlib, Seaborn)
                                │
                                ▼
                    Machine Learning Models
             ┌──────────────────────────────┐
             │ • Random Forest Classifier   │
             │ • Regression Model           │
             │ • K-Means Clustering         │
             └──────────────────────────────┘
                                │
                                ▼
                    Recovery Index Framework
                                │
                                ▼
                   Interactive Power BI Dashboard
                                │
                                ▼
                     Insights and Predictions
```

---

## Objectives

* Analyze inflation and currency crisis trends across countries.
* Identify patterns associated with economic instability.
* Predict future crisis occurrences using machine learning.
* Segment countries based on economic behavior.
* Measure post-crisis recovery using a Recovery Index.
* Visualize insights through an interactive Power BI dashboard.

---

## Tech Stack

### Database

* MySQL

### Programming Language

* Python

### Python Libraries

* Pandas
* NumPy
* Matplotlib
* Seaborn
* Scikit-Learn

### Data Visualization

* Power BI

---

## Project Structure

```bash
GICCI-Global-Inflation-Currency-Crisis-Index/
│
├── README.md
│
├── Architecture/
│   └── GICCI_Architecture.png
│
├── SQL/
│   ├── GICCI_COMPLETE_DATABASE.sql
│   ├── TABLE_CREATION.sql
│   ├── DATA_INSERTION.sql
│   ├── ANALYTICAL_QUERIES.sql
│   └── RECOVERY_INDEX_TABLE.sql
│
├── Python/
│   ├── db_connection.py
│   ├── GICCI_Phase2_EDA.py
│   ├── GICCI_Phase3_ML.py
│   └── requirements.txt
│
├── PowerBI/
│   ├── GICCI_Dashboard.pbix
│   └── Dashboard_Screenshots/
│
└── Report/
    └── GICCI_Project_Report.pdf
```

---

## Methodology

### Database Design

* Designed and developed a relational MySQL database from scratch.
* Stored historical economic indicators spanning 55 years.
* Established relationships between multiple tables.

### SQL Analysis

Implemented analytical SQL queries using:

* JOINs
* CTEs
* Window Functions
* Aggregate Functions
* Subqueries

### Exploratory Data Analysis

Performed data analysis using Python:

* Data preprocessing
* Trend analysis
* Correlation analysis
* Visualization of economic indicators

### Machine Learning

Built models for:

* Random Forest Classifier for crisis prediction.
* Regression model for forecasting GICCI scores.
* K-Means clustering for country segmentation.

### Power BI Dashboard

Developed an interactive dashboard featuring:

* KPIs
* DAX Measures
* Slicers
* Filters
* Cross-filtering
* Country-wise insights
* Trend analysis

---

## Key Features

* Database designed from scratch.
* Advanced SQL analytics.
* Exploratory Data Analysis using Python.
* Machine Learning-based crisis prediction.
* Country clustering analysis.
* Recovery Index framework.
* Interactive Power BI dashboard.

---

## Skills Demonstrated

* SQL
* Database Design
* Python
* Data Cleaning
* Exploratory Data Analysis
* Data Visualization
* Machine Learning
* Power BI
* Analytical Thinking

---

## Dashboard Preview

Screenshots of the dashboard are available in the `PowerBI/Dashboard_Screenshots` folder.

---

## Report

A detailed project report is available in the `Report` folder.

---

## Author

Santosh Gutte

Computer Engineering Student

Aspiring Data Analyst | Data Scientist
