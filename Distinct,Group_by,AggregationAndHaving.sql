use classicmodels;
-- use of distinct 
-- select distinct status from orders 
select * from orders;
select distinct status 
from orders;

select * from customers;
select distinct state 
from customers;  -- it will return one null value if it contains more than one null value 

-- distinct with multiple coloumns
select distinct state , city -- we can use city, state also
from customers
where state is not null
order by state;

-- Group by 
select * from orders;
select status 
from orders
group by status;

select distinct status 
from orders;    -- it will return the same output as group by

-- group by with agrregate functions

select status , count(*)
from orders 
group by status; 

select distinct status as newstatus , count(*)
from orders
group by newstatus;  -- we can use aggregartion after the distinct also but we have to still use group by

select * from orderdetails; 

select ordernumber, sum(quantityordered*priceeach) as Total
from orderdetails
group by orderNumber; 

/* it is mandatory to take a ordernumber otherwise it will give 1055 error in select if we want to group by 
to avoid such thing we have to set setting as SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));  */

 SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select * ,sum(quantityordered*priceeach) as Total
from orderdetails
group by orderNumber; 

-- find out citywise customer count
select * from customers ;
select city , count(customernumber)
from customers 
group by city; 

-- find out yearwise conunt of ordered number from orders 
select * from orders;
select year(orderdate) as Year , count(ordernumber)
from orders
group by Year;

-- Use of Limit 
select * from customers;
select customerNumber, customername, creditlimit
from customers
limit 5;

select customerNumber, customername, creditlimit
from customers
limit 5,2; 
/*it will show you next to 5 i.e. from 6 and limit is next i.e. 2 
 these happens because of offset starts from 0 */
 
select customerNumber, customername, creditlimit
from customers
limit 1,1;  
 
select customerNumber, customername, creditlimit
from customers
limit 0,1; 

select * from products;

-- find avg byprice of all the products in product table
select avg(buyprice) as Average
from products;

-- find avg byprice for each productline 
select productLine,avg(buyprice) as Average
from products
group by productLine;

-- find number of products in a product table
select count(productcode) 
from products;

-- find number of products in each productline as per desc order of productline
select productLine,count(productcode)
from products 
group by productline
order by productline desc;

-- find a query to get sum of price into qauntity order as per product code
select productCode,sum(buyprice)
from products
group by productcode;

-- find a query to get highest buyprice from product
select max(buyprice)
from products;

-- find a query to get highest price as per productline desc order by max buyprice
select productLine,max(buyprice) as maximum
from products
group by productLine
order by maximum desc;

-- find a query to get highest buyprice from product
select min(buyprice)
from products;

-- find a query to get lowest price as per productline desc order by max buyprice
select productLine,min(buyprice) as minimum
from products
group by productLine
order by minimum desc;

-- find the ordernumber whoose total price is greater than 1000 as per the order number 
select ordernumber , sum(quantityordered*priceeach) as Total 
from orderdetails
group by orderNumber
having total>1000;

select ordernumber , sum(quantityordered*priceeach) as Total , sum(quantityordered) as Ordered
from orderdetails
group by orderNumber
having total>1000 and ordered >600;
