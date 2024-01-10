/*Consider following table available in Hospital database -
Table Patient – pid int (primary key), pName varchar(25),age int, 
 weight float, email varchar(25), admitiondate date */
 
create database hospital;
use hospital;

create table Patient(
p_id int primary key,
p_Name varchar(25),
age int,
weight float,
email varchar(30),
admit_date date );

insert into patient values
(1,'Aadarsh',24,67,'adr@gmail','2023-12-18'),
(2,'Pavan',32,59.23,'pavan@gmail','2023-11-28'),
(3,'Utkarsha',29,45,'utr@gmail','2023-11-25'),
(4,'Snehal',28,66,'snehal@gmail','2023-12-10'),
(5,'Ishwar',39,78,'ish@gmail','2023-12-1'),
(6,'Suraj',18,52,'suraj@gmail','2023-11-21'),
(7,'Shubhangi',14,67,'shubh@gmail','2023-10-31'),
(8,'Sudarshan',24,70,'sudr@gmail','2023-11-15'),
(9,'Prashant',31,82,'pra@gmail','2023-12-19'),
(10,'Yogesh',40,79,'yog@gmail','2023-12-18');

select * from patient;

/*Table Doctor – docid int(primary key),docName varchar(25) , 
 Speciality varchar(20)*/
 
 create table Doctor(
 doc_id int primary key,
 doc_name varchar(50),
 Speciality varchar(30));
 
 insert into doctor values 
(101,'Rakesh','dentist'),
(102,'Ruturaj','Cardiologist'),
(103,'Sunil','psychiatrist'),
(104,'Kiran','audiologist'),
(105,'Ajit','orthopedic surgeon'),
(106,'Mahendra','Allergist'),
(107,'Vaibhav','neurologist');

select * from doctor;