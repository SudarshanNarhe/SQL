Update owners
inner join flats using (oid) 
set onwername = ' Suraj Rokade ',
mobile = ' 7048575829 ' ,
email = ' suraj@425.com '
where flatno = B111 ;

select *,count(flatNo) as'count' from owners
inner join flats f using (oid)
where oid=oid;

-- //b.Write query to display owner details who owns more than 1 flats.
select * from owners 
inner join flats using (oid)
group by oid
having count(oid)>1;


SET @@sql_mode = sys.list_drop(@@sql_mode, 'ONLY_FULL_GROUP_BY');
			
Delete flats from flats
inner join owners using (oid)
where ownername like '%A.V.Bhat%' and Occupiedstatus like '%Tenent%' ;

-- e.Create a stored procedure which accepts  building name and returns Representative Name and his flat no.	           

-- f.Show building wise total amount of maintenance collected and 
-- total balance amount in descending order of maintenance collected.

select substring(flatno,1,1)as 'BuildingName', sum(amount_paid)as'Collected_amount' ,sum(balance)as 'total_balance'
from maintenance
group by BuildingName
order by Collected_amount desc;

