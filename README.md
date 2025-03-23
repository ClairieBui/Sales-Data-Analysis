# **Sales-Data-Analysis**

## 📌 **Project Overview**
The e-commerce industry is rapidly expanding worldwide. By examining data from a virtual e-commerce platform, we can uncover key insights into sales trends and market growth. This analysis offers an objective perspective on different product categories, highlighting those most appealing to online shoppers. It also assesses the impact of promotional strategies on product performance and evaluates profitability, equipping the company with valuable data to make informed decisions for future sales periods.


## ❓ **Problem Statement**
1. How can you write a SQL query to calculate the total sales of furniture products, grouped by each quarter of the year, and order the results chronologically?
2. How can you analyze the impact of different discount levels on sales performance across product categories, specifically looking at the number of orders and total profit generated for each discount classification?

No Discount = 0 

0 < Low Discount < 0.2 

0.2 < Medium Discount < 0.5 

High Discount > 0.5

4. How can you determine the top-performing product categories within each customer segment based on sales and profit, focusing specifically on those categories that rank within the top two for profitability?
5. How can you create a report that displays each employee's performance across different product categories, showing not only the total profit per category but also what percentage of their total profit each category represents, with the results ordered by the percentage in descending order for each employee?
6. How can you develop a user-defined function in SQL Server to calculate the profitability ratio for each product category an employee has sold, and then apply this function to generate a report that ranks each employee's product categories by their profitability ratio?

## 🛠️ **Skills Demonstrated**
- __MS SQL__ for data analysis.

## 📊 **Dataset Information**
- **Source**: Excel file containing sales data.

## **Dataset Analysis**
1. How can you write a SQL query to calculate the total sales of furniture products, grouped by each quarter of the year, and order the results chronologically?

