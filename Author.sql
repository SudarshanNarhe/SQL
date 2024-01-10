create database Assignments;
use Assignments;
create table Author(
authorid int auto_increment primary key,
authorname varchar(100) not null,
phoneNo varchar (15) not null unique,
email varchar (30) not null unique,
address varchar(200) not null,
city varchar(50) not null);

insert into Author (authorname, phoneNo, email, address, city) values ("Sane Guruji","9834637383","guruji@gmail.com","Maharashtra","Nagpur");
insert into Author (authorname, phoneNo, email, address, city) values ("A.P.J. Kalam","9857467382","kalam@gmail.com","Tamil Nadu", "TiruAanatPuram");
insert into Author (authorname, phoneNo, email, address, city) values ("Chetan Bhagat","7976463728","bagat@gmail.com","Maharashtra","Mumbai");
insert into Author (authorname, phoneNo, email, address, city) values ("Shivaji Savant","3879844930","savant@gmail.com","Maharashtra","Pune");

desc Author;

select * from assignments.Author;