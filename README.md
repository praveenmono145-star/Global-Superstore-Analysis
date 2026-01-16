# Global-Superstore-Analysis

**End-to-end Global Superstore Business Analysis using MySQL & Jupyter**



## ⚙️ Project Overview

This project performs an end-to-end business analysis on the Global Superstore dataset, starting from raw data ingestion and cleaning in MySQL and ending with business insights and visualisations in Jupyter Notebook.

All data cleaning, validation, and type conversions were handled entirely in MySQL.
The cleaned database was then connected to Jupyter Notebook to answer **8 real-world business questions** using SQL, Pandas, Seaborn, and Matplotlib.

---

## 📑 Table of Contents

* Project Overview
* Data Source
* Data Cleaning & Preparation (MySQL)
* Tools & Technologies
* Project Structure
* Business Questions & Analysis
* Visualisations
* How to Run This Project
* Key Insights

---

## 📂 Data Source

* **Dataset**: Global Superstore Dataset
* **Type**: Raw CSV (Retail transaction data)
* **Content**: Orders, customers, products, regions, discounts, shipping cost, and profit

---

## 🧹 Data Cleaning & Preparation (MySQL)

### Cleaning Steps Performed

* Created database and staging table
* Loaded raw CSV using `LOAD DATA LOCAL INFILE`
* Stored all columns as `VARCHAR` initially to avoid import errors
* Converted date fields to proper `DATE` format
* Removed currency symbols, commas, and percentage signs
* Converted numeric columns to appropriate data types
* Validated row counts, uniqueness, and null values
* Applied primary key constraints
* Performed data sanity checks (min–max validation)
  
📍 Result: A fully cleaned, validated, and analysis-ready MySQL table.

---

## 🛠 Tools & Technologies

* MySQL – Data ingestion, cleaning, transformation, and validation
* Python – Analysis environment
* Pandas – SQL query execution and data handling
* Seaborn & Matplotlib – Business visualisations
* Jupyter Notebook – Analysis & documentation
* GitHub – Version control & portfolio presentation

---

## 📄 Project Structure

```text
Global-Superstore-Analysis/
│
├── sql/
│   └── data_cleaning_mysql.sql
│
├── notebooks/
│   └── global_superstore_business_insights.ipynb
│
├── data/
│   └── Global_Superstore_datasets.csv
│
└── README.md
```

---

## 📝 Business Questions & Analysis

The following **8 business questions** were answered using SQL queries on the cleaned MySQL database, with results analysed and visualised in Jupyter Notebook.

### 1. Which regions, categories, and products are driving profit, and where is the business losing money?

* Identified top-performing and loss-making regions
* Analysed profit contribution by category and product
* Highlighted top profitable and loss-making products

### 2. Are discounts increasing revenue or hurting profit?

* Evaluated the relationship between discount levels, sales, and profit
* Identified discount thresholds that negatively impact margins

### 3. Which customer segments are most valuable to the business?

* Compared profit contribution across customer segments
* Identified the most profitable segment

### 4. Which products should be promoted, retained, or discontinued?

* Identified top profitable products to promote
* Flagged loss-making products for review or discontinuation

### 5. Which markets and regions have the highest growth potential?

* Compared sales and profit performance across regions
* Highlighted regions with consistent profitability

### 6. Is high shipping cost reducing overall profit?

* Identified shipping cost as a major operational expense
* Confirmed overall profitability remains positive
* Highlighted high sensitivity of margins to logistics costs

### 7. Does order priority influence delivery cost and profit?

* Analysed shipping cost by order priority
* Compared profit contribution across priorities
* Evaluated service speed versus profitability trade-offs

### 8. How do sales and profit change over time?

* Analysed monthly sales and profit trends
* Visualised long-term business growth patterns

---

## 📊 Visualisations (Jupyter Notebook)

All visualisations were created in Jupyter Notebook using Seaborn and Matplotlib, directly supporting each business question.

* Profit by Region and Category
* Top 5 Products by Profitability
* Effect of Discount on Sales and Profit
* Total Profit by Segment
* Top 10 Profitable Products and Loss-Making Products
* Region sales profit
* Shipping Cost vs Profit
* Order Priority vs Shipping Cost
* Monthly Sales Trend & Profit Trend


---

## ▶️ How to Run This Project

1. Import the raw dataset into MySQL
2. Execute the MySQL data cleaning script
3. Connect MySQL to Jupyter Notebook
4. Run the notebook to execute business queries and generate visualisations

---

## 🔑 Key Insights

* High sales do not always translate into high profit
* Discount strategies have a strong negative impact on profit margins
* Shipping costs are a major operational expense, making profitability sensitive to logistics efficiency
* Order priority influences both shipping cost and profit
* Regional and product-level optimisation can significantly improve business performance
