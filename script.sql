CREATE DATABASE ASGMT01;
GO;

USE ASGMT01;
GO;

CREATE TABLE BookCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(255)
);
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    Author_name NVARCHAR(100)
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(255),
    AuthorID INT,
    Price DECIMAL(10, 2),
    OtherDetails NVARCHAR(MAX),
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
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY,
    Last_name VARCHAR(100),
    First_name VARCHAR(100),
    Phone VARCHAR(20) UNIQUE,
    Email VARCHAR(255) UNIQUE,
    Address NVARCHAR(255)
);
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Last_name VARCHAR(100),
    First_name VARCHAR(100),
    DateOfBirth DATE,
    Password VARCHAR(255),
    Phone VARCHAR(20)
);
