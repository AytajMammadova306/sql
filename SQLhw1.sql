CREATE DATABASE Task1
USE Task1
CREATE TABLE Students (
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25) NOT NULL,
Surname VARCHAR(25) DEFAULT 'XXX',
FinCode CHAR(7) UNIQUE NOT NULL,
Age INT CHECK (Age>=10),
AvgPoint FLOAT CHECK (AvgPoint>=0 AND AvgPoint<=100)
)

INSERT INTO Students
(Name,Surname,FinCode,Age,AvgPoint)
VALUES
('Test','Testov','7777www',18,100),
('Someone','Someoneov','www7777',18,10),
('Test2','Testov2','9999www',18,0),
('Someone2','Someoneov2','www9999',18,99)


DELETE FROM Students
WHERE AvgPoint=0

UPDATE Students SET AvgPoint=100
WHERE AvgPoint=99

INSERT INTO Students
(Name,Surname,FinCode,Age,AvgPoint)
VALUES
('AWWWWf','Testov2','9999FFF',18,61),
('AWWWWF','Someoneov2','FFF9999',18,80)

INSERT INTO Students
(Name,Surname,FinCode,Age,AvgPoint)
VALUES
('Student','studentli','9999XXX',18,78)

SELECT * FROM Students 
WHERE AvgPoint>51 AND AvgPoint<90

SELECT * FROM Students
WHERE Name LIKE ('A%f')

