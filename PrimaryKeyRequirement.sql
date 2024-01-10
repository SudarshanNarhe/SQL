use testdp;
create table a(
aid int unique,
aname varchar(40)); 
drop table a;
insert into a values (1,"Sudarshan");
select * from testdp.a;

use testdp;
create table b(
bid int, constraint fid foreign key (bid) references a(aid), -- it will give without primary key we can use unique in parent but it accept the null also
bname varchar(50));

insert into b values(1,"Utkarsha"); -- it can add into table
insert into b values (2,"Snehal"); -- it gives an error