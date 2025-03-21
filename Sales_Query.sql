-- QUESTION 1:
/* How can you write a SQL query to calculate the total sales of furniture products,
grouped by each quarter of the year, and order the results chronologically? */

SELECT 
    CONCAT('Q', DATEPART(QUARTER, ORDER_DATE), '-', YEAR(ORDER_DATE)) AS Quarter_Year,
    ROUND(SUM(SALES), 2) AS Total_Sales
FROM 
    Orders o
JOIN 
    Product p ON o.PRODUCT_ID = p.ID
WHERE 
    NAME = 'Furniture'
GROUP BY 
    YEAR(ORDER_DATE), DATEPART(QUARTER, ORDER_DATE), 
    CONCAT('Q', DATEPART(QUARTER, ORDER_DATE), '-', YEAR(ORDER_DATE))
ORDER BY 
    YEAR(ORDER_DATE), DATEPART(QUARTER, ORDER_DATE);

-- QUESTION 2:
/* How can you analyze the impact of different discount levels on sales performance across product categories, 
specifically looking at the number of orders and total profit generated for each discount classification?

Discount level condition:
No Discount = 0
0 < Low Discount < 0.2
0.2 < Medium Discount < 0.5
High Discount > 0.5 */

SELECT 
    CATEGORY,
    CASE 
        WHEN DISCOUNT > 0.5 THEN 'High Discount'
        WHEN DISCOUNT > 0.2 AND DISCOUNT <= 0.5 THEN 'Medium Discount'
        WHEN DISCOUNT > 0 AND DISCOUNT <= 0.2 THEN 'Low Discount'
        ELSE 'No Discount'
    END AS Discount_Class,
    COUNT(ORDER_ID) AS Number_of_Orders,
    ROUND(SUM(PROFIT), 2) AS Total_Profit
FROM 
    Orders o
JOIN 
    Product p ON o.PRODUCT_ID = p.ID
GROUP BY 
    CATEGORY,
    CASE 
        WHEN DISCOUNT > 0.5 THEN 'High Discount'
        WHEN DISCOUNT > 0.2 AND DISCOUNT <= 0.5 THEN 'Medium Discount'
        WHEN DISCOUNT > 0 AND DISCOUNT <= 0.2 THEN 'Low Discount'
        ELSE 'No Discount'
    END
ORDER BY 
    CATEGORY,
    Discount_Class;


-- QUESTION 3:
/* How can you determine the top-performing product categories within each customer segment based on sales and profit, 
focusing specifically on those categories that rank within the top two for profitability? */


WITH SalesData AS (
	SELECT
		SEGMENT,
		CATEGORY,
		SUM(SALES) AS Total_Sales,
		SUM(PROFIT) AS Total_Profit
	FROM 
		Orders o
	JOIN 
		Product p ON o.PRODUCT_ID = p.ID
	JOIN 
		Customer c ON o.CUSTOMER_ID = c.ID
	GROUP BY
		SEGMENT,
		CATEGORY
),
RankedData AS (
	SELECT
		SEGMENT,
		CATEGORY,
		Total_Sales,
		Total_Profit,
		RANK() OVER (PARTITION BY SEGMENT ORDER BY Total_Sales DESC) AS Sales_Rank,
        RANK() OVER (PARTITION BY SEGMENT ORDER BY Total_Profit DESC) AS Profit_Rank
	FROM	
		SalesData
)
SELECT 
    SEGMENT,
    CATEGORY,
    Sales_Rank,
	Profit_Rank
FROM 
    RankedData
WHERE 
	Profit_Rank <= 2
ORDER BY 
    SEGMENT, Sales_Rank DESC;


-- QUESTION 4
/*
How can you create a report that displays each employee's performance across different product categories, 
showing not only the total profit per category but also what percentage of 
their total profit each category represents, with the results ordered by the 
percentage in descending order for each employee?
*/

WITH EmployeeProfit AS (
    SELECT 
        o.ID_EMPLOYEE,
        p.CATEGORY,
        SUM(o.PROFIT) AS Total_Profit
    FROM 
        Orders AS o
    JOIN 
        Product AS p ON o.PRODUCT_ID = p.ID
    GROUP BY 
        o.ID_EMPLOYEE, p.CATEGORY
),
TotalProfit AS (
    SELECT 
        ID_EMPLOYEE,
        SUM(Total_Profit) AS Employee_Total_Profit
    FROM 
        EmployeeProfit
    GROUP BY 
        ID_EMPLOYEE
)
SELECT 
    ep.ID_EMPLOYEE,
    ep.CATEGORY,
    ROUND(ep.Total_Profit, 2) AS Rounded_Total_Profit,
    ROUND((ep.Total_Profit / tp.Employee_Total_Profit) * 100, 2) AS Profit_Percentage
FROM 
    EmployeeProfit AS ep
JOIN 
    TotalProfit AS tp ON ep.ID_EMPLOYEE = tp.ID_EMPLOYEE
ORDER BY 
    ep.ID_EMPLOYEE, Profit_Percentage DESC;


-- QUESTION 5:
/*
How can you develop a user-defined function in SQL Server 
to calculate the profitability ratio for each product category an employee has sold, 
and then apply this function to generate a report that 
ranks each employee's product categories by their profitability ratio?
*/

CREATE FUNCTION dbo.CalculateProfitabilityRatio
(
    @TotalSales FLOAT,
    @TotalProfit FLOAT
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @ProfitabilityRatio FLOAT;

    IF @TotalSales = 0
        SET @ProfitabilityRatio = NULL; -- Avoid division by zero
    ELSE
        SET @ProfitabilityRatio = @TotalProfit / @TotalSales;

    RETURN @ProfitabilityRatio;
END;

WITH EmployeeSales AS (
    SELECT 
        o.ID_EMPLOYEE,
        p.CATEGORY,
        SUM(o.SALES) AS Total_Sales,
        SUM(o.PROFIT) AS Total_Profit
    FROM 
        Orders AS o
    JOIN 
        Product AS p ON o.PRODUCT_ID = p.ID
    GROUP BY 
        o.ID_EMPLOYEE, p.CATEGORY
)
SELECT 
    es.ID_EMPLOYEE,
    es.CATEGORY,
    ROUND(es.Total_Sales, 2) AS Total_Sales,
    ROUND(es.Total_Profit, 2) AS Total_Profit,
    ROUND(dbo.CalculateProfitabilityRatio(es.Total_Sales, es.Total_Profit), 2) AS Profitability_Ratio
FROM 
    EmployeeSales AS es
ORDER BY 
    ID_EMPLOYEE ASC, Profitability_Ratio DESC;
