-- Create Database
CREATE DATABASE BankDatabase;

USE BankDatabase;

-- Create Tables
CREATE TABLE Bank (
    bank_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL
);

CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    bank_id INT,
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

CREATE TABLE Accounts (
    Acc_no INT PRIMARY KEY,
    cust_id INT,
    Acctype_id INT,
    Balance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

CREATE TABLE AccountType (
    acctype_id INT PRIMARY KEY,
    acctype VARCHAR(50) NOT NULL
);

CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    Acc_no INT,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_type INT NOT NULL,
    -- Assuming 1-debit, 2-credit
    date DATE NOT NULL,
    FOREIGN KEY (Acc_no) REFERENCES Accounts(Acc_no)
);

CREATE TABLE Customer_Master (
    Cust_id INT PRIMARY KEY,
    cname VARCHAR(255) NOT NULL,
    contact VARCHAR(15) NOT NULL,
    age INT NOT NULL,
    pan_no VARCHAR(10) NOT NULL
);

-- Bank table
INSERT INTO Bank (bank_id, name, Address, city, state)
VALUES 
    (1, 'ABC Bank', '123 Main St', 'City1', 'State1'),
    (2, 'XYZ Bank', '456 Oak St', 'City2', 'State2'),
    (3, 'DEF Bank', '789 Elm St', 'City3', 'State3');

-- Customer table
INSERT INTO Customer (cust_id, bank_id)
VALUES 
    (101, 1),
    (102, 2),
    (103, 3);

-- Accounts table
INSERT INTO Accounts (Acc_no, cust_id, Acctype_id, Balance)
VALUES 
    (1001, 101, 1, 5000.00),
    (1002, 102, 2, 7500.50),
    (1003, 103, 1, 12000.75);

-- AccountType table
INSERT INTO AccountType (acctype_id, acctype)
VALUES 
    (1, 'Savings'),
    (2, 'Checking'),
    (3, 'Fixed Deposit');

-- Transaction table
INSERT INTO Transaction (transaction_id, Acc_no, amount, transaction_type, date)
VALUES 
    (1, 1001, 1000.00, 2, '2024-01-01'),
    (2, 1002, 500.50, 1, '2024-01-02'),
    (3, 1003, 2000.50, 2, '2024-01-03');

-- Customer_Master table
INSERT INTO Customer_Master (Cust_id, cname, contact, age, pan_no)
VALUES 
    (101, 'John Doe', '123-456-7890', 30, 'ABCDE1234F'),
    (102, 'Jane Smith', '987-654-3210', 25, 'PQRST5678G'),
    (103, 'Alice Johnson', '111-222-3333', 28, 'FGHIJ6789K');
    
    
    select * from accounts;
    
    -- 4. Find the amount , name of customer whose acc_no is 12345
    
    select balance, cname 
    from accounts 
    inner join customer_master using (cust_id)
    where acc_no = 1003;
    
    -- 5. Display the customer name ,contact of customers whose account type is ‘saving’ 
-- order by descending order of cname .
select cname, contact 
from accounts
inner join accounttype using (acctype_id)
inner join customer_master using (cust_id)
where acctype='savings';

-- 6. Display bank name , total balance of all customers in that bank of all banks in 
-- descending order of balance.
select name, sum(balance)as 'Total'
from customer
inner join accounts using (cust_id)
inner join bank using(bank_id)
group by name
order by Total desc;

-- 7. Update account no of customers of ‘state bank of india’ . Prefix ‘SBI’ before account no
desc accounts;

Update customer 
inner join accounts  using (cust_id)
inner join bank using(bank_id)
set acc_no = concat('ABC',acc_no)
where name='ABC Bank';

/*8. Create Trigger on Transaction table when transaction is done accordingly it should 
be reflected in balance of Accounts. If transaction is debit reduce the balance , for 
credit increase balance*/

desc transaction;

insert into transaction values (12,1002,1000,1,'2024-1-2');

insert into transaction values (11,1002,1000,2,'2024-1-2');

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT u.cust_id,cname,contact,age,pan_no  
FROM bank b, customer c, accounts a, accounttype t, customer_master u
WHERE b.bank_id = c.bank_id AND c.cust_id=a.cust_id AND a.acctype_id=t.acctype_id AND 
u.cust_id=c.cust_id AND  b.name='ABC Bank';

