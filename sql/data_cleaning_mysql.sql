CREATE DATABASE DB_Superstore;

USE DB_Superstore;

-- Step 1
-- Create table with all columns as VARCHAR to avoid data import errors
--  Data types will be cleaned and converted after successful upload

 CREATE TABLE Global_Superstore (Row_ID VARCHAR(50),Order_ID VARCHAR(50),Order_Date VARCHAR(50),Ship_Date VARCHAR(50),Ship_Mode VARCHAR(60),
  Customer_ID VARCHAR(50),Customer_Name VARCHAR(100),Segment VARCHAR(50), City VARCHAR(60),State VARCHAR(50),Country VARCHAR(50),
  Postal_Code VARCHAR(20),Market VARCHAR(50),Region VARCHAR(50),Product_ID VARCHAR(50),Category VARCHAR(100),Sub_Category VARCHAR(100),
  Product_Name VARCHAR(150),Sales VARCHAR(50),Quantity VARCHAR(20),Discount VARCHAR(20),Profit VARCHAR(50),Shipping_Cost VARCHAR(50),
  Order_Priority VARCHAR(20)
);
 
 
 -- Step 2
-- Load raw CSV data into MySQL table
-- Using LOCAL INFILE to read file from local system
-- latin1 encoding is used to prevent character encoding issues during CSV import (special characters, quotes, etc

LOAD DATA LOCAL INFILE
'C:/Users/prave/OneDrive/Common project/Global-Superstore-Project-files/Global_Superstore_datasets.csv'
INTO TABLE Global_Superstore
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode,
Customer_ID, Customer_Name, Segment, City, State, Country,
Postal_Code, Market, Region, Product_ID, Category,
Sub_Category, Product_Name, Sales, Quantity, Discount,
Profit, Shipping_Cost, Order_Priority
);


-- Step 3

-- Verify successful data ingestion by checking row count and previewing sample records
SELECT COUNT(*) AS total_rows FROM Global_Superstore;
SELECT * FROM Global_Superstore LIMIT 5;


-- Step 4
-- Check current column data types before alter
DESCRIBE Global_Superstore;

-- Step 5
-- Convert date strings to DATE format
UPDATE Global_Superstore
SET Order_Date = str_to_date(Order_Date,'%d-%m-%Y'),
     Ship_Date = str_to_date(Ship_Date,'%d-%m-%Y');
     
     
-- Step  6

--  Clean currency symbols and commas
UPDATE Global_Superstore
SET Sales = REPLACE(REPLACE(Sales, ',', ''), '$', '')
WHERE Sales LIKE '%$%' OR Sales LIKE '%,%';

UPDATE Global_Superstore
SET Profit = REPLACE(REPLACE(Profit, ',', ''), '$', '')
WHERE Profit LIKE '%$%' OR Profit LIKE '%,%';

UPDATE Global_Superstore
SET Discount = REPLACE(Discount, '%', '')
WHERE Discount LIKE '%\%%';

     
  -- Step 7
-- Enforce correct data types after cleaning

ALTER TABLE Global_Superstore
MODIFY COLUMN ROW_ID INT,
MODIFY COLUMN Order_Date DATE,
MODIFY COLUMN Ship_Date DATE,
MODIFY COLUMN Sales DECIMAL(10,2),
MODIFY COLUMN Quantity INT,
MODIFY COLUMN Discount DECIMAL(5,2),
MODIFY COLUMN Profit DECIMAL(10,2),
MODIFY COLUMN Shipping_Cost DECIMAL(10,2);


-- Step 8
-- Check NULL values in critical numeric columns
SELECT COUNT(*) AS null_sales FROM Global_Superstore WHERE Sales IS NULL;
SELECT COUNT(*) AS null_profit FROM Global_Superstore WHERE Profit IS NULL;

-- Check zero values in Profit and Discount
SELECT COUNT(*) AS zero_profit FROM Global_Superstore WHERE Profit = 0 OR Discount = 0;


-- Step 9

--  Row and ID validation
# Data integrity check: validate key business identifiers
select count(*) AS total , count(distinct order_id) AS distinct_orderid FROM Global_Superstore;
SELECT COUNT(*) AS total,COUNT(distinct Customer_ID) AS distinct_customers_id FROM Global_Superstore;
SELECT COUNT(*) AS total,COUNT(distinct Product_ID) AS distinct_products  FROM Global_Superstore;


-- Step 10

-- SET Primary for row_id
ALTER TABLE Global_Superstore
MODIFY Row_ID INT NOT NULL,
ADD PRIMARY KEY (ROW_ID);


-- Step  11

-- MIN–MAX queries to perform data sanity checks and validate top and bottom values after cleaning
-- Numeric ranges
SELECT MIN(Sales), MAX(Sales), MIN(Profit), MAX(Profit) FROM Global_Superstore;
--  Date ranges
SELECT MIN(Order_Date), MAX(Order_Date), MIN(Ship_Date), MAX(Ship_Date) FROM Global_Superstore;


-- Step  12

-- Check rows with missing critical values
select Sales, Profit, Order_Date
FROM Global_Superstore
WHERE Sales IS NULL
   OR Profit IS NULL
   OR Order_Date IS NULL;
   
   

SELECT *
FROM Global_Superstore;

describe Global_Superstore;