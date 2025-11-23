--Display all columns for all transactions?
--Expected output : all columns

SELECT*
FROM retail_sales_dataset;
--------------------------------------------------------------------------------------

----Display only the Transaction ID, DATE,and Customer ID for all records?
----Expected output: Transactions ID, Date,Customer ID.

SELECT transaction_id,
       date,
       customer_id
FROM retail_sales_dataset;
-----------------------------------------------------------------------------------------

--Display all the distinct product categories in the dataset?
--Expected output: Poduct Category.

SELECT DISTINCT product_category
FROM retail_sales_dataset;
------------------------------------------------------------------------------------------

--Display all the distinct gender values in the dataset?
--Expected output:Gender

SELECT DISTINCT gender
FROM retail_sales_dataset;
------------------------------------------------------------------------------------------

--Display all transactions where the Age is greater than 40?
--Expected output: all columns.

SELECT*
FROM retail_sales_dataset
WHERE Age>40;
------------------------------------------------------------------------------------------------

--Display all transactions where the Price per Unit is between 100 and 500.
--Expected output: all columns

SELECT *
FROM retail_sales_dataset
WHERE price_per_Unit BETWEEN 100 AND 500;
---------------------------------------------------------------------------------------------

--Display all transactions where the product category is either 'beauty'or 'Electronics'?
--Expected output: all columns

SELECT *
FROM retail_sales_dataset
WHERE product_category IN ('beauty', 'Electronics');
------------------------------------------------------------------------------------------------

--Display all transactions where the product category is not 'Clothing'?
--Expected output: all columns.

SELECT *
FROM retail_sales_dataset
WHERE product_category <> 'Clothing';
-----------------------------------------------------------------------------------------------

--display all transactions where the Quality is greater or equal to 3?
--Expected output: all columns

SELECT*
FROM retail_sales_dataset
WHERE Quantity >= 3;
------------------------------------------------------------------------------------------------

--COUNT the total number of transactions?
--Expected output: Total_Transactions

SELECT COUNT(*)AS Total_transactions
FROM retail_sales_dataset,
----------------------------------------------------------------------------------------------

--Find the average Age of customers.
--Expected output:Average_Age

SELECT AVG(Age)AS average_age
FROM retail_sales_dataset,
---------------------------------------------------------------------------------------------

--Find the total quantity of products sold.
--Expected output:Total_Quantity

SELECT SUM(quantity)AS quantity_sold
FROM retail_sales_dataset;
-----------------------------------------------------------------------------------------------

--Find the maximum Total Amount spent in a single transaction.
--EXpected output:Max_Total_Amount

SELECT MAX(total_amount)AS Max_Total_Amount
FROM retail_sales_dataset;
------------------------------------------------------------------------------------------------

--Find the minimum Price per Unit in the dataset.
--Expected output:Min_Price_per_unit

SELECT MIN(price_per_unit)AS Min_Price_per_Unit
FROM retail_sales_dataset;
--------------------------------------------------------------------------------------------------

--Find the number of transactions per Product Category.
--Expected output: Product_Category, Transaction_Count

SELECT product_category,
    COUNT(*)AS Transaction_count
FROM retail_sales_dataset
GROUP BY product_category;
-------------------------------------------------------------------------------------------------

--Find the total revenue(Total Amount)per gender.
--Expected output:Gender, Total_Revenue

SELECT SUM(total_Amount)AS Total_Revenue,
          gender
FROM retail_sales_dataset
GROUP BY gender;
----------------------------------------------------------------------------------------------------

--Find the average Price per Unit per product category.
--Expected output: Product_Category,Average_Price

SELECT product_category,
    AVG(price_per_Unit)AS avg_price
FROM retail_sales_dataset
GROUP BY product_category;
------------------------------------------------------------------------------------------------

--Find the total per product category where total revenue is greater than 10,000.
--EXpected output: Product_Category,Total_Revenue

SELECT product_category,
  SUM(total_amount)AS total_revenue
FROM retail_sales_dataset
GROUP BY product_category
HAVING total_revenue>10000;
---------------------------------------------------------------------------------------------------

--Find the average quantity per product category where the average is more than 2.
--Expected output:Product_category,Average_Quantity

SELECT product_category,
 AVG(quantity)as Average_Quantity
FROM retail_sales_dataset
GROUP BY product_category
HAVING average_quantity >2
---------------------------------------------------------------------------------------------------

--Display a column called Spending_level that shows 'High' if Total amount>1000 otherwise'Low'?
--Expected output: Transaction_ID,Total_Amount,Spending_level

SELECT Transaction_id,
       Total_amount,
  CASE WHEN Total_amount>1000 THEN 'High'
  ELSE 'Low'
  END AS Spending_Level
FROM retail_sales_dataset
-------------------------------------------------------------------------------------------------

--Display a new column called Age_Group that labels customers as:
  --'Youth' if Age<30
  --'Adult'if Age is between 30 and 59
  --'Senior'if Age >=60
--Expected output: Customer ID, Age, Age_Group
       
SELECT 
  customer_id,
  age,
  CASE 
    WHEN age < 30 THEN 'Youth'
    WHEN age BETWEEN 30 AND 59 THEN 'Adult'
    WHEN age >= 60 THEN 'Senior'
    ELSE 'Unknown'
  END AS age_group
FROM customers;
-------------------------------------------------------------------------------------------------
 
