CREATE DATABASE flatinfo;
USE flatinfo;

create table Building(
BuildingID varchar(100) primary key,
NoofFlats int,
NoofLifts int,
RepresentativeID varchar(100)
);

drop table Building;

insert into Building values('A', 15,2,'A111');
insert into Building values('B', 21,2,'B311');
insert into Building values('C', 15,2,'C112');

create table Owners(
	Oid int primary key,
    OwnerName varchar(100),
    Mobile long,
    Email varchar(100)
);

drop table Owners;

insert into Owners values(20121, 'A.D.Sathe',9944220890,'adsathe@gmail.com');
insert into Owners values(20122,'D.Y.Patil',9881220890,'dypatil@gmail.com');
insert into Owners values(20123,'Revati D Divekar',7744220890,'revati@gmail.com');
insert into Owners values(20131,'A.V.Bhat',5645568390,'bhatav@gmail.com');
insert into Owners values(20132,'s.s.Khatri',8787876543,'ssk@gmail.com');

create table Flats(
	FlatNo varchar(100) primary key,
    Area int,
    Oid int, constraint fkOid foreign key (Oid) references Owners(Oid),
    Occupiedstatus varchar(100)
    
    );
drop table Flats;

insert into Flats (FlatNo, Area, Oid, Occupiedstatus)
values('A111', 1200, 20121, 'Self'),
    ('A112', 1200, 20122, 'Self'),
    ('A211', 1200, 20123, 'Self'),
    ('A212', 1200, 20131, 'Self'),
    ('B111', 900, 20121, 'Tenant'),
    ('B112', 900, 20122, 'Empty'),
    ('B211', 900, 20131, 'Tenant'),
    ('B212', 900, 20123, 'Empty'),
    ('B311', 900, 20131, 'Self'),
    ('B312', 900, 20121, 'Self'),
    ('C111', 900, 20121, 'Tenant'),
    ('C112', 900, 20123, 'Self');
    
    
    CREATE TABLE Maintenance (
    Mid INT AUTO_INCREMENT PRIMARY KEY,
    Flatno VARCHAR(10), constraint fkFlatno foreign key(Flatno) references Flats(Flatno),
    maintenance_amount INT,
    amount_paid INT,
    Paymentdate DATE,
    balance INT
);

insert into Maintenance (Flatno, maintenance_amount, amount_paid, Paymentdate, balance)
values
    ('A111', 2000, 2000, '2019-08-11', 0),
    ('A112', 2000, 1000, '2019-09-11', 1000),
    ('A212', 2000, 1500, '2019-12-31', 500),
    ('A211', 2000, 2000, '2019-09-11', 0),
    ('B112', 900, 900, '2020-01-11', 0),
    ('B212', 900, 450, '2019-07-17', 450),
    ('C112', 900, 0, '2019-09-11', 0);