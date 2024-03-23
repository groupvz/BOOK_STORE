CREATE FUNCTION find_sales(@m INT,@y INT)
RETURNS TABLE
AS RETURN
(	SELECT MONTH(OrderDate) 'Month',YEAR(OrderDate) 'Year',SUM(od.Quantity*b.Price) 'Amount'
	FROM tblOrder o
	INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID
	INNER JOIN tblBook b ON od.BookID = b.BookID
	WHERE YEAR(OrderDate) = @y AND MONTH(OrderDate) = @m
	GROUP BY MONTH(OrderDate),YEAR(OrderDate)
)
;
-- DECLARE @m INT = 6
-- DECLARE @y INT = 2022
-- SELECT * FROM find_sales(@m,@y)
