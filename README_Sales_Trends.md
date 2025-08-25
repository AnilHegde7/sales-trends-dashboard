Sales Trends Dashboard Project

This project demonstrates how sales data can be transformed into actionable insights using SQL for data extraction/cleaning and Google Sheets for visualization.

----------------------------------------------------------------------------------------------------

Project Structure
sales-trends-dashboard
│
├── data/
│   └── sales_transactions.csv        
│
├── sql/
│   └── sales_trends_dashboard.sql    # SQL queries for data cleaning & aggregation
│
├── dashboard/
│   └── sales_trends_dashboard.xlsx   # Interactive dashboard with charts & filters
│
├── report/
│   └── sales_trends_report.pdf       # Case study report with findings & insights
│
└── README.md                         # Project documentation (this file)

----------------------------------------------------------------------------------------------------

Project Overview
- **Objective**: Analyze sales performance, detect anomalies, and recommend inventory optimization.
- **Dataset**: 10,000+ rows of anonymized transaction data.
- **Tech Stack**: SQL + Google Sheets (Excel version included).

-----------------------------------------------------------------------------------------------------

Key Steps
1. Data Extraction & Cleaning
   - Used SQL queries (`sql/sales_trends_dashboard.sql`) to filter and aggregate sales by month, category, and region.
   - Removed duplicates and corrected inconsistent values.

2. **Dashboard Development**  
   - Built in **Google Sheets / Excel** (`dashboard/sales_trends_dashboard.xlsx`).
   - Features:
     - Monthly Sales Trends
     - Regional Performance
     - Top Products
     - Anomaly Detection (spikes/drops)

3. **Insights & Recommendations**  
   - Identified seasonal trends and peak demand months.  
   - Detected overstock patterns.  
   - Recommended stock optimization → **Projected 15% overstock reduction**.

-----------------------------------------------------------------------------------------------------

Report
Detailed explanation of methodology, findings, and business recommendations can be found in:  
📌 [`report/sales_trends_report.pdf`](report/sales_trends_report.pdf)


Outcomes
- Improved decision-making with clear visualization.
- Better demand forecasting.
- Reduced overstock by ~15% (simulated projection).
----------------------------------------------------------------------------------------------------
