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


