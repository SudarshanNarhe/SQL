use assignments;
create table movies(
movieid int auto_increment not null primary key,
moviename varchar(100) not null,
release_year year not null,
boxOfficeCollection double not null);

alter table movies modify boxOfficeCollection varchar(20)not null;

insert into movies (moviename, release_year, boxOfficeCollection) values("3 idiots",2016,"25cr");
insert into movies (moviename, release_year, boxOfficeCollection) values("Animal",2023,"700cr");
insert into movies (moviename, release_year, boxOfficeCollection) values("Sairat",2017,"120cr");
insert into movies (moviename, release_year, boxOfficeCollection) values("KGF",2019,"900cr");

select * from assignments.movies;

create table roles(
rollid int primary key auto_increment not null,
rollname varchar(100) not null);

insert into roles (rollname) values ("Producer");
insert into roles (rollname) values ('Actor');
insert into roles (rollname) values ('Villain');
insert into roles (rollname) values ('Actress');
insert into roles (rollname) values ('Director');

select * from assignments.roles;

create table Celebrity (
celid int auto_increment NOT NULL primary key,
celName varchar(100) not null,
birthdate date ,
phoneNo varchar (15) not null unique,
email varchar (50) not null unique);

drop table Celebrity;


insert into Celebrity (celName, birthdate, phoneNo, email) values ("Akshay Kumar","1987-4-12","9836362093","akshay@mail.com");
insert into Celebrity (celName, birthdate, phoneNo, email) values ("Shradha Kapoor","1996-4-17","7463738389","skapoor@mail.com");
insert into Celebrity (celName, birthdate, phoneNo, email) values ("Akash Patil","1999-8-23","9884636372","akash@mail.com");
insert into Celebrity (celName, birthdate, phoneNo, email) values ("Amir Khan","1989-9-18","9807463575","ak@mail.com");
insert into Celebrity (celName, birthdate, phoneNo, email) values ("Yash","1991-11-27","9827354637","yash@mail.com");
insert into Celebrity (celName, birthdate, phoneNo, email) values ("Bobby Deol","1978-9-30","9876890432","bbd@mail.com");
insert into Celebrity (celName, birthdate, phoneNo, email) values ("Rashmika Mandana","1998-10-15","6879054387","raash@mail.com");

desc Celebrity;

select * from assignments.Celebrity;

	create table BollywoodData(
	BollywoodDataid int auto_increment primary key,
	Celebrityid int not null ,constraint fcelkey foreign key (Celebrityid) references Celebrity(celid),
	Movieid int not null, constraint fmkey foreign key (Movieid) references Movies(movieid),
	rollid int not null, constraint rkey foreign key (rollid) references roles(rollid));
    
    insert into BollywoodData (Celebrityid, Movieid,rollid) values
    (2,4,4),
    (1,3,5),
    (3,3,2),
    (5,4,3),
    (7,2,4),
    (6,2,1),
    (4,1,2);
    
    desc BollywoodData;
    
    select * from assignments.BollywoodData;