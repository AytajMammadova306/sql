CREATE DATABASE Task2 
USE Task2

CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25)NOT NULL,
Price FLOAT NOT NULL CHECK(Price>Cost),--because it is not logical to sell cheaper than it costs you to make it    
Cost FLOAT NOT NULL CHECK(Cost>0),
[Product's Category] INT FOREIGN KEY REFERENCES Categories(Id)
)

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL
)

CREATE TABLE Colors(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR (25) NOT NULL
)

CREATE TABLE ProductColor(
ProductId INT FOREIGN KEY REFERENCES Products(Id),
ColorId INT FOREIGN KEY REFERENCES Colors (Id)
)


INSERT INTO Categories (Name) VALUES(
('Electronics'),
('Clothing'),
('Books')
)

INSERT INTO Colors(Name) VALUES(
('Red'),
('Black'),
('Blue'),
('Yellow'),
)


INSERT INTO Products(Name,Price,Cost,[Product's Category]) VALUES
('Tv',800,500,1),
('T-Shirt',50,90,2),
(N'Əli və Nino',4,10,3)

INSERT INTO ProductColor (ProductId,ColorId) VALUES
(1,2),(2,3),(2,4),(3,NUll)

SELECT * FROM Products as p
JOIN ProductColor as pc
ON pc.ProductId=p.Id
JOIN Colors as c
ON c.id=pc.ColorId




