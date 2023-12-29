USE planetarygoods;

/*
INNER JOIN

SELECT COLUMN_NAMES
FROM  TABLE1
INNER JOIN TABLE2
ON TABLE1.COLUMN_NAME = TABLE2.COLUMN_NAME;

*/

SELECT FirstName, LastName, OrderID, ShippingStatus
FROM customers c
INNER JOIN orders o
ON c.CustomerID = o.CustomerID;

/* Inner join with multiple tables

FirstName, LastName 	-> customers
ProductName 			-> products
Quantity				-> orderdetails

tables to join - customers, orders, orderdetails, product
*/
SELECT 
	concat(FirstName, " " , LastName) as FullName,
    ProductName, SUM(Quantity) as TotalQuantity
FROM customers C
	INNER JOIN orders O ON C.CustomerID = O.CustomerID
    INNER JOIN orderdetails OD ON O.OrderID = OD.orderID
    INNER JOIN products P ON OD.ProductID = P.ProductID
GROUP BY FullName, ProductName






