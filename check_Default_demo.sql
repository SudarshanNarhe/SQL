create database checkAndDefault;
use checkAndDefault;
create table cart_items (
cartid int auto_increment primary key,
catrname varchar(100) not null,
qauntity int not null,
price DEC(5,2) not null,
sales_tax DEC(5,2)not null default 0.1,
check (qauntity>0),
check (sales_tax>=0));

insert into cart_items (catrname, qauntity, price , sales_tax) values ("Maintainanace", 10, 100, 20);
insert into cart_items(catrname, qauntity, price, sales_tax) values("Sales", 5, 0, 20);
insert into cart_items(catrname, qauntity, price, sales_tax) values("Marketing", 0, 20, 30); -- it will check condition every time
insert into cart_items(catrname, qauntity, price, sales_tax) values("Sales", 5, 60, default); -- it will give the defualt value 

SELECT * FROM checkAndDefault.cart_items;




