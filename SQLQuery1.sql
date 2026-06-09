--Andmebaasi, tabelite loomine ning andmete sisestamine
create database School
use school

--Teacher table
create table Teacher
(
TeacherID int primary key,
Name nvarchar(50),
Teaching_Subject nvarchar(50),
Email nvarchar(100)
)

insert into Teacher values
(1, 'Peeter Kask', 'Math', 'P@K.com'),
(2, 'Mari Mänd', 'PE', 'M@M.com'),
(3, 'Kadri Tamm', 'Arts', 'K@T.com'),
(4, 'Albert Kask', 'English', 'A@K.com'),
(5, 'Mart Juurikas', 'IT', 'M@J.com')

select * from Teacher


--Class table
create table Class
(
ClassID int primary key,
Class_nr nvarchar(10),
Room_nr nvarchar(10)
)

insert into Class values
(1, '7A', 'A101'),
(2, '8B', 'B202'),
(3, '7B', 'A107'),
(4, '9A', 'C100'),
(5, '6B', 'A222')

select * from Class


--ClassTeacher table
create table ClassTeacher
(
ClassTeacherID int primary key,
TeacherID int foreign key references Teacher(TeacherID),
ClassID int foreign key references Class(ClassID)
)

insert into ClassTeacher values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5)

select * from ClassTeacher


--Student table
create table Student
(
StudentID int primary key,
Name nvarchar(50),
Id_code nvarchar(50),
Email nvarchar(50),
ClassID int foreign key references Class(ClassID)
)

insert into Student(StudentID, Name, Id_code, Email) values
(1, 'Peeter Pets', '543564573', 'P@P.com'),
(2, 'Meeter Sent', '678467868', 'M@S.com'),
(3, 'Auto Ratas', '4234324523', 'A@R.com'),
(4, 'Oskar Luts', '67635464', 'O@L.com'),
(5, 'Sass Lass', '789078976', 'S@L.com')

select * from Student


--subject table
create table Subject
(
SubjectID int primary key,
Subject_Name nvarchar(50),
Description nvarchar(500)
)

insert into Subject values
(1, 'Math', 'Math is math'),
(2, 'English', 'English is english'),
(3, 'PE', 'PE is PE'),
(4, 'IT', 'IT is IT'),
(5, 'Estonian', 'Estonian is estonian')

select * from Subject


--Grade table
create table Grade
(
GradeID int primary key,
Date DATE,
GradeValue int,
StudentID int foreign key references Student(StudentID),
TeacherID int foreign key references Teacher(TeacherID),
SubjectID int foreign key references Subject(SubjectID)
)

insert into Grade values
(1, '01.01.2026', 3, 1, 1, 1),
(2, '03.05.2023', 4, 2, 2, 2),
(3, '05.05.2025', 5, 3, 3, 3),
(4, '04.09.2025', 3, 4, 4 ,4),
(5, '08.08.2020', 5, 5, 5, 5)

select * from Grade


--stored procedure
create procedure sp_GetTeacherEmail
as begin
	select Name, Email from Teacher
end

sp_GetTeacherEmail


--1. join
select Class_nr, Room_nr, Name
from Class
left join Student
on Class.ClassID = Student.ClassID


--2. join
select Name, Date, GradeValue
from Student
left join Grade
on Student.StudentID = Grade.StudentID


--3. join
select Subject_Name, GradeValue
from Subject
left join Grade
on Subject.SubjectID = Grade.SubjectID