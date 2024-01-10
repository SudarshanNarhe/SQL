use Assignments;
create table Book(
bookid int auto_increment primary key,
bookname varchar(100) not null,
authorid int not null,
price double not null,
constraint authorid foreign key (authorid) references Author(authorid));

insert into book (bookname, authorid, price) values ("2 States", 4, 750);
insert into book(bookname, authorid, price ) values ("Mrutunjay", 3, 1200);
insert into book(bookname, authorid, price) values ("HalfGirlfriend", 4, 500);
insert into book(bookname, authorid, price) values ("Shyamchi Aai",1 , 800);
insert into book(bookname, authorid, price) values ("Wings Of Fire", 2, 600);
insert into book(bookname, authorid, price) values ("Mission 2020", 2, 850);

desc Book;

select * from assignments.book;