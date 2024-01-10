create database Unique_demo;
use Unique_demo;
create table Supplier(
supid int auto_increment primary key,
 supname varchar(100) not null, 
 phoneNo varchar(15) not null unique, 
 address varchar (200) not null,
 constraint uadd unique (supname, address));
 
 insert into Supplier (supname, phoneNo,address) values("Pavan","403843947","Pune");
 insert into Supplier (supname, phoneNo, address) values ("Sudarshan","863648283","Mumbai");
 insert into Supplier (supname, phoneNo, address) values ("Utkarsha","865363674","Chennai");
 insert into Supplier (supname, phoneNo, address) values ("Pavan","864526747","Pune"); -- it will gives an error
 insert into Supplier (supname, phoneNo, address) values ("Pavan","864526747","Nagpur");
  insert into Supplier (supname, phoneNo, address) values (null,"8348691293","Pune"); -- the values should be not null
  
  Alter table Supplier modify address varchar(100); -- to modify 
  show create table Supplier;
  desc Supplier; -- to describe all the details of table
  
 SELECT * FROM unique_demo.supplier;