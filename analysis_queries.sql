-- ============================================
-- ANALYSIS QUERIES
-- ============================================

USE DATABASE SALES_ANALYTICS_DB;
USE SCHEMA RAW_DATA;

-- QUERY 1: Total revenue by month
-- "How much did we sell each month?"
SELECT
    DATE_TRUNC('month', sale_date)   AS month,
    COUNT(*)                          AS total_orders,
    SUM(total_amount)                 AS total_revenue,
    ROUND(AVG(total_amount), 2)       AS avg_order_value
FROM sales
GROUP BY 1
ORDER BY 1;

-- QUERY 2: Top selling products
-- "Which products make us the most money?"
SELECT
    p.product_name,
    p.category,
    COUNT(s.sale_id)             AS times_sold,
    SUM(s.quantity)              AS units_sold,
    SUM(s.total_amount)          AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY 1, 2
ORDER BY total_revenue DESC
LIMIT 5;

-- QUERY 3: Revenue by product category
SELECT
    p.category,
    COUNT(s.sale_id)     AS total_orders,
    SUM(s.total_amount)  AS total_revenue,
    ROUND(SUM(s.total_amount) * 100.0 /
        SUM(SUM(s.total_amount)) OVER (), 2) AS revenue_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY 1
ORDER BY total_revenue DESC;

-- QUERY 4: Best customers by spend
SELECT
    c.customer_name,
    c.city,
    COUNT(s.sale_id)     AS total_orders,
    SUM(s.total_amount)  AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY 1, 2
ORDER BY total_spent DESC
LIMIT 5;

-- QUERY 5: Monthly growth rate
-- "Is our revenue growing month over month?"
WITH monthly AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_amount)              AS revenue
    FROM sales
    GROUP BY 1
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month)  AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        / LAG(revenue) OVER (ORDER BY month) * 100
    , 2) AS growth_pct
FROM monthly
ORDER BY month;

