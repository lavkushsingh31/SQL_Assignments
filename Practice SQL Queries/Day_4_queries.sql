use planetarygoods;

/*
Aggregate functions
COUNT
MIN
MAX
SUM
AVG
*/

SELECT *
FROM customers;

SELECT COUNT(DISTINCT City) as City_Count
FROM customers;

SELECT SUM(totalpaid) as TotalPaidSum
FROM orders;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

# Groupby
SELECT ShippingStatus, SUM(TotalPaid) AS TotalPaidSum
FROM orders
WHERE OrderID BETWEEN 1 and 30
GROUP BY ShippingStatus;

SELECT ShippingStatus, SUM(TotalPaid) AS TotalPaidSum
FROM orders
WHERE OrderID BETWEEN 1 and 30
GROUP BY ShippingStatus
ORDER BY TotalPaidSum;


SELECT category, SUM(Price) as ToTalPrice
FROM products
GROUP BY category;

SELECT ProductID, SUM(FinalTotal) as TotalSales
FROM orderdetails
GROUP BY ProductID
ORDER BY TotalSales DESC;

SELECT *
FROM customers;

SELECT City, COUNT(CustomerID) AS CustomerCount
FROM customers
GROUP BY City;

SELECT ProductID, SUM(FinalTotal) as Sales
FROM orderdetails
GROUP BY ProductID
ORDER BY Sales DESC
LIMIT 3;

SELECT Country, City, COUNT(CustomerID) as TotalCustomers
FROM customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC;

# Having is used to filter results after Group by
SELECT CustomerID, SUM(TotalPaid) AS total_order_value
FROM orders
GROUP BY CustomerID
HAVING total_order_value >= 1000
ORDER BY total_order_value DESC;


SELECT CustomerID, COUNT(OrderID) as Count_of_Orders
FROM orders
GROUP BY CUstomerID
HAVING Count_of_Orders > 5
ORDER BY Count_of_Orders DESC;

SELECT CustomerID, AVG(TotalPaid) as average_spent
FROM orders
GROUP BY CustomerID;

# subqueries
# find the products sold more than its average
SELECT ProductID, SUM(Quantity) as TotalQuantitySold
FROM orderdetails
GROUP BY ProductID
HAVING TotalQuantitySold > (
	SELECT AVG(Quantity) FROM orderdetails
);

# Monthly Sales per year
SELECT Year(OrderDate) as Year, Month(OrderDate) as Month, SUM(TotalPaid) as TotalSales
FROM orders
GROUP BY Year, Month;

#Average Sales per customer
SELECT CustomerID, SUM(TotalPaid) as TotalPaid
FROM orders
GROUP BY CustomerID;

# Highest and Lowest Selling Products (NOT WORKING)
SELECT ProductID, SUM(Quantity) as QuantitySold
FROM orderdetails
GROUP BY ProductID
HAVING QuantitySold = MIN(QuantitySold) ;
#OR QuantitySold = MIN(QuantitySold) 
#ORDER BY QuantitySold DESC;
