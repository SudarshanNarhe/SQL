use testdp;
create table customer(custid int primary key,custname varchar(30),custmail varchar(50));
insert into customer values(11,'Sudarshan','sudar@gmail');
insert into customer (custid, custname) values (12,'Utkarsha');
insert into customer values(13,'Pavan','pav@gmail'),(14,'Snehal','sneha@gmail'),(15,"Suraj","suraj@gmail");
select custid, custname from customer;
select * from customer where custid>13;
select * from customer where custname like "S%";
select * from customer where custname like 'sudarshan';
select * from customer order by custname;
select * from customer order by custname desc;

select * from testdp.customer;