CREATE DATABASE Task3
USE Task3

CREATE TABLE Genders(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR (6) NOT NULL,
)

INSERT INTO Genders(Name) VALUES
('Woman'),
('Man')

--not executed 
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
('someone','somebody',27-04-2007,1),
('someone2','somebody2',20-09-1979,1)


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
MusicId FOREIGN KEY REFERENCES Music(Id), 
UserId FOREIGN KEY REFERENCES  Users(Id)
)

