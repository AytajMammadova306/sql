CREATE DATABASE Task2 
USE Task2



CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25)NOT NULL,
Price FLOAT NOT NULL CHECK(Price>0), 
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


INSERT INTO Categories (Name) VALUES
('Electronics'),
('Clothing'),
('Books')


INSERT INTO Colors(Name) VALUES
('Red'),
('Black'),
('Blue'),
('Yellow')



INSERT INTO Products(Name,Price,Cost,[Product's Category]) VALUES
('Tv',800,500,1),
('T-Shirt',50,90,2),
(N'Əli və Nino',4,10,3)


INSERT INTO ProductColor (ProductId,ColorId) VALUES
(1,2),
(2,3),
(2,4),
(3,NUll)

SELECT p.Id, p.Name, Price, Cost, c.Name AS Color, ct.Name AS Category FROM Products as p
JOIN ProductColor as pc
ON pc.ProductId=p.Id
LEFT JOIN Colors as c
ON c.id=pc.ColorId
JOIN Categories as ct
ON ct.Id=p.[Product's Category]

















CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY,
Username VARCHAR(35) NOT NULL,
[Password] CHAR(10) NOT NULL,
[RoleId] INT FOREIGN KEY REFERENCES Roles(Id)
)

CREATE TABLE Roles(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(40)
)

INSERT INTO Roles (Name) Values
('Admin'),
('CEO'),
('Basic Worker')

INSERT INTO Users (Username,Password,RoleId) VALUES 
('Someone','123457asd',1),
('Someone2','123457as3',3),
('Someone3','123457as2',3),
('Someone4','123457as1',2)

SELECT u.Id, Username, Password, r.Name FROM Users AS u
LEFT JOIN Roles AS r
ON r.Id=u.RoleId
