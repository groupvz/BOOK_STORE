CREATE database BOOK_STORE
GO 
Use BOOK_STORE
Go


CREATE TABLE [tblBook] (
    [BookID] INT PRIMARY KEY,
    [Title] TEXT NOT NULL,
    [Author] TEXT,
    [Price] FLOAT NOT NULL CHECK (Price > 0),
    [Quantity] INT NOT NULL CHECK (Quantity > 0)
   
);
CREATE TABLE [tblCategory] (
    [CategoryID] INT PRIMARY KEY IDENTITY,
    [Category] NVARCHAR(100) UNIQUE
);
CREATE TABLE [tblBookCategoryMapping] (
	[CMappingID] INT PRIMARY KEY IDENTITY,
	[BookID] INT ,
	[CategoryID] INT,
	FOREIGN KEY ([BookID]) REFERENCES [tblBook]([BookID]),
	FOREIGN KEY ([CategoryID]) REFERENCES [tblCategory]([CategoryID])
);
CREATE TABLE [tblRestock] (
	[RestockID] INT PRIMARY KEY IDENTITY,
	[BookID] INT,
	[Quantity] TINYINT NOT NULL CHECK (Quantity > 0),
	[Updated] DATE NOT NULL,
	FOREIGN KEY (BookID) REFERENCES [tblBook](BookID)
);

CREATE TABLE [tblUser] (
	[UserID] INT PRIMARY KEY IDENTITY, 
	[FullName] NVARCHAR(50) NOT NULL,
	[BirthYear] SMALLINT,
	[Country] NVARCHAR(50),
	[Username] NVARCHAR(50) UNIQUE,
    [Gmail] VARCHAR(100) NOT NULL UNIQUE,
	[Password] NVARCHAR(50) ,
    [Phone] VARCHAR(15) NOT NULL UNIQUE,
	[Address] NVARCHAR(100) NOT NULL
);
CREATE TABLE [tblOrder] (
	[OrderID] INT PRIMARY KEY IDENTITY, 
	[OrderDate]  DATETIME2(7)NOT NULL, 
	[UserID] INT, 
	FOREIGN KEY ([UserID]) REFERENCES [tblUser]([UserID])
);

CREATE TABLE [tblOrderDetail] (
	[OrderdetailId] INT PRIMARY KEY IDENTITY,
	[OrderID] INT,
	[BookID] INT , 
	[Quantity] TINYINT NOT NULL CHECK (Quantity > 0),
	FOREIGN KEY ([OrderID]) REFERENCES [tblOrder]([OrderID]),
	FOREIGN KEY ([BookID]) REFERENCES [tblBook](BookID)
);
CREATE TABLE [tblOrderStatus](
	[StatusID] INT PRIMARY KEY IDENTITY,
	[OrderID] INT ,
	StatusDescription NVARCHAR(25) CHECK (StatusDescription IN ('Cancelled', 'Delivered', 'Processing')),
	FOREIGN KEY ([OrderID]) REFERENCES [tblOrder]([OrderID])
);

CREATE TABLE [tblPayment] (
	[PaymentID] INT PRIMARY KEY,
	[OrderID] INT,
	[PaymentMethod] nvarchar(20) ,
	[PaymentStatus] NVARCHAR(20) CHECK (PaymentStatus IN ('Completed', 'Pending')) ,
	FOREIGN KEY ([OrderID]) REFERENCES [tblOrder]([OrderID])
);
