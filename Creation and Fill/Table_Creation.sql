create database Project_Test

use Project_Test;

--------------------------------------------------Table Creation-------------------------------------------

CREATE TABLE Students(
Std_ID int PRIMARY KEY,
Fname varchar(50) NOT NULL,
Lname varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
Password varchar(100) NOT NULL,
Phone varchar(50) UNIQUE NOT NULL,
Address varchar(100) NOT NULL,
D_Birth varchar(50) NOT NULL,
Gender varchar(50) NOT NULL,
Faculty varchar(50) NOT NULL,
Graduation_Year varchar(50) NOT NULL,
StartDate varchar(50) NOT NULL,
ITI_Graduation_Date varchar(50),
Dept_ID varchar(50) NOT NULL,
Ins_ID varchar(50) NOT NULL,
Constraint Phone_check check (len(Phone) = 11),
Constraint pass_check check (len(Password) >= 8),
Constraint Gnder_check check (Gender in ('Male' , 'Female'))
)

go
	
CREATE TABLE Instructor(
Ins_ID varchar(50) PRIMARY KEY,
Fname varchar(50) NOT NULL,
Lname varchar(50) NOT NULL,
Gender varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
Password varchar(100) NOT NULL,
Phone varchar(50) UNIQUE NOT NULL,
Branch varchar(50) NOT NULL,
Address varchar(100) NOT NULL,
D_Birth varchar(50) NOT NULL,
Dept_ID varchar(50) NOT NULL,
Hire_date varchar(50) NOT NULL,
Hours int,
Constraint Phone_Ins_check check (len(Phone) = 11),
constraint email_check check (Email like '%@iti.com'),
Constraint Ins_pass_check check (len(Password) > 8),
Constraint Ins_Gender_check check (Gender in ('Male' , 'Female'))
)

go

CREATE TABLE Department(
Dept_Id varchar(50) PRIMARY KEY,
Dept_Name varchar(100) NOT NULL,
branch varchar(50) NOT NULL,
Manager_ID varchar(50) NOT NULL
)

go

CREATE TABLE Course(
Crs_Id varchar(50) PRIMARY KEY,
Crs_Name varchar(50) UNIQUE NOT NULL,
Duration int NOT NULL,
Type varchar(50) NOT NULL,
Topic_ID int NOT NULL,
Constraint Type_check check (Type in ('Technical' , 'Soft'))
)

go

CREATE TABLE Question(
Q_Id varchar(50) PRIMARY KEY,
Question varchar(250) UNIQUE NOT NULL,
Correct_Answer varchar(200) NOT NULL,
Type varchar(50) NOT NULL,
Crs_ID varchar(50) NOT NULL,
Grade int NOT NULL,
constraint Type_Q_Check check (Type in ('MCQ','TF'))
)

go

CREATE TABLE Exam(
Ex_Id int PRIMARY KEY,
Crs_ID varchar(50) NOT NULL
)

CREATE TABLE Topic(
Topic_Id int PRIMARY KEY,
Topic_Name varchar(50) UNIQUE NOT NULL
)

go

CREATE TABLE Choices(
Q_Id varchar(50) NOT NULL,
Choice varchar(200) NOT NULL,
Constraint Q_choices_PK primary key(Q_Id,Choice)
)

go

CREATE TABLE Q_Exam(
Q_Id varchar(50) NOt NULL,
Ex_Id int NOt NULL,
Constraint Q_Exam_PK primary key(Q_Id,Ex_Id)
)

go

CREATE TABLE Std_Exam(
Std_ID int NOt NULL,
Ex_Id int NOt NULL,
Q_Id varchar(50) NOt NULL,
Answer varchar(200) NOt NULL,
Q_Grade int NOT NULL,
Constraint Std_Exam_PK primary key(Std_ID,Ex_Id,Q_Id)
)

go

CREATE TABLE Std_Crs(
Std_ID int NOt NULL,
Crs_Id varchar(50) NOt NULL,
Crs_Grade int,
Constraint Std_Crs_PK primary key(Std_ID,Crs_Id)
)

go

CREATE TABLE Ins_Crs(
Ins_ID varchar(50),
Crs_Id varchar(50),
Constraint Ins_Crs_PK primary key(Ins_ID,Crs_Id)
)

go

CREATE TABLE KPIS(
Std_ID int NOT NULL,
KPI_ID int NOT NULL,
Final_project varchar(50),
Freelance varchar(50),
Cert_Name varchar(100),
Cert_website varchar(50),
Cert_Duration int,
Constraint KPIS_PK primary key(Std_ID,KPI_ID),
Constraint Duration_check check (Cert_Duration >= 20),
Constraint project_check check (Final_project in ('Completed' , 'Incompleted')),
Constraint Freelance_check check (Freelance in ('Completed' , 'Incompleted'))
)

go







------------------------------------------------------FOREIGN KEYS------------------------------------------

-----Students----

alter table Students 
ADD FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
go
alter table Students 
ADD FOREIGN KEY (Ins_ID) REFERENCES Instructor(Ins_ID)
go

-----Instructor----

alter table Instructor 
ADD FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
go
alter table Department 
ADD FOREIGN KEY (Manager_ID) REFERENCES Instructor(Ins_ID)
go

-----Course----

alter table Course 
ADD FOREIGN KEY (Topic_ID) REFERENCES Topic(Topic_ID)
go

-----Question----

alter table Question 
ADD FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID)
go

-----Exam----

alter table Exam 
ADD FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID)
go

-----Choices----

alter table Choices 
ADD FOREIGN KEY (Q_Id) REFERENCES Question(Q_Id)
go

-----Q_Exam----

alter table Q_Exam 
ADD FOREIGN KEY (Q_Id) REFERENCES Question(Q_Id)
go
alter table Q_Exam 
ADD FOREIGN KEY (Ex_Id) REFERENCES Exam(Ex_Id)
go

-----Std_Exam----

alter table Std_Exam 
ADD FOREIGN KEY (Q_Id) REFERENCES Question(Q_Id)
go
alter table Std_Exam 
ADD FOREIGN KEY (Ex_Id) REFERENCES Exam(Ex_Id)
go
alter table Std_Exam 
ADD FOREIGN KEY (Std_ID) REFERENCES Students(Std_ID)
go

-----Std_Crs----

alter table Std_Crs 
ADD FOREIGN KEY (Crs_Id) REFERENCES Course(Crs_Id)
go
alter table Std_Crs 
ADD FOREIGN KEY (Std_ID) REFERENCES Students(Std_ID)
go

-----Ins_Crs----

alter table Ins_Crs 
ADD FOREIGN KEY (Crs_Id) REFERENCES Course(Crs_Id)
go
alter table Ins_Crs 
ADD FOREIGN KEY (Ins_ID) REFERENCES Instructor(Ins_ID)

-----KPIS----

alter table KPIS 
ADD FOREIGN KEY (Std_ID) REFERENCES Students(Std_ID)
go