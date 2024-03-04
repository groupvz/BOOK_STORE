# BSMS (Bookstore management system)

## Technologies used:
	- SQL Sever Management Studio 19
    - Pandas
    
## Data Dictionary
### Book
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| BookID| INT  | PRIMARY KEY                | ID number of a book in the store      |
| Title     | TEXT | NOT NULL                   | Title of a book |
| AuthorID| INT  | FOREIGN KEY to table AUTHOR('AuthorID')              | ID number of the author of the book      |
| Price     | DECIMAL(8,2) |                   | pre-tax cost of a book(USD) |
| QuantityInStock     | INT(5) |        > 0           | Inventory number  |

### BookCategoryMapping
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| ID| INT(7)  | PRIMARY KEY                | the unique id of the book's category (sometimes a book has more than one category)     |
| BookID| INT  | FOREIGN KEY to table Book('BookID')              |      |
| CategoryID| TINYINT  | FOREIGN KEY to table Category('CategoryID')      

### Category
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| CategoryID 	| TINYINT	|PRIMARY KEY	| A unique id of category	|
| CategoryName	| TEXT		|             |Name of a category	|

### User
| Field name | Data type          | Constraint                   | Description             |
|----------------|---------------|-----------------------------|-----------------------------|
| UserID   | INT | PRIMARY KEY                 | ID number of a client      |
| Username | Text    | NOT NULL                    | Username of the user       |
| Password | Text    | NOT NULL                    | Password of the user (encrypted) |
| Full name | Text   | NOT NULL                    | Full name of the user      |
| Email    | Text    |                     | Email address of the user  |
| Phone    | Text    |                     | Telephone number of the user |


	
