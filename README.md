# 🛒 E-Commerce Sales Analytics End-to-End Project (Python, SQL & Power BI)
End-to-End E-Commerce Data Analytics project: Data Cleaning using Python, Business Intelligence &amp; KPI modeling via SQL, and Executive Dashboard built in Power BI.

---

## 📌 Project Architecture & Workflow
```text
Raw Multi-table CSVs ➔ Python (Cleaning & ETL) ➔ SQL Database (Queries & KPIs) ➔ Power BI (Data Modeling & Dashboard)
```

1. Data Cleaning & ETL (Python): Handling missing values, standardizing inconsistent formats, parsing data types, and verifying relational integrity across datasets.

2. Business Analysis (SQL): Leveraging JOINs, aggregate functions, window functions, and Common Table Expressions (CTEs) to evaluate revenue, profit margins, customer behavior patterns, and product performance.

3. Data Modeling & Visualization (Power BI): Designing an optimized Star Schema data model, engineering custom DAX measures, and configuring an interactive dashboard equipped with dynamic multi-attribute slicers.

---

## 📊 Key Business Metrics (KPIs Dashboard)
* **Total Sales:** $29.50M
* **Total Profit:** $6.76M
* **Total Orders:** 25K
* **Total Products:** 101
* **Total Quantity Sold:** 48.064K
* **Active Customers:** 2K

---

## 🖥️ Power BI Dashboard Visuals & Features

* **Dynamic Multi-Level Slicers:**
  * **Time Slicers:** Year (2024, 2025) aur Month (Jan - Dec) bar selection.
  * **Demographic & Order Slicers:** Gender (Male/Female), Transaction Type (Sale/Return), Customer Segment (Consumer, Corporate, Home Office), Customer Name, Product Name, State, aur Region.
* **Geographical Distribution:** City-wise / State-wise sales map visualization (India map distribution).
* **Category & Sub-Category Analysis:**
  * Category-wise sales bar chart (*Home & Kitchen*, *Clothing*, *Office Supplies*, *Furniture*, *Electronics*).
  * Sub-category wise deep dive (*Women*, *Cookware*, *Appliances*, *Tables*, *Mobiles*, *Stationery*).
* **Regional Performance:** Region-wise sales split (Central, East, North, South, West) bar chart.
* **Trend Analysis:** Month-wise sales/salary comparative trend line chart (2024 vs 2025).
* **Top Performers Ranking:**
  * Top 10 Products by revenue/sales.
  * Top 10 Customers by purchase value.
* **Customer Segment Breakdown:** Segment-wise sales donut chart (Consumer, Corporate, etc.).

---

## 🛠️ Tech Stack & Tools
* **Data Cleaning & Manipulation:** Python (`pandas`, `numpy`)
* **Database & Querying:** SQL (`PostgreSQL` / `MySQL` / `SQL Server`)
* **BI & Visualization:** Microsoft Power BI Desktop (DAX, Power Query, Star Schema Modeling)
* **Version Control:** Git & GitHub

---

## 🗄️ Database Schema & Data Modeling (Star Schema)
Project me 4 primary tables use kiye gaye hain:
* `sales_customers`: Customer ID, Name, Gender, Segment, Location details.
* `sales_orders`: Order ID, Customer ID, Order Date, Shipping details, Transaction Type.
* `sales_product`: Product ID, Product Name, Category, Sub-Category, Cost Price.
* `sales_region / sales_fact`: Sales ID, Order ID, Product ID, Quantity, Discount, Total Sales, Profit, Region.

---

## 📁 Repository Structure
```text
├── data/
│   ├── raw/                       # Original messy CSV datasets
│   └── cleaned/                   # Cleaned output CSVs ready for SQL/BI
├── python/
│   └── data_cleaning_etl.ipynb    # Python notebook with cleaning pipeline
├── sql/
│   ├── schema_definition.sql      # DDL table creation and foreign keys
│   └── business_analysis.sql      # Complex analysis queries & KPI extraction
├── powerbi/
│   └── Ecommerce_Sales_Dashboard.pbix  # Complete Power BI file
├── screenshots/
│   └── dashboard_overview.png     # Power BI Dashboard preview
└── README.md                      # Complete project documentation
```

---

