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

