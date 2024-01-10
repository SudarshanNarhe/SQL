use classicmodels;

-- inner join
--  1.find order along with its order details 
-- without using join
select o.ordernumber, productcode, quantityordered, priceeach, orderdate, status, customernumber
from orders o , orderdetails o1
where o.ordernumber=o1.ordernumber;
-- inner join using
select o.ordernumber, productcode, quantityordered, priceeach, orderdate, status, customernumber
from orders o
inner join orderdetails using (ordernumber);

-- inner join on 
select o.ordernumber, productcode, quantityordered, priceeach, orderdate, status, customernumber
from orders o
inner join orderdetails s on o.ordernumber=s.ordernumber;

-- left outer join
-- 2. find all countries information along with location information
use testcoursedb;
-- without join
select c.country_id, c.country_name, l.country_id, city
from countries c ,locations l
where c.country_id=l.country_id; 
-- left join / left outer join (we can use left join without outer in updated version)
select c.country_id, c.country_name, l.country_id, city
from countries c 
left join locations l on c.country_id=l.country_id;
-- it returns null value if it not match to the second table to otherwise it will return country_id
-- add condition in where to remove the null values 
select c.country_id, c.country_name, l.country_id, city
from countries c
left join locations l on c.country_id=l.country_id
where l.country_id is not null;

-- find all information of US,Uk,China along with region information
select 
r.region_name,
c.country_name,
l.street_address,
l.city
from regions r 
left join countries c on c.region_id=r.region_id
left join locations l on l.country_id=c.country_id
where c.country_id in('US','UK','CN');

-- self join
-- 3. find the employees along with its manager name
use classicmodels;
select e.employeenumber, concat(e.firstname,' ',e.lastname)as 'Employee',
e.reportsTo as 'ManagerNumber', concat(m.firstname,' ',m.lastname)as 'Manager'
from employees e
inner join employees m on e.reportsTo=m.employeeNumber;

-- right join 
-- find all the employeeNumber and customerNumber where employee work as a salesRepNumber
select employeenumber, customernumber 
from customers
right join employees on salesRepEmployeenumber = employeeNumber
order by employeenumber; 
-- it check by reverse order from table2 to table1 and it return null value if not match 

-- find the employees who are not in charge of any customers
select employeenumber, customernumber 
from customers
right join employees on salesRepEmployeenumber = employeeNumber
where customerNumber is null
order by employeenumber; 





