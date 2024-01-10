create database test1;

use test1;
 
 create table Theatre (
 theatre_id int not null primary key,
 theater_name varchar (50)not null,
 address varchar(250) not null,
 rating float);
  
describe theatre;
 
 insert into theatre values 
 (1,'Inox','Pune',4.5), 
 (2,'PVR','Mumbai',4.7),
 (3,'CityPride','Chennai',3.5),
 (4,'MultiFlex','Nagpur',3.8); 
 
 select * from theatre;
 
 create table Movie (
 movie_id int primary key not null,
 movie_name varchar(100) not null,
 director varchar(100) not null,
 producer varchar (100) not null ); 
 
 insert into Movie values 
 (101, 'Uri','Aditya Dhar','Ronnie Screwala'),
 (102, 'Animal','Sandeep Reddy','Saurabh Gupta'),
 (103, '3 Idiots','Rajkumar Hirani', 'Vidhu Chopra'),
 (104, 'Jawan','Atlee','Gauri Khan'),
 (105, 'Tanhaji', 'Om Raut','Bhushan Kumar'),
 (106, 'Pushpa','Sukumar','naveen Yerneni'),
 (107,'Kantara','Rishab Shetty','Vijay Kiragandur'),
 (108,'Pk','Rajkumar Hirani','Vidhu Chopra'),
 (109,'Shershaah','Vishnuvardhan','Dharma Productions'),
 (110,'RRR','S.S. Rajamouli','D.V.V. Danayya');
 
 select * from movie;
 
create table ScreeningInfo (
movie_id int not null, constraint mkey foreign key (movie_id) references Movie(movie_id),
theatre_id int not null, constraint tkey foreign key (theatre_id) references Theatre(theatre_id),
ticket_price double not null);

alter table ScreeningInfo modify movie_id int not null unique,
modify theatre_id int not null unique;

desc ScreeningInfo;










