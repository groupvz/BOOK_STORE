CREATE database BOOK_STORE
GO 
Use BOOK_STORE
Go


CREATE TABLE [tblBook] (
    [BookID] INT PRIMARY KEY,
    [Title] TEXT NOT NULL,
    [Author] TEXT,
    [Price] float NOT NULL CHECK (Price > 0),
    [Quantity] INT NOT NULL CHECK (Quantity > 0)
   
);
CREATE TABLE [tblCategory] (
    [CategoryID] INT PRIMARY KEY IDENTITY,
    [Category] nvarchar(100) UNIQUE
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
	[Quantity] tinyint NOT NULL CHECK (Quantity > 0),
	[Updated] DATE NOT NULL,
	FOREIGN KEY (BookID) REFERENCES [tblBook](BookID)
);

CREATE TABLE [tblUser] (
	[UserID] INT PRIMARY KEY IDENTITY, 
	[FullName] nvarchar(50) NOT NULL,
	[BirthYear] smallint,
	[Country] nvarchar(50),
	[Username] nvarchar(50) UNIQUE,
    [Gmail] VARCHAR(255) NOT NULL UNIQUE,
	[Password] nvarchar(50) ,
    [Phone] VARCHAR(15) NOT NULL UNIQUE,
	Address NVARCHAR(255) NOT NULL
);
CREATE TABLE [tblOrder] (
	[OrderID] INT PRIMARY KEY IDENTITY, 
	[OrderDate]  datetime2(7)NOT NULL, 
	[UserID] int , 
	FOREIGN KEY ([UserID]) REFERENCES [tblUser]([UserID])
);

CREATE TABLE [tblOrderDetail] (
	[OrderdetailId] INT PRIMARY KEY IDENTITY,
	[OrderID] INT,
	[BookID] INT , 
	[Quantity] tinyint NOT NULL CHECK (Quantity > 0),
	FOREIGN KEY ([OrderID]) REFERENCES [tblOrder]([OrderID]),
	FOREIGN KEY ([BookID]) REFERENCES [tblBook](BookID)
);
CREATE TABLE [tblOrderStatus](
	[StatusID] INT PRIMARY KEY IDENTITY,
	[OrderID] INT ,
	[StatusDescription] nvarchar(20),
	FOREIGN KEY ([OrderID]) REFERENCES [tblOrder]([OrderID])
);
CREATE TABLE [tblPayment] (
	[PaymentID] INT PRIMARY KEY,
	[OrderID] INT,
	[PaymentMethod] nvarchar(20) ,
	[PaymentStatus] nvarchar(20) ,
	FOREIGN KEY ([OrderID]) REFERENCES [tblOrder]([OrderID])
);
