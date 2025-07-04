# DSA-PROJECT-CAPSTONE

## Kultra Mega Stores

### Kultra Mega Stores Inventory (SQL) analyzing sales and shipping patterns from 2009–2012  
### Goal: advise business decisions based on sales, shipping, and customer behavior

1. Which product category had the highest sales?...

select [Product_Category], sum([Sales]) as [Total Sales] 
from [dbo].[KMS Sql Case Study]
group by [Product_Category]
order by [Total Sales] desc

