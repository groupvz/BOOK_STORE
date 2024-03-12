-- Create view to show sold books
CREATE VIEW v_soldBook AS(
SELECT b.BookID, CONVERT(VARCHAR(MAX), b.Title) AS bookTitle, SUM(od.Quantity) AS soldBook FROM tblOrderDetail od
INNER JOIN tblBook b ON od.BookID = b.BookID
INNER JOIN tblOrder o ON od.OrderID = o.OrderID
INNER JOIN tblOrderStatus os ON o.OrderID = os.OrderID
WHERE os.StatusDescription = 'Delivered'
GROUP BY b.BookID, CONVERT(VARCHAR(MAX), b.Title));

SELECT SUM(soldBook) AS totalSoldBook FROM v_soldBook

SELECT Top 10* FROM v_soldBook
ORDER BY soldBook DESC;


-- Crate view that show the monthly sales report
CREATE VIEW MONTHLY_SALES_REPORT
AS
	SELECT MONTH(OrderDate) 'Month',SUM(od.Quantity*b.Price) 'Amount'
	FROM tblOrder o
	INNER JOIN tblOrderDetail od ON o.OrderID = od.OrderID
	INNER JOIN tblBook b ON od.BookID = b.BookID
	GROUP BY MONTH(OrderDate);


SELECT * FROM MONTHLY_SALES_REPORT;

-- Identify potential customers
CREATE VIEW Buyer AS
(SELECT u.UserID, u.FullName, SUM(od.Quantity) AS boughtBook FROM tblOrderDetail od
INNER JOIN tblOrder o ON od.OrderID = o.OrderID
INNER JOIN tblOrderStatus os ON o.OrderID = os.OrderID
INNER JOIN tblUser u ON o.UserID = u.UserID
WHERE os.StatusDescription = 'Delivered'
GROUP BY u.UserID, u.FullName);

SELECT COUNT(UserID) AS totalBuyer FROM Buyer

SELECT TOP 10* FROM Buyer
ORDER BY boughtBook DESC