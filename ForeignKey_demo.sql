use fk_demo;
create table Category(catID int auto_increment primary key, catName varchar(100) not null);
insert into Category (catName) values("SmartPhone");
insert into category (catName) values("SmartWatch");


create table Product (
prdID int auto_increment primary key, 
prdName varchar(100), 
catID int, 
constraint fkcategory foreign key (catID) references Category(catID));  -- create foreign key from parent

insert into Product (prdName, catID) values ("Mobile",1);
insert into Product (prdName, catID) values ("AndroidWatch",2);
insert into product (prdName, catID) values ("BoatWatch", 2);
insert into product (prdName,  catID) values (null, 2);
insert into product (prdName,  catID) values ("NoiseWatch", null);
insert into product (prdName,  catID) values ("Iphone", null);

update Category  -- it will gives error 
set catID = 100 where catID=1;

drop table Product ;

create table Product (
prdID int auto_increment primary key, 
prdName varchar(100), 
catID int, 
constraint fkcategory foreign key (catID) references Category(catID)
on delete cascade
on update cascade);

insert into product (prdName, catID) values ("Mobile",1);
insert into product (prdName, catID) values ("Iphone",1);
insert into Product (prdName, catID) values ("NoiseWatch",2);
insert into Product (prdName, catID) values ("BoatWatch",2);

update Category
set catID=100
where catID=1;

delete from Category where catID=2;

show create table product; -- gives all information about table
Alter table product drop foreign key fkcategory;  -- to drop foreignkey
show create table product;

SELECT * FROM fk_demo.category;
SELECT * FROM fk_demo.product;