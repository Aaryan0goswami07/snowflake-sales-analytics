-- ============================================
-- SNOWFLAKE SALES ANALYTICS PROJECT
-- By Aaryan Goswami
-- Concepts: Databases, Schemas, Tables,
-- Virtual Warehouses, Stages, SQL Queries
-- ============================================

-- STEP 1: Create a Virtual Warehouse
-- (compute engine that runs our queries)
CREATE WAREHOUSE IF NOT EXISTS SALES_WH
  WAREHOUSE_SIZE = 'X-SMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  COMMENT = 'Warehouse for Sales Analytics project';

USE WAREHOUSE SALES_WH;

-- STEP 2: Create Database and Schema
-- (database = top-level container, schema = organiser inside)
CREATE DATABASE IF NOT EXISTS SALES_ANALYTICS_DB;
USE DATABASE SALES_ANALYTICS_DB;

CREATE SCHEMA IF NOT EXISTS RAW_DATA;
CREATE SCHEMA IF NOT EXISTS ANALYTICS;
USE SCHEMA RAW_DATA;

-- STEP 3: Create Tables
-- Products table
CREATE OR REPLACE TABLE products (
    product_id      INT           PRIMARY KEY,
    product_name    VARCHAR(100)  NOT NULL,
    category        VARCHAR(50),
    unit_price      DECIMAL(10,2)
);

-- Customers table
CREATE OR REPLACE TABLE customers (
    customer_id     INT           PRIMARY KEY,
    customer_name   VARCHAR(100)  NOT NULL,
    city            VARCHAR(50),
    country         VARCHAR(50)
);

-- Sales transactions table
CREATE OR REPLACE TABLE sales (
    sale_id         INT           PRIMARY KEY,
    sale_date       DATE          NOT NULL,
    customer_id     INT           REFERENCES customers(customer_id),
    product_id      INT           REFERENCES products(product_id),
    quantity        INT,
    total_amount    DECIMAL(10,2)
);

