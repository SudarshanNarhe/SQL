use  bikedb;

-- Que 3 
desc customer;

set @pcust_name = '0';
call bikedb.new_procedure('C103', @pcust_name);
select @pcust_name; 

-- Que4
                        
select count(*) from purchase
inner join feedback_rating using(rating_id)
inner join model using (model_id)
where rating like '%Complaint%' and model_name like '%Bajaj%';

-- Que5
select * from customer
inner join purchase using(customer_id)
where rating_id is null;

-- Que6
Delete purchase from purchase 
inner join feedback_rating using(rating_id)
where rating like '%Complaint%';  

-- Que7
Update Purchase 
Set rating_id = (select rating_id from feedback_rating 
					where rating like '%Excellent%')
where customer_id =(select customer_id from customer 
						where first_name like '%AVAY%') 
                        and rating_id = (select rating_id from feedback_rating 
											where rating like '%Good%');
-- by join 
Update Purchase p
inner join feedback_rating f on (p.rating_id = f.rating_id and rating like '%Excellent%')
inner join customer c on(p.customer_id=c.customer_id and first_name like '%AVAY%')
set p.rating_id = f.rating_id 
where p.rating_id=(select rating_id from feedback_rating 
											where rating like '%Good%');
 
select * from purchase;

-- Que8
Update model
set cost = cost-(cost div 10)
where model_id in(select model_id from purchase 
					where rating_id in(select rating_id from feedback_rating where rating like '%Bad%'));

-- by query 
 


select * from model;

-- Que 9 JDBC 
select count(model_id)as'model_id' from purchase
 group by model_id 
 order by model_id desc limit 1;

select max(model_id)as'model_id' from purchase ;
