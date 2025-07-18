select * from [dbo].[KMS Sql Case Study]

1. Which product category had the highest sales?...

select [Product_Category], sum([Sales]) as [Total Sales] 
from [dbo].[KMS Sql Case Study]
group by [Product_Category]
order by [Total Sales] desc


2. What are the Top 3 and Bottom 3 regions in terms of sales?

SELECT TOP 3 [Region], SUM([Sales]) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales DESC

SELECT TOP 3 [Region], SUM([Sales]) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales ASC


...#3. What were the total sales of appliances in Ontario?

SELECT [Product_Sub_Category], SUM([Sales]) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
WHERE [Region] = 'Ontario'
AND Product_Sub_Category = 'Appliances' 
GROUP BY [Product_Sub_Category]


...#4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers


SELECT TOP 10 [Customer_Name], [Product_Name], [Shipping_Cost], [Order_Quantity], [Discount], [Unit_Price], SUM([Sales]) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name],[Product_Name], [Shipping_Cost], [Order_Quantity], [Discount], [Unit_Price]
ORDER BY TotalSales ASC


...#5. KMS incurred the most shipping cost using which shipping method?

SELECT [Ship_Mode], SUM([Shipping_Cost]) AS TotalShippingCost
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Ship_Mode]
ORDER BY TotalShippingCost DESC


...#6. Who are the most valuable customers, and what products or services do they typically purchase?

SELECT TOP 10 [Customer_Segment], [Customer_Name], [Product_Sub_Category],
    SUM([Sales]) AS TotalSales,
    STRING_AGG([Product_Name], ', ') AS ProductsPurchased
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Segment], [Customer_Name],[Product_Sub_Category]
ORDER BY TotalSales DESC


....#7. Which small business customer had the highest sales?

SELECT TOP 1 [Customer_Segment],  [Customer_Name],
    SUM([Sales]) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Segment],  [Customer_Name]
ORDER BY TotalSales DESC



....#8. Which Corporate Customer placed the most number of orders in 2009 – 2012?

SELECT TOP 1 [Customer_Segment], [Customer_Name],
    COUNT([Order_Quantity]) AS Number_Of_Order_Count
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
    AND [Order_Date] BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY [Customer_Segment], [Customer_Name]
ORDER BY Number_Of_Order_Count DESC


....#9. Which consumer customer was the most profitable one?


SELECT TOP 1 [Customer_Segment], [Customer_Name],
    SUM([Profit]) AS TotalProfit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Segment], [Customer_Name]
ORDER BY TotalProfit DESC



...#10. Which customer returned items, and what segment do they belong to?

SELECT * FROM(
SELECT [Order_ID], [Customer_Segment],[Customer_Name],[Product_Category]
FROM [dbo].[KMS Sql Case Study]) AS Customer
JOIN (
SELECT [Order_ID], [Status] 
FROM KMS_db.[dbo].[Order_Status]) AS Returned 
ON Customer.[Order_ID] = Returned.[Order_ID]
ORDER BY [Customer_Name] DESC



...#11. If the delivery truck is the most economical but the slowest shipping method 
and Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer


SELECT [Order_Priority], [Ship_Mode],
    COUNT([Sales]) AS OrderCount,
    SUM([Shipping_Cost]) AS TotalShippingCost,
    AVG([Shipping_Cost]) AS AvgShippingCost
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], TotalShippingCost DESC