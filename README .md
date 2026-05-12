# Snowflake Sales Analytics Project

A beginner-to-intermediate Snowflake project demonstrating core platform concepts through a real-world sales analytics use case.

Built after completing **Module 1: Core Objects & Architecture** from the Snowflake Intro Course (Coursera).

---

## What this project covers

| Snowflake Concept | Where it's used |
|---|---|
| Virtual Warehouse | `SALES_WH` — created and configured in `setup.sql` |
| Database | `SALES_ANALYTICS_DB` — top-level container |
| Schema | `RAW_DATA` — organises tables by layer |
| Tables | `products`, `customers`, `sales` |
| SQL Queries | 5 business analytics queries in `analysis_queries.sql` |
| Joins | Sales ↔ Products ↔ Customers |
| Window Functions | `LAG()` for month-over-month growth |

---

## Project structure

```
snowflake-sales-analytics/
├── setup.sql            # Creates warehouse, database, schema, tables
├── seed_data.sql        # Inserts 10 products, 10 customers, 20 sales rows
├── analysis_queries.sql # 5 business queries
└── README.md
```

---

## How to run this

### Step 1 — Get a free Snowflake account
Go to [snowflake.com](https://signup.snowflake.com/) → sign up for a 30-day free trial. No credit card needed.

### Step 2 — Open a worksheet
In Snowflake UI → click **Worksheets** → **+ New Worksheet**

### Step 3 — Run setup
Copy-paste the contents of `setup.sql` into your worksheet. Click **Run All**.

### Step 4 — Insert data
Copy-paste `seed_data.sql`. Click **Run All**.

### Step 5 — Run analysis
Copy-paste `analysis_queries.sql`. Run each query one by one and explore the results.

---

## The 5 analytics queries

**Query 1 — Monthly revenue**
How much revenue was generated each month? What is the average order value?

**Query 2 — Top products**
Which products generate the most revenue? How many units were sold?

**Query 3 — Revenue by category**
What percentage of revenue comes from Electronics vs Furniture?

**Query 4 — Best customers**
Who are the top 5 customers by total spending?

**Query 5 — Month-over-month growth**
Is the business growing? Uses a window function (`LAG`) to calculate % growth between months.

---

## Key concepts explained

**Virtual Warehouse**
Think of this as the compute engine — like a CPU you rent. It runs your SQL queries. You can scale it up (more power) or down (less cost). It auto-suspends after 60 seconds of inactivity to save credits.

**Database vs Schema**
Database = the building. Schema = a floor in the building. Tables live on a floor. Separating `RAW_DATA` from `ANALYTICS` is a best practice so you know where transformed vs raw data lives.

**Stages** (next step)
A stage is a loading zone — files sit here before being loaded into tables. This project uses direct `INSERT` statements for simplicity, but in production you'd upload a CSV to a stage then use `COPY INTO`.

---
## Cortex AI exploration

Alongside the manual SQL queries, I used Snowflake Cortex Code
to query the data in natural language.

Example prompt: "Show me top 5 products by revenue from the sales table"

Cortex instantly queried the schema and returned a ranked table —
no SQL written. This is what modern data workflows look like:
natural language → SQL → business insight in seconds.

## What I learned

- Snowflake separates **compute** (warehouse) from **storage** (database) — this means you can scale them independently, which is a fundamental advantage over traditional databases
- Auto-suspend and auto-resume make Snowflake cost-efficient — you only pay when queries are running
- Schemas let you organise data by layer (raw → analytics → presentation), which is standard data engineering practice

---

## Built by
**Aaryan Goswami** — BBA Business Analytics, Manipal University Jaipur  
Backtesting Lead @ AperioHub (Singapore) | Building toward AI + Analytics career  
[LinkedIn](https://linkedin.com/in/aaryan-goswami-058920240) · [GitHub](https://github.com/AaryanGoswami07)