![image](https://github.com/user-attachments/assets/a886932b-7e8f-4694-bfff-d0c37db2bd99)

![image](https://github.com/user-attachments/assets/c907c807-5766-40e1-9611-9082787fdb03)

The executed SQL query calculates the total sales of furniture products, grouped by each quarter of the year and ordered chronologically. Below are key observations from the output:

- Consistent Growth Over Time: The total sales figures exhibit a generally increasing trend across the years, indicating a growing demand for furniture products.

- Seasonal Fluctuations: Sales vary significantly between quarters, with Q4 (October–December) consistently showing the highest sales figures. This pattern suggests increased demand during the holiday season.

- Yearly Trends: Each subsequent year generally records higher total sales than the previous, highlighting a positive growth trajectory for the furniture product category.

- These insights can help businesses optimize inventory management, tailor marketing strategies for peak seasons, and allocate resources more efficiently to maximize revenue.


2. How can you analyze the impact of different discount levels on sales performance across product categories, specifically looking at the number of orders and total profit generated for each discount classification?

No Discount = 0 

0 < Low Discount < 0.2 

0.2 < Medium Discount < 0.5 

High Discount > 0.5

![image](https://github.com/user-attachments/assets/560c18b1-a299-4cfa-b61f-52879e6598e7)

![image](https://github.com/user-attachments/assets/214e4e88-b1ea-4e6e-a8e4-4fb23e60e917)

**A. Number of Orders Across Discount Levels**

- No Discount generally leads to higher order volumes, as seen in categories like Accessories, Phones, Copiers, and Paper, where the number of orders is significantly higher than other discount levels.

- Medium Discount also attracts a considerable number of orders, but less than No Discount. This is evident in categories such as Binders, Chairs, and Machines, where Medium Discounts still maintain a competitive order volume.

- High Discounts (above 50%) have the lowest number of orders, which suggests that deep discounts may not necessarily drive high sales volume.

**B. Discount level condition**:

- No Discount consistently generates the highest total profit across most categories. For example:

Phones (No Discount: $34,365.21)

Copiers (No Discount: $35,556.13)

Bookcases (No Discount: $6,075.71)

Paper (No Discount: $25,329.47)

Tables (No Discount: $13,276.3)

- Medium Discounts result in positive but lower profits, as seen in categories like Binders ($29,417.81), Machines ($-5,005.83), and Envelopes ($1,987.19). Some categories still maintain reasonable profitability despite the discount.

- High Discounts tend to result in significant profit losses.

For example, the Appliances category shows a loss (-$8,629.64) under High Discounts, indicating that excessive price reductions can erode profitability.

Machines (-$19,579.32) and Storage (-$4,249.35) also show steep losses at high discounts.


**C. Categories with the Best Profit Performance**
Phones, Copiers, and Paper categories are highly profitable without discounts, meaning discounting may not be necessary to drive sales.

Binders and Accessories still perform well under Medium Discounts, suggesting that customers may still be willing to purchase at a moderate price reduction.

Tables and Machines struggle with profitability under Medium and High Discounts, meaning discounting strategies need careful adjustment.

  
3. How can you determine the top-performing product categories within each customer segment based on sales and profit, focusing specifically on those categories that rank within the top two for profitability?

![image](https://github.com/user-attachments/assets/d7c5d1fe-4cae-48ed-856e-3ccf368cc29d)


![image](https://github.com/user-attachments/assets/30696b7c-bbc2-4e2c-9579-6ce779fcfe7e)


Based on both profitability and sales performance, the best-performing categories within each segment are:

- Consumer: Phones (Ranks 2nd in profit and 2nd in sales)

- Corporate: Accessories (Ranks 2nd in profit, moderate in sales)

- Home Office: Phones (Ranks 2nd in profit and 1st in sales, making it the top performer)

Thus, the most strategic product category to focus on would be Phones, especially in the Home Office and Consumer segments, as they are both highly profitable and among the top in sales. 🚀


4. How can you create a report that displays each employee's performance across different product categories, showing not only the total profit per category but also what percentage of their total profit each category represents, with the results ordered by the percentage in descending order for each employee?

![image](https://github.com/user-attachments/assets/9c8d3a1e-7f05-4b69-b6f1-a96b12d9c279)

![image](https://github.com/user-attachments/assets/8efb494b-6475-4b52-9396-4cdee02c1be9)

**A. Top Performing Employees and Categories**

- Employee #6 has the highest profit overall, with Binders contributing 27.76%, followed by Copiers and Phones.

- Employee #8 has the highest single-category percentage with Copiers (41.52%), making it their dominant category.

**B. Loss-Making Categories**

- Some categories generate negative profit, such as Tables, Bookcases, and Supplies, across multiple employees.

- Employee #8 has Machines (-24.28%) and Tables (-14.32%), indicating a heavy loss in those categories.

**C. Profit Concentration**

- Most employees have a few high-performing categories that make up the bulk of their profit.

- Example: Employee #3 makes over 41% profit from Binders, while other categories contribute much less.

**D. Diversification vs. Dependency**

- Employees like #1 and #9 have a more even spread of profits across multiple categories.

- Others, like #5 and #8, rely heavily on one or two categories for the majority of their profits.


5. How can you develop a user-defined function in SQL Server to calculate the profitability ratio for each product category an employee has sold, and then apply this function to generate a report that ranks each employee's product categories by their profitability ratio?

![image](https://github.com/user-attachments/assets/b0388e1e-f291-4f17-89e3-9f768ced85d8)

![image](https://github.com/user-attachments/assets/88ab66b4-099a-4aec-ac89-234663e8b69c)

**A. Profitability Trends Across Employees**
Highest Profitability: Employees 1, 2, 3, 4, 5, 6, 7, 8, and 9 have the highest profitability ratios in Labels, Paper, Envelopes, and Copiers (ranging between 0.31 - 0.48).

Low or Negative Profitability: Categories like Tables, Bookcases, Machines, and Supplies have negative or very low profitability, indicating potential losses.

**B. Product Categories with the Highest and Lowest Profitability**

High Profitability Categories:

- Labels (~0.45-0.48)

- Paper (~0.42-0.46)

- Envelopes (~0.38-0.44)

- Copiers (~0.30-0.45)

Low or Negative Profitability Categories:

- Supplies (-0.11 to -0.20)

- Tables (-0.06 to -0.21)

- Machines (-0.03 to -0.17)

- Bookcases (-0.01 to -0.11)

**C. Employee Performance in Product Profitability**
- Top Performers: Employee 6 and 8 generate the highest sales and have the best-performing categories.

- Employees with Losses: Employees 5, 7, 9 have losses in Tables, Machines, and Supplies, which suggests poor pricing strategy or high costs.

4. Strategic Recommendations

Focus on high-profit categories: Employees should emphasize selling Labels, Paper, and Copiers, as these have higher profitability ratios.

Revise pricing or cost strategies: Loss-making categories like Supplies and Tables may need better cost management, supplier negotiations, or pricing adjustments.

Reallocation of Sales Efforts: Employees with low-profit categories should be encouraged to focus more on high-margin products.

---
🔗 *For further improvements, feel free to fork this project and contribute!* 🚀


## 📌 **Conclusion & Recommendations**
**Conclusion**
The analysis reveals that Phones, Copiers, and Paper are the most profitable categories, while high discounts lead to losses, especially for Machines and Tables. Employees with a diverse product mix tend to have more stable profits, whereas those relying on low-margin products struggle with profitability. Optimizing discount strategies, employee sales focus, and product allocation can significantly boost overall sales performance and profitability.

**Recommendations for Improvement**
- Refine Discount Strategies – Limit high discounts on loss-making products and focus on selling high-margin items at full price.
- Enhance Employee Training – Encourage sales of Phones, Copiers, and Paper, and train employees to avoid low-profit categories.
- Optimize Product Allocation – Reduce stock of low-margin products, increase marketing for high-performing items, and adjust pricing for unprofitable categories.



  
