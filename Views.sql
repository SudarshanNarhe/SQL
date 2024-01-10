use testcoursedb;
select * from employees_contacts;

select * from employees_contacts
where department_name= 'sales';

-- view from view
select * from view_from_view;

use classicmodels;
/*create a view which give us customernumber,customername,
phone,orderNumber, salesRepemployeenumber, sum(quantityordered*priceeach) */
select customernumber,customername,phone,orderNumber, salesRepemployeenumber, sum(quantityordered*priceeach) as 'Sum'
from customers
inner join orders using (customernumber)
inner join orderdetails using (ordernumber)
group by orderNumber;

select * from order_detailswithsum;

/*create a view for products whose buyprices are higher then average price of all products */

select productcode,buyprice from products 
 where buyprice > (select avg(buyprice) from products)
 group by productcode;

select * from higher_than_buyprice;

select * from customerorderstats;

select * from simple_view;
update simple_view
set salary = 50000
where employee_id=0;

select * from employees;

-- to check the information 
select 
table_name,
is_updatable
from information_schema.views
where table_schema='testcoursedb';

select 
table_name,
is_updatable
from information_schema.views
where table_schema='classicmodels';
