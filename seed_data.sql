-- ============================================
-- SEED DATA — insert sample rows
-- ============================================

USE DATABASE SALES_ANALYTICS_DB;
USE SCHEMA RAW_DATA;

-- Products
INSERT INTO products VALUES
(1, 'Laptop Pro 15',    'Electronics',  85000.00),
(2, 'Wireless Mouse',   'Electronics',   1200.00),
(3, 'Office Chair',     'Furniture',    12000.00),
(4, 'Standing Desk',    'Furniture',    25000.00),
(5, 'Noise Cancelling Headphones', 'Electronics', 8500.00),
(6, 'Webcam HD',        'Electronics',   3200.00),
(7, 'Mechanical Keyboard', 'Electronics', 5500.00),
(8, 'Monitor 27 inch',  'Electronics',  22000.00),
(9, 'Bookshelf',        'Furniture',     6500.00),
(10,'USB-C Hub',        'Electronics',   2100.00);

-- Customers
INSERT INTO customers VALUES
(1,  'Raj Sharma',      'Mumbai',    'India'),
(2,  'Priya Mehta',     'Bangalore', 'India'),
(3,  'Arjun Singh',     'Delhi',     'India'),
(4,  'Aisha Khan',      'Hyderabad', 'India'),
(5,  'Rohan Gupta',     'Pune',      'India'),
(6,  'Sneha Patel',     'Chennai',   'India'),
(7,  'Vikram Nair',     'Jaipur',    'India'),
(8,  'Divya Reddy',     'Kolkata',   'India'),
(9,  'Amit Verma',      'Surat',     'India'),
(10, 'Neha Joshi',      'Ahmedabad', 'India');

-- Sales (Jan–Apr 2026)
INSERT INTO sales VALUES
(1,  '2026-01-05', 1,  1, 1, 85000.00),
(2,  '2026-01-12', 2,  5, 2, 17000.00),
(3,  '2026-01-18', 3,  3, 1, 12000.00),
(4,  '2026-01-25', 4,  8, 1, 22000.00),
(5,  '2026-02-03', 5,  2, 3,  3600.00),
(6,  '2026-02-10', 6,  4, 1, 25000.00),
(7,  '2026-02-14', 7,  7, 2, 11000.00),
(8,  '2026-02-20', 8,  1, 1, 85000.00),
(9,  '2026-02-28', 9,  6, 2,  6400.00),
(10, '2026-03-05', 10, 9, 1,  6500.00),
(11, '2026-03-10', 1,  10,4,  8400.00),
(12, '2026-03-15', 2,  2, 5,  6000.00),
(13, '2026-03-20', 3,  5, 1,  8500.00),
(14, '2026-03-25', 4,  3, 2, 24000.00),
(15, '2026-04-01', 5,  1, 1, 85000.00),
(16, '2026-04-08', 6,  8, 2, 44000.00),
(17, '2026-04-12', 7,  4, 1, 25000.00),
(18, '2026-04-18', 8,  5, 3, 25500.00),
(19, '2026-04-22', 9,  7, 1,  5500.00),
(20, '2026-04-30', 10, 6, 2,  6400.00);

