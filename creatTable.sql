CREATE TABLE tblBook (
	BookID INT PRIMARY KEY,
	Title TEXT,
	Author TEXT,
	Price FLOAT,
	Quantity INT);


CREATE TABLE tblRestock (
	RestockID INT PRIMARY KEY,
	BookID INT FOREIGN KEY REFERENCES tblBook(BookID),
	Quantity INT,
	Updated DATE);

CREATE TABLE tblCategory (
	CategoryID INT PRIMARY KEY,
	Category NVARCHAR(100));

CREATE TABLE tblBookCategoryMapping (
	CMappingID INT PRIMARY KEY,
	BookID INT FOREIGN KEY REFERENCES tblBook(BookID),
	CategoryID INT FOREIGN KEY REFERENCES tblCategory(CategoryID));

CREATE TABLE tblUser (
	UserID INT PRIMARY KEY,
	FullName NVARCHAR(50),
	BirthYear SMALLINT,
	Country NVARCHAR(50),
	UserName NVARCHAR(50),
	Gmail NVARCHAR(50),
	[Password] NVARCHAR(50),
	Phone TEXT,
	[Address] NVARCHAR(100));

CREATE TABLE tblOrder (
	OrderID INT PRIMARY KEY,
	OderDate DATETIME2(7),
	UserID INT FOREIGN KEY REFERENCES tblUser(UserID));

CREATE TABLE tblOrderDetail (
	OrderDetailID INT PRIMARY KEY,
	OrderID INT FOREIGN KEY REFERENCES tblOrder(OrderID),
	BookID INT FOREIGN KEY REFERENCES tblBook(BookID),
	Quantity TINYINT);

CREATE TABLE tblOrderStatus (
    StatusID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES tblOrder(OrderID),
    StatusDescription NVARCHAR(25) CHECK (StatusDecription IN ('Cancelled', 'Delivered', 'Processing')));

CREATE TABLE tblPayment (
	PaymentID INT PRIMARY KEY,
	OrderID INT FOREIGN KEY REFERENCES tblOrder(OrderID),
	PaymentMethod NVARCHAR(20),
	PaymentStatus NVARCHAR(25) CHECK (PaymentStatus IN ('Completed', 'Pending')));