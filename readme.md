# Overview 

- Project of DBI202:
  - Topic: Bookstore management system
  - Describe: Management for a book-selling website
 
- Members:
  - [Lê Quốc Chính](https://github.com/armytle)-QE170250
  - [Nguyễn Hoàng Việt](https://github.com/sinhvienfpt)-QE180058
  - [Quảng Thành Đô](https://github.com/dolami2876)-QE180117
  - [Huỳnh Hữu Hiếu](https://github.com/hieuxinloi)-QE180067
  - [Nguyễn Tấn Thắng](https://github.com/thangthewinner)-QE180019
   
- Technologies used:
  - Language: Python (Pandas)
  - Database: SQL Server
   
- Source code: https://github.com/groupvz/BOOK_STORE

# 1. Problem Statement:
- In the modern age of technology, the Internet has played a significant role in people's lives. It has greatly improved the quality of life and standards of living for many individuals. The Internet has expanded into various fields and levels. E-commerce is one of the sectors that has emerged in recent years. Online bookstores have helped many book lovers by making it easy for them to purchase books online. Sometimes it is not convenient to visit a traditional bookstore, as it is limited by operating hours, the availability of a specific book, its location, and most importantly, the necessary space to store many books. Such limitations have led to the development of e-commerce industries related to bookstores. Our project is to create a database for a simple e-commerce website, containing various types of books so that consumers can shop online.

# 2. System Business Description:
## 2.1. Book Management:
- Add books:
	+ Administrators have the right to add information about new books to the system.
	+ Required information includes book title, author, price, inventory quantity, and other details.
- Edit books:
	+ Administrators have the right to edit information about books.
	+ Update information such as book title, author, price, inventory quantity, and other details.
- Delete books:  Administrators can delete book information from the system.
- Update quantity: The system will update the quantity of books remaining in stock.
  
## 2.2. Book Category Management:
- Create book categories:
	+ Administrators have the right to create new book categories.
	+ Each category has a name to describe its content.
- Manage book categories:
	+ Administrators have the ability to add or delete books from categories.
	+ Users can search for books based on categories for easy browsing and selection.

## 2.3. Customer Management:
- Manage personal information:
	+ The system will update basic customer information when customers fill out information in the purchase form.
	+ For convenience in contacting to confirm orders and identify returning customers.
- Registration:
	+ Customers can register an account on the website.
	+ Required information includes username, password, first and last name, email, address, and phone number.
- Login: Users can log in with their username and password.
  
## 2.4. Order Processing:
- Receive orders:
    + The system receives orders from users after they have selected books and proceeded to payment.
    + Record information about the order, the products ordered, and customer contact information.

## 2.5. Order Status Management:
- Update order status:
    + Administrators can update the status of orders from "Processing" to "Shipped" and "Received."
    + The system automatically updates the status based on the order processing.

## 2.6. Payment:
- Payment processing:
    + The system processes payments for orders using online payment methods such as credit cards, e-wallets, or direct payments.
    + Record payment information and update the payment status of orders.

## 2.7. Statistical Reporting:
- Export daily, monthly, yearly reports:
	+ Revenue report.
	+ Report on the number of books sold.
	+ Report on the number of customers.
	+ Books with the highest sales.
	+ Top purchasing customers.

# 3. Plans, Tools:
## 3.1. Plan:
## 3.2. CASE Tools:
- IDE: Visual Studio

- Data sources: Kaggle 

- Code Repositories: Github

- Issues tracking: GitHub


# Data Dictionary
## Book
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| BookID| INT  | PRIMARY KEY                | ID number of a book in the store      |
| Title     | TEXT | NOT NULL                   | Title of a book |
| AuthorID| INT  | FOREIGN KEY to table AUTHOR('AuthorID')              | ID number of the author of the book      |
| Price     | DECIMAL(8,2) |                   | pre-tax cost of a book(USD) |
| QuantityInStock     | INT(5) |        > 0           | Inventory number  |

## BookCategoryMapping
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| ID| INT(7)  | PRIMARY KEY                | the unique id of the book's category (sometimes a book has more than one category)     |
| BookID| INT  | FOREIGN KEY to table Book('BookID')              |      |
| CategoryID| TINYINT  | FOREIGN KEY to table Category('CategoryID')      

## Category
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| CategoryID 	| TINYINT	|PRIMARY KEY	| A unique id of category	|
| CategoryName	| TEXT		|             |Name of a category	|

## User
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| UserID   | INT | PRIMARY KEY                 | ID number of a client      |
| Username | Text    | NOT NULL                    | Username of the user       |
| Password | Text    | NOT NULL                    | Password of the user (encrypted) |
| Full name | Text   | NOT NULL                    | Full name of the user      |
| Email    | Text    |                     | Email address of the user  |
| Phone    | Text    |                     | Telephone number of the user |

	
## Author
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| AuthorID 	| INT	|PRIMARY KEY	| A unique id of Author	|
| AuthorName	| NVARCHAR(100)		|             |Name of the Author	|

## Order
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| OrderID 	| INT	|PRIMARY KEY	| a unique ID that assigned to each order	|
| UserID	| INT		| 	FOREIGN KEY to table User('UserID')      |	|
| OrderDate	| DATETIME		| 	NOT NULL     |	|

## OrderDetail
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| OrderDetailID 	| INT	|PRIMARY KEY	| a unique ID that is assigned to each order detail	|
| OrderID	| INT		| 	FOREIGN KEY to table Order('OrderID')      |	|
| QuantityOrdered	| INT		| 	     | The quantity of product the user ordered	|
| Subtotal	| INT		| 	     | 	|

## OrderStatus
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| StatusID 	| INT	|PRIMARY KEY	| the unique id of the order status	|
| OrderID	| INT		| 	FOREIGN KEY to table Order('OrderID')      |	|
| QuantityOrdered	| INT		| 	     | The quantity of product the user ordered	|
| StatusDescription	| VARCHAR(50)		| 	     | 	Description of order status (Processing, Sent, Received)|

## Payment
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| PaymentID 	| INT	|PRIMARY KEY	| a unique ID that assigned to a payment	|
| OrderID	| INT		| 	FOREIGN KEY to table Order('OrderID')      |	|
| PaymentMethod	| VARCHAR(50)		|  NOT NULL	     | Buyer's payment method	|
| PaymentStatus	| BOOLEAN		| NOT NULL	     | 	Has the order been confirmed or not?|

