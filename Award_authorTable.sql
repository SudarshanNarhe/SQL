use Assignments;
create table Award_authorTable(
awardid int auto_increment primary key not null,
awardTypeid int not null,
aauthorid int not null,
bookid int not null,
Date_Year year not null,
constraint awrdtypeid foreign key (awardTypeid) references AwardTable(awardid),
constraint aauthorid foreign key(aauthorid) references Author(authorid),
constraint bookid foreign key (bookid) references Book(bookid));

insert into Award_authorTable (awardTypeid, aauthorid, bookid, Date_Year) values (4,3,2, "2019");
insert into Award_authorTable (awardTypeid, aauthorid, bookid, Date_Year) values (2,1,4, "2015");
insert into Award_authorTable (awardTypeid, aauthorid, bookid, Date_Year) values (3,2,5, "2014");
insert into Award_authorTable (awardTypeid, aauthorid, bookid, Date_Year) values (1,2,6, "2017");

desc Award_authorTable;

select * from assignments.Award_authorTable;