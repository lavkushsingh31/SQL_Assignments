use planetarygoods;

# Assignment 1 solution
SELECT CONCAT(C.FirstName, " ", C.LastName) as CustomerName, O.OrderDate, P.ProductName, SUM(OD.FinalTotal) as Total
from customers C
INNER JOIN orders O USING (CustomerID)
INNER JOIN orderdetails OD USING (OrderID)
INNER JOIN products P USING (ProductID)
GROUP BY CustomerName, OrderDate,  ProductName;


# Assignment 2 solution
SELECT 
	CONCAT(C.FirstName, " ", C.LastName) as CustomerName, 
    P.ProductName, 
    S.SupplierName, 
    SUM(OD.FinalTotal) as TotalAmount
FROM customers C
INNER JOIN orders O USING (CustomerID)
INNER JOIN orderdetails OD USING (OrderID)
INNER JOIN products P USING (ProductID)
INNER JOIN suppliers S USING (SupplierID)
GROUP BY CustomerName,  ProductName, SupplierName;

