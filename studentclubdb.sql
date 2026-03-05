-- Create Database
CREATE DATABASE StudentClubDB;
USE StudentClubDB;

-- Create Table
CREATE TABLE StudentClub (
    StudentID INT,
    StudentName VARCHAR(50),
    Email VARCHAR(100),
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(20),
    ClubMentor VARCHAR(50),
    JoinDate DATE
);

-- Insert Data
INSERT INTO StudentClub 
(StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');

-- First Normal Form(1NF)

DROP TABLE IF EXISTS StudentClub;
CREATE TABLE StudentClub (
    StudentID INT NOT NULL,
    StudentName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    ClubName VARCHAR(50) NOT NULL,
    ClubRoom VARCHAR(20),
    ClubMentor VARCHAR(50),
    JoinDate DATE,
    -- Defining a Composite Primary Key for 1NF
    PRIMARY KEY (StudentID, ClubName)
);

INSERT INTO StudentClub 
(StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');

-- Secod normal forn(2NF)

USE StudentClubDB;
DROP TABLE IF EXISTS Membership;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Club;

-- 2. Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(100)
);

-- 3. Create Club Table
CREATE TABLE Club (
    ClubName VARCHAR(50) PRIMARY KEY,
    ClubRoom VARCHAR(20),
    ClubMentor VARCHAR(50)
);

-- 4. Create Membership Table 
CREATE TABLE Membership (
    StudentID INT,
    ClubName VARCHAR(50),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubName)
);

-- 5. Insert Data into Student
INSERT INTO Student (StudentID, StudentName, Email) VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

-- 6. Insert Data into Club
INSERT INTO Club (ClubName, ClubRoom, ClubMentor) VALUES
('Music Club', 'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club', 'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- 7. Insert Data into Membership
INSERT INTO Membership (StudentID, ClubName, JoinDate) VALUES
(1, 'Music Club', '2024-01-10'),
(2, 'Sports Club', '2024-01-12'),
(1, 'Sports Club', '2024-01-15'),
(3, 'Music Club', '2024-01-20'),
(4, 'Drama Club', '2024-01-18'),
(5, 'Music Club', '2024-01-22'),
(2, 'Drama Club', '2024-01-25'),
(6, 'Sports Club', '2024-01-27'),
(3, 'Coding Club', '2024-01-28'),
(7, 'Coding Club', '2024-01-30');

-- Third normal form(3NF)

USE StudentClubDB;
DROP TABLE IF EXISTS Membership;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Club;

-- 1. Student Table (3NF)
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(100)
);

-- 2. Club Table 
CREATE TABLE Club (
    ClubID INT PRIMARY KEY AUTO_INCREMENT,
    ClubName VARCHAR(50) UNIQUE,
    ClubRoom VARCHAR(20),
    ClubMentor VARCHAR(50)
);

-- 3. Membership Table 
CREATE TABLE Membership (
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

-- Insert Data into Student
INSERT INTO Student (StudentID, StudentName, Email) VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

-- Insert Data into Club 
INSERT INTO Club (ClubName, ClubRoom, ClubMentor) VALUES
('Music Club', 'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club', 'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- Insert Data into Membership 
INSERT INTO Membership (StudentID, ClubID, JoinDate) VALUES
(1, 1, '2024-01-10'), -- Asha, Music
(2, 2, '2024-01-12'), -- Bikash, Sports
(1, 2, '2024-01-15'), -- Asha, Sports
(3, 1, '2024-01-20'), -- Nisha, Music
(4, 3, '2024-01-18'), -- Rohan, Drama
(5, 1, '2024-01-22'), -- Suman, Music
(2, 3, '2024-01-25'), -- Bikash, Drama
(6, 2, '2024-01-27'), -- Pooja, Sports
(3, 4, '2024-01-28'), -- Nisha, Coding
(7, 4, '2024-01-30'); -- Aman, Coding

Use studentclubdb;
INSERT INTO student (StudentID, StudentName, Email) 
VALUES (8, 'Reejan', 'Reejan@email.com');

Use studentclubdb;
INSERT INTO Club (ClubName, ClubRoom, ClubMentor) 
VALUES ('Dance Club', 'Lab2', 'Ms. Gita');

SELECT * FROM Student;

SELECT * FROM Club;

SELECT 
    s.StudentName, 
    c.ClubName, 
    m.JoinDate
FROM Membership m
JOIN Student s ON m.StudentID = s.StudentID
JOIN Club c ON m.ClubID = c.ClubID;


SELECT 
    Student.StudentName, 
    Club.ClubName, 
    Membership.JoinDate
FROM Membership
JOIN Student ON Membership.StudentID = Student.StudentID
JOIN Club ON Membership.ClubID = Club.ClubID;
