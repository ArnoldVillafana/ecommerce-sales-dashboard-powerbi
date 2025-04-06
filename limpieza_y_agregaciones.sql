-- limpieza_y_agregaciones.sql  
-- Author: Arnold Villafana  
-- Date: April 2025  
-- Description: Cleaning and transformation of the "ventas_ecommerce_2024.csv" dataset  
-- Objective: Prepare the data for analysis in Power BI  

-- Step 1: Remove records with critical null values  
SELECT *  
FROM ventas_ecommerce_2024  
WHERE  
    Order_ID IS NOT NULL  
    AND Product_Category IS NOT NULL  
    AND Unit_Price IS NOT NULL  
    AND Units_Sold IS NOT NULL;

-- Step 2: Calculate Total Sales per row  
-- TotalSales = Unit Price * Units Sold  
SELECT *,  
    Unit_Price * Units_Sold AS TotalSales  
FROM ventas_ecommerce_2024;

-- Step 3: Calculate Average Sale per Order  
-- This metric will be used to measure the average ticket size  
SELECT  
    Order_ID,  
    AVG(Unit_Price * Units_Sold) AS Average_Sales  
FROM ventas_ecommerce_2024  
GROUP BY Order_ID;

-- Step 4: Clean and normalize date fields  
-- Extract year and month in readable format  
SELECT *,  
    EXTRACT(YEAR FROM Date) AS Year,  
    FORMAT_DATE('%B', Date) AS Month_Name  
FROM ventas_ecommerce_2024;

-- Step 5: Validate payment methods  
-- Ensure all records have a defined Payment Method  
SELECT DISTINCT Payment_Method  
FROM ventas_ecommerce_2024  
WHERE Payment_Method IS NOT NULL;