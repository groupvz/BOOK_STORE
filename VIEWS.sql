
--Crate view that show the monthly sales report
CREATE VIEW MONTHLY_SALES_REPORT
AS
	SELECT MONTH(OrderDate) 'Month',SUM(od.Quantity*b.Price) 'Amount'
	FROM tblOrder o
	INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID
	INNER JOIN tblBook b ON od.BookID = b.BookID
	GROUP BY MONTH(OrderDate);
GO

SELECT * FROM MONTHLY_SALES_REPORT;




