use classicmodels;

-- find out all the employees who work in the offices located in USA
select officecode 
from offices 
where country = 'USA';

select firstname, lastname, officecode 
from employees
where officecode in(select officecode 
						from offices 
						where country = 'USA');

-- write a query to find out customers who has highest payment
-- inner query
select customernumber 
from payments 
where amount= (select max(amount) from payments);

select * from customers;

select customername, customernumber
from customers 
where customernumber = (select customernumber 
							from payments 
							where amount= (select max(amount) from payments));

-- find the customers whose payment are greater than average payment
-- inner query
select avg(amount)
from payments;

select customerNumber, amount  
from payments
where amount >(select avg(amount)
				from payments );
                
-- find the customers who have not plcaed any order

select distinct customernumber from orders;   -- inner query

select customernumber, customername 
from customers 
where customernumber not in (select distinct customernumber from orders);     
    
-- find maximum, minimum and avgerage number of item in sales order

select max(items), min(items), floor(avg(items))
from (select ordernumber, count(ordernumber) as items 
	   from orderdetails 
       group by ordernumber) as lineItems;
       
-- co-related subquries
/* Select the product whose buyprice are greater than average buyprice 
of all the product in each productline */

select productcode, productline, buyprice
from products p1
where buyprice > (select avg(buyprice)
					from products 
                    where productline = p1.productline); 
                    
select productline, avg(buyprice)
from products p1
where productline = p1.productline
group by productline;


     

                