CREATE DATABASE Task3
USE Task3

CREATE TABLE Genders(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR (6) NOT NULL,
)

INSERT INTO Genders(Name) VALUES
('Woman'),
('Man')


CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50)NOT NULL,
Surname VARCHAR(50)NOT NULL,
Username VARCHAR(255) CHECK(LEN(Username)>8) NOT NULL UNIQUE,
Password VARCHAR(255) CHECK (LEN(Password)>8)NOT NULL,
Gender INT FOREIGN KEY REFERENCES Genders(Id) NOT NULL
)

INSERT INTO Users (Name, Surname, Username,Password,Gender) VALUES
('Test','Testov','Test12340','password1',1),
('Test','Testov','Test12341','password2',2)


CREATE TABLE Artists (
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50)NOT NULL,
Surname VARCHAR(50)NOT NULL,
Birthday DATE NOT NULL,
Gender INT FOREIGN KEY REFERENCES Genders(Id)
)

INSERT INTO Artists (Name,Surname,Birthday,Gender) VALUES
('someone','somebody','2007-04-27',1),
('someone2','somebody2','1979-09-20',1)


CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50)NOT NULL UNIQUE,
)

INSERT INTO Categories (Name) VALUES
('RnB'),
('hiphop'),
('retro')

CREATE TABLE Music(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50)NOT NULL UNIQUE,
Duration INT NOT NULL CHECK (Duration>0),
Category INT FOREIGN KEY REFERENCES Categories(Id),
Artist INT FOREIGN KEY REFERENCES Artists(Id)
)

INSERT INTO Music (Name, Duration,Category,Artist) VALUES
('music2',140,1,1),
('music3',200,2,1),
('music1',90,3,2)



CREATE TABLE Playlist (
MusicId INT FOREIGN KEY REFERENCES Music(Id), 
UserId INT FOREIGN KEY REFERENCES  Users(Id)
)



INSERT INTO Playlist (MusicId, UserId)
VALUES
(1,2),
(2,2),
(1,1),
(3,1)

CREATE VIEW About_Music AS
SELECT m.Name, m.Duration, m.Category, a.Name AS [Artist Name]
FROM Music as m
JOIN Artists as a
ON a.Id=m.Artist

CREATE PROCEDURE usp_GetById @userid INT AS
SELECT m.Name
FROM Music as m
JOIN Playlist as p
ON p.MusicId=m.Id
WHERE p.UserId=@userid

EXEC usp_GetById 1

SELECT * FROM About_Music


CREATE PROCEDURE usp_CreateMusic @name VARCHAR(50) , 
@duration INT , 
@category INT , 
@artistId INT
AS
INSERT INTO Music (Name, Duration,Category,Artist) VALUES
(@name,@duration,@category,@artistId)

EXEC usp_CreateMusic 'music10',270,2,2


CREATE PROCEDURE usp_CreateUser @name VARCHAR(50), 
@surname VARCHAR(50), 
@username VARCHAR(255), 
@password VARCHAR(255), 
@gender INT
AS
SET @name=dbo.Capitalized(@name)
SET @surname=dbo.Capitalized(@surname)
INSERT INTO Users(Name,Surname,Username,Password,Gender) 
VALUES(@name,@surname,@username,@password,@gender)


CREATE FUNCTION Capitalized (@word VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
SET @word=UPPER(LEFT(@word,1))+LOWER(SUBSTRING(@word,2,LEN(@word)-1))
RETURN @word
END


CREATE PROCEDURE usp_CreateCategory @name VARCHAR(50)
AS 
INSERT INTO Categories (Name) VALUES(@name)

EXEC usp_CreateCategory jazz
EXEC usp_CreateMusic 'music15', 300,4,2
EXEC usp_CreateUser 'someone44','someoneova','4444smonva','123459870',1

select * from Categories
select * from Artists
select * from Users
select * from Music
select * from Playlist

CREATE FUNCTION GetCountById (@id INT)
RETURNS INT
AS

BEGIN
DECLARE @count INT
SELECT @count= COUNT(MusicId) FROM Playlist as p
WHERE @id=p.UserId

RETURN @count

END

SELECT dbo.GetCountById (2) as [Music Count]


CREATE VIEW Durations
AS
SELECT Duration FROM Music

SELECT * FROM Durations


CREATE VIEW GetMostActive
AS
SELECT COUNT(m.Id) AS [Music Count], a.Name FROM Music as m
JOIN Artists as a
ON a.id=Artist
GROUP BY a.Name, a.Id
HAVING COUNT(m.Id)=(SELECT MAX(songcount)FROM 
(SELECT(COUNT(Id)) AS songcount FROM Music 
GROUP BY Artist) 
)

SELECT * FROM GetMostActive


