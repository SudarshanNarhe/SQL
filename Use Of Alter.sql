create database Alter_demo;
use Alter_demo;
create table vehicle (
vehicleid int primary key,
year int not null,
make varchar(100) not null);

Alter table vehicle add model varchar(200); -- to add a single coloumn 
Alter table vehicle 
add color varchar(20), -- add multiple coloumns
add note varchar(300);

Alter table vehicle modify model varchar (200) not null; -- modify single coloumn
Alter table vehicle 
modify year int , -- modify multiple coloumns
modify color varchar(30) not null;

Alter table vehicle change note vehicleCondition varchar(350) not null;  -- rename particular coloumn name

Alter table vehicle rename to Cars; -- remane table name

desc Cars;
select * from Alter_demo.Cars;