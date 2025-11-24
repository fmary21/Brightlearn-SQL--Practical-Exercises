SELECT* FROM `Retail_Sales.2112` LIMIT 1000

---------------------------------------------------------------------
-----1. WHERE Clause
-----Q1. Filter all transactions that occurred in the year 2023.
---Expected output: All columns

SELECT *
FROM `Retail_Sales.2112`
WHERE EXTRACT(YEAR FROM Date) = 2023;

--------------------------------------------------------------------------------------------------------------
-----2. Filtering + Conditions
----Q2. Display all transactions where the Total Amount is more than the average Total Amount
of the entire dataset.
----Expected output: All columns

SELECT *
FROM `Retail_Sales.2112`
WHERE `Total Amount` > (
    SELECT AVG(`Total Amount`)
    FROM `Retail_Sales.2112`
);

---------------------------------------------------------------------------------------------------------------

-----3. Aggregate Functions
--Q3. Calculate the total revenue (sum of Total Amount).
---Expected output: Total_Revenue

SELECT COUNT(`Total Amount`) AS Total_Revenue
FROM `Retail_Sales.2112`

-------------------------------------------------------------------------------------------------------------

---4. DISTINCT
---Q4. Display all distinct Product Categories in the dataset.
-----Expected output: Product_Category

SELECT DISTINCT `Product Category`
FROM `Retail_Sales.2112`

-------------------------------------------------------------------------------------------------------------

-----5. GROUP BY
-----Q5. For each Product Category, calculate the total quantity sold.
------Expected output: Product_Category

SELECT 
  `Product Category`,
  SUM(Quantity) AS Total_Quantity_Sold
FROM `Retail_Sales.2112` 
GROUP BY `Product Category`;

---------------------------------------------------------------------------------------------------------------

----6. CASE Statement
---Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’
(30–59), and ‘Senior’ (60+).
----Expected output: Customer_ID, Age, Age_Group.

SELECT `Customer ID`, Age,
     CASE WHEN Age BETWEEN 16 AND 30 THEN 'Youth'
          WHEN Age BETWEEN 31 AND 59 THEN 'Adult'
          WHEN Age < 60 THEN 'Senior'
          END AS `Age Group`
FROM `Retail_Sales.2112`

-----------------------------------------------------------------------------------------------------------

----7. Conditional Aggregation
----Q7. For each Gender, count how many high-value transactions occurred (where Total
Amount > 500).
------Expected output: Gender, High_Value_Transactions

SELECT
  Gender,
  COUNTIF(`Total Amount` > 500) AS High_Value_Transactions
FROM `Retail_Sales.2112`
GROUP BY Gender;

---------------------------------------------------------------------------------------------------------------

-----8. HAVING Clause
------Q8. For each Product Category, show only those categories where the total revenue
exceeds 5,000.
-----Expected output: Product_Category, Total_Revenue
 
 
SELECT
  `Product Category`,
  SUM(`Total Amount`) AS Total_Revenue
FROM `Retail_Sales.2112`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

-----------------------------------------------------------------------------------------------
 
---9. Calculated Fields
----Q9. Display a new column called Unit_Cost_Category that labels a transaction as:
----– 'Cheap' if Price per Unit < 50
----– 'Moderate' if Price per Unit between 50 and 200
----– 'Expensive' if Price per Unit > 200
------Expected output: Transaction_ID, Price_per_Unit, Unit_Cost_Category

SELECT `Transaction ID`, `Price per Unit`,
   CASE 
        WHEN `Price per Unit` < 50 THEN 'Cheap'
        WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
        WHEN `Price per Unit` > 20 THEN 'Expensive'
      END AS `Unit Cost Category`
FROM `Retail_Sales.2112`

--------------------------------------------------------------------------------------------------------------

----10. Combining WHERE + CASE
-----Q10. Display all transactions from customers aged 40 or older and add a column
Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’.
----Expected output: Customer_ID, Age, Total_Amount, Spending_Level

SELECT `Customer ID`,
        `Age`,
        `Total Amount`,
    CASE 
      WHEN `Total Amount` > 1000 THEN 'High'
      ELSE 'Low'
    END AS `Spending Level`
FROM `Retail_Sales.2112`
WHERE Age >= 40

---------------------------------------------------------------------------------------------------------
