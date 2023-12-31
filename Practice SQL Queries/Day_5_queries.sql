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
GROUP BY FullName, ProductName;

SELECT P.ProductID, P.ProductName, SUM(OD.FinalTotal) AS TotalAmount
FROM products P
INNER JOIN orderdetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName;

SELECT P.ProductID, P.ProductName, Coalesce(SUM(O.Quantity),0) AS TotalQuantity
FROM products P
LEFT JOIN orderdetails O
ON P.ProductID = O.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantity DESC;


# Instead of "ON", one can use "USING" Keyword, if the common column name is same in both the tables
SELECT P.ProductID, P.ProductName, Coalesce(SUM(O.Quantity),0) AS TotalQuantity
FROM products P
LEFT JOIN orderdetails O
USING (ProductID)
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantity DESC;

# self join
SELECT A.ProductName, B.ProductName, A.Price
FROM products A
JOIN products B
ON A.ProductID <> B.ProductID AND A.Price = B.Price;


SELECT LEFT("Lavkush", 3);

SELECT A.ProductName, B.ProductName
FROM products A
INNER JOIN products B
ON A.ProductID <> B.ProductID AND LEFT(A.ProductName, 5) = LEFT(B.ProductName, 5)
ORDER BY A.ProductName, B.ProductName;




