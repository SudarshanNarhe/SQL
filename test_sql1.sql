use test_sql;

select * from customer;
select * from theatre;
select * from bookings;
select * from screeninginfo;

-- 1.Show names of theatres where ‘maroti’ has booked tickets. 

select cust_id
from customer
where cust_name= 'maroti';

select theatre_id, cust_id 
from bookings 
where cust_id in(select cust_id
				from customer
				where cust_name= 'maroti');

select theatre_name
from theatre
where theatre_id in(select distinct theatre_id 
from bookings 
where cust_id in(select cust_id
				from customer
				where cust_name= 'sunish'));
  
  -- 2.Show names of theatre where movie ‘Uri’ is screening
  
select movie_id 
from movie
where movie_name= 'uri';

select theatre_id
from screeninginfo
where movie_id in (select movie_id 
from movie
where movie_name= 'uri');

select theatre_id,theatre_name
from theatre
where theatre_id in(select distinct theatre_id
from screeninginfo
where movie_id in (select movie_id 
from movie
where movie_name= 'uri'));

-- 3. Show names of theatre which has done maximum business

select theatre_id, sum(no_of_tickets_booked)
from bookings
group by theatre_id
order by sum(no_of_tickets_booked) desc limit 1; 
-- by order it will give higher at last and after desc it will come at first and limit for only that row

-- main
select theatre_name from theatre where theatre_id= (select theatre_id from bookings group by theatre_id
order by sum(no_of_tickets_booked) desc limit 1);

-- 4.Show names of movies and business done by that movie

select no_of_tickets_booked, b.movie_id, ticket_price, b.theatre_id from
bookings b, screeninginfo s 
where b.movie_id=s.movie_id and b.theatre_id = s.theatre_id;

select  m.movie_name,sum(no_of_tickets_booked*ticket_price) from
bookings b, screeninginfo s, movie m
where b.movie_id = s.movie_id and b.theatre_id = s.theatre_id and m.movie_id = b.Movie_id
group by s.movie_id;

-- 5. Write a query to add city field in theatre table between address and rating

Alter table theatre add city varchar(50) after address;

desc theatre;

-- 6. Write a query to add field totalchargesint(10) in bookings table.

Alter table bookings add totalcharges int(10);

desc bookings;

--  7. Update field totalcharges.
-- Totalcharges are no of tickets booked multiplied by ticket_price for that movie and theatre 

-- SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

update bookings b 
set totalcharges = (select no_of_tickets_booked* (select ticket_price from screeninginfo s 
													where b.movie_id=s.movie_id and b.theatre_id= s.theatre_id));
					
select * from bookings;

-- 8. Update totalcharges to give discount off 20% to all those who have their birthday on the booking date 
-- when they have booked tickets. 

select day(birth_date) , month(birth_date)
from customer;

select b.cust_id, booking_date from customer c, bookings b
where day(c.birth_date)=day(b.booking_date) and month(c.birth_date)=month(b.booking_date);

update bookings b
set totalcharges = totalcharges-(totalcharges*0.20)
where b.cust_id in(select b.cust_id from customer c
					where  day(c.birth_date)=day(b.booking_date) and month(c.birth_date)=month(b.booking_date) and
					b.cust_id= c.cust_id
                    ); 
                    
                    
 -- 9. Delete all bookings done by ‘yogesh’

select cust_id
from customer
where cust_name='prashant';

select * from bookings;

delete from bookings 
where cust_id= (select cust_id from customer
				where cust_name='prashant');

-- 10.Show names of movie name , totalbusiness done by it of movies directed by ‘prakashraj’
select movie_id 
from movie
where director = 'prakash raj';

select m.movie_name,sum(ticket_price*no_of_tickets_booked) as Totalbussiness from 
bookings b , screeninginfo s , movie m
where b.movie_id = s.movie_id and b.theatre_id =s.theatre_id and b.movie_id in(select movie_id
from movie 
where m.movie_id=b.movie_id and director = 'prakash raj')
group by s.movie_id;
