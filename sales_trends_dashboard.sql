
-- Sales Trends Dashboard Project SQL
-- 1) Table DDL
CREATE TABLE Sales_Transactions (
    TransactionID BIGINT PRIMARY KEY,
    Date DATE NOT NULL,
    ProductID VARCHAR(10) NOT NULL,
    ProductCategory VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Region VARCHAR(20) NOT NULL
);

-- 2) Basic cleaning: remove non-positive quantities/prices
DELETE FROM Sales_Transactions
WHERE Quantity <= 0 OR UnitPrice <= 0;

-- 3) Monthly aggregation
SELECT 
    DATE_TRUNC('month', Date) AS Month,
    SUM(Quantity * UnitPrice) AS Total_Revenue,
    COUNT(DISTINCT TransactionID) AS Total_Orders,
    SUM(Quantity) AS Total_Units
FROM Sales_Transactions
GROUP BY Month
ORDER BY Month;

-- 4) Category by Month
SELECT 
    ProductCategory,
    DATE_TRUNC('month', Date) AS Month,
    SUM(Quantity * UnitPrice) AS Revenue
FROM Sales_Transactions
GROUP BY ProductCategory, Month
ORDER BY Month, ProductCategory;

-- 5) Regional distribution
SELECT 
    Region,
    SUM(Quantity * UnitPrice) AS Revenue,
    SUM(Quantity) AS Units
FROM Sales_Transactions
GROUP BY Region
ORDER BY Revenue DESC;

-- 6) Top products (Pareto)
WITH ProductRev AS (
    SELECT ProductID, SUM(Quantity * UnitPrice) AS Revenue
    FROM Sales_Transactions
    GROUP BY ProductID
),
Ordered AS (
    SELECT ProductID, Revenue,
           SUM(Revenue) OVER (ORDER BY Revenue DESC) / SUM(Revenue) OVER () AS CumShare
    FROM ProductRev
)
SELECT * FROM Ordered
WHERE CumShare <= 0.80
ORDER BY Revenue DESC;

-- 7) Anomaly detection (MoM % change)
WITH Monthly AS (
    SELECT DATE_TRUNC('month', Date) AS Month,
           SUM(Quantity * UnitPrice) AS Revenue
    FROM Sales_Transactions
    GROUP BY DATE_TRUNC('month', Date)
),
WithLag AS (
    SELECT Month,
           Revenue,
           LAG(Revenue) OVER (ORDER BY Month) AS PrevRevenue
    FROM Monthly
)
SELECT Month, Revenue, PrevRevenue,
       CASE WHEN PrevRevenue IS NULL THEN NULL
            ELSE (Revenue / NULLIF(PrevRevenue,0)) - 1 END AS MoM_Change
FROM WithLag
ORDER BY Month;

