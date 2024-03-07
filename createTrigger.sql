
-- Create trigger update book quantity
CREATE TRIGGER trgUpdateBookQuantity
ON tblRestock
AFTER INSERT
AS
BEGIN
    UPDATE b
    SET b.Quantity = b.Quantity + i.Quantity
    FROM tblBook b
    INNER JOIN inserted i ON b.BookID = i.BookID;
END;


-- Create trigger update book quantity through order status
CREATE TRIGGER trgUpdateBookQuantityOrder
ON tblOrderStatus
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(StatusDescription)
    BEGIN
        UPDATE b
        SET b.Quantity = b.Quantity - od.Quantity
        FROM tblBook AS b
        INNER JOIN tblOrderDetail od ON b.BookID = od.BookID
        INNER JOIN inserted i ON i.OrderID = od.OrderID
        INNER JOIN deleted d ON i.OrderID = d.OrderID
        WHERE i.StatusDescription = 'Delivered' AND d.StatusDescription != 'Delivered';
    END
END;

-- update status description through payment status
CREATE TRIGGER trgUpdateOrderStatus
ON tblPayment
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE tblOrderStatus
    SET StatusDescription = 'Processing'
    WHERE OrderID = (SELECT i.OrderID FROM inserted i WHERE i.PaymentStatus = 'Completed');
END;



