CREATE database BookStore
GO 
Use BookStore
Go

CREATE TABLE BookCategories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(255)
);

CREATE TABLE Author (
    AuthorID INT PRIMARY KEY IDENTITY,
    Author_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    AuthorID INT,
    Price DECIMAL(10, 2)NOT NULL,
    CategoryID INT,
    Introduce NVARCHAR(MAX),
    Publishinghouse NVARCHAR(255),
    Publisher NVARCHAR(255),
    Year INT,
    Size NVARCHAR(50),
    Weight DECIMAL(10, 2),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES BookCategories(CategoryID)
);

CREATE TABLE CustomerType (
	ID INT PRIMARY KEY IDENTITY, 
	Type NVARCHAR(100) NOT NULL
);

CREATE TABLE Customer (
	CustomerID INT PRIMARY KEY IDENTITY, 
	CustomerTypeID int ,
	FullName NVARCHAR(100) NOT NULL,
    Gender bit ,
    Phone VARCHAR(10) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
	Address NVARCHAR(255) NOT NULL,
	FOREIGN KEY (CustomerTypeID) REFERENCES CustomerType(ID)
);

CREATE TABLE Account (
	CustomerID int PRIMARY KEY ,
	Username   varchar(50)NOT NULL,
	Password   varchar(50) NULL
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Admin (
  AdminID INT PRIMARY KEY IDENTITY, 
  FullName NVARCHAR(100) NOT NULL, 
  Gender   bit NOT NULL, 
  Birthday date NULL, 
  Address  NVARCHAR(255) NULL, 
  Email    NVARCHAR(50) NOT NULL, 
  Phone    NVARCHAR(15) NOT NULL, 
  Username NVARCHAR(50) NOT NULL, 
  Password NVARCHAR(50) NULL, 
);

CREATE TABLE OrderInfo (
	OrderID INT PRIMARY KEY IDENTITY, 
	CustomerID int NOT NULL, 
	AdminID int NOT NULL, 
	OrderDate  date NOT NULL, 
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

CREATE TABLE OrderDetail (
	OrderDetailID INT PRIMARY KEY IDENTITY,
	OrderID INT NOT NULL,
	BookID INT NOT NULL, 
	Quantity INT NOT NULL,
	TransactionDate date NOT NULL, 
	Note NVARCHAR(255) NULL, 
	FOREIGN KEY (OrderID) REFERENCES OrderInfo(OrderID),
	FOREIGN KEY (OrderID) REFERENCES Book(BookID)
);
CREATE TABLE Order_Status(
	Status_ID INT PRIMARY KEY IDENTITY,
	Status_value NVARCHAR(15)
);
CREATE TABLE Orderhistory (
	HistoryID INT PRIMARY KEY IDENTITY, 
	OrderID INT UNIQUE NOT NULL,
	Status_ID INT NOT NULL,
	StatusDate date NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES OrderInfo(OrderID),
	FOREIGN KEY (Status_ID) REFERENCES Order_Status(Status_ID)
);


CREATE TABLE BookInventory (
    InventoryID INT PRIMARY KEY IDENTITY,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    UpDated datetime,
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);
