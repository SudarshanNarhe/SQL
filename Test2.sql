create database test2;
use test2;

-- Create Customer Table
CREATE TABLE Customer (
    Cust_Id INT PRIMARY KEY,
    Cust_name VARCHAR(255),
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(255),
    pin_code VARCHAR(10)
);

-- Create Service_Status Table
CREATE TABLE Service_Status (
    Status_Id INT PRIMARY KEY,
    desp VARCHAR(255)
);

-- Insert values into Service_Status Table
INSERT INTO Service_Status (Status_Id, desp)
VALUES
    (1, 'OPEN'),
    (2, 'IN_PROGRESS'),
    (3, 'CLOSED'),
    (4, 'CANCELLED');

-- Create Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    age INT,
    requestsCompleted INT,
    emp_rating INT
);

-- Create Service_Request Table
CREATE TABLE Service_Request (
    Service_Id INT PRIMARY KEY,
    cust_id INT,
    service_desc VARCHAR(255),
    request_open_date DATE,
    status_id INT,
    Emp_id INT,
    request_closed_date DATE,
    charges DECIMAL(10, 2),
    feedback_rating INT,
    FOREIGN KEY (cust_id) REFERENCES Customer(Cust_Id),
    FOREIGN KEY (status_id) REFERENCES Service_Status(Status_Id),
    FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_Id)
);

-- Insert values into Customer Table
INSERT INTO Customer (Cust_Id, Cust_name, address_line1, address_line2, city, pin_code)
VALUES
    (1, 'Sudarshan', '123 Main St', 'Apt 45', 'Pune', '123452'),
    (2, 'Yogesh', '456 Oak St', 'Suite 101', 'Mumbai', '567489'),
    (3, 'Sunil', '789 Pine St', 'Apt 12', 'Chennai', '101311'),
    (4, 'Anil', '101 Cedar St', 'Suite 50', 'Gujrat', '206222'),
    (5, 'Pankaj', '222 Oak St', 'Apt 30', 'Pune', '303373'),
    (6, 'Raghav', '555 Maple St', 'Suite 75', 'Mumbai', '404444');

-- Insert values into Employee Table
INSERT INTO Employee (Emp_Id, Emp_name, age, requestsCompleted, emp_rating)
VALUES
    (10, 'Amit', 30, 20, 1),
    (20, 'Raju', 35, 15, 2),
    (30, 'Pintu', 28, 25, 1),
    (40, 'Prashant', 40, 18, 2),
    (50, 'Ishwar', 32, 22, 2),
    (60, 'Abhishek', 36, 20, 3);

-- Insert values into Service_Request Table
INSERT INTO Service_Request (Service_Id, cust_id, service_desc, request_open_date, status_id, Emp_id, request_closed_date, charges, feedback_rating)
VALUES
    (101, 1, 'Repair', '2023-01-15', 1, 10, '2023-01-20', 150.00, 1),
    (102, 2, 'Installation', '2023-02-01', 2, 20, NULL, 200.50, 3),
    (103, 3, 'Maintenance', '2023-02-10', 1, 30, '2023-02-15', 120.75, 2),
    (104, 4, 'Consultation', '2023-03-01', 2, 40, NULL, 180.25, 4),
    (105, 1, 'Upgrade', '2023-03-15', 1, 20, NULL, 250.00, 1),
    (106, 5, 'Repair', '2023-04-01', 1, 50, '2023-04-05', 135.50, 2),
    (107, 6, 'Installation', '2023-04-15', 2, 60, NULL, 190.75, 3),
    (108, 2, 'Maintenance', '2023-05-01', 1, 40, NULL, 220.00, 1);


-- 1Write a query to create Employee table. 
-- 2Write a query to create Service_Request table with appropriate primary keys and foreign keys.
-- 3Write a query to add column email_id(varchar(50)) to customer table.

Alter table Customer add email_id varchar(50) after Cust_name;
select * from customer;

-- 4Show customer name, service description, charges of requests served by employees older than age 30. 
SELECT EMP_NAME,AGE,CUST_NAME, SERVICE_DESC, CHARGES, EMP_ID
FROM SERVICE_REQUEST
INNER JOIN CUSTOMER USING (CUST_ID)
INNER JOIN EMPLOYEE USING (EMP_ID)
WHERE AGE>30
GROUP BY EMP_ID;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 5Write a query to select customer names for whom employee ‘Amit’ has not served any request.
SELECT CUST_NAME FROM CUSTOMER
INNER JOIN SERVICE_REQUEST USING(CUST_ID)
INNER JOIN EMPLOYEE USING (EMP_ID)
WHERE EMP_NAME <> 'AMIT';

-- 6Show employee name, total charges of all the requests served by ‘Amit’. Consider only ‘closed’ requests.
SELECT EMP_NAME, SUM(CHARGES) 
FROM SERVICE_REQUEST
INNER JOIN EMPLOYEE USING (EMP_ID)
INNER JOIN SERVICE_STATUS USING (STATUS_ID)
WHERE EMP_NAME='PRASHANT' AND STATUS_ID=3;

SELECT e.emp_name, SUM(s.charges)
FROM service_request s
INNER JOIN customer c ON (c.cust_id=s.cust_id)
INNER JOIN service_status s1 ON (s1.status_id=s.status_id AND desp='CLOSED')
INNER JOIN employee e ON (s.emp_id=e.emp_id)
GROUP BY e.emp_name;

-- 7Show service description, customer name of request having third highest charges.
SELECT SERVICE_DESC,CUST_NAME, CHARGES
FROM SERVICE_REQUEST 
INNER JOIN CUSTOMER USING(CUST_ID) 
ORDER BY CHARGES DESC LIMIT 2,1; 

-- 8Show name of all employees who have same rating as employee ‘Amit’ 
SELECT E.EMP_NAME FROM EMPLOYEE E
INNER JOIN EMPLOYEE E1 USING (EMP_ID)
WHERE E1.EMP_RATING = (SELECT EMP_RATING FROM EMPLOYEE 
					WHERE EMP_NAME='AMIT'); 


-- 9 Find the total charges earned by each employee. Sort by maximum charges at top. Consider ‘closed’ requests only.
SELECT EMP_NAME,SUM(CHARGES) AS 'TOTAL'
FROM SERVICE_REQUEST 
INNER JOIN EMPLOYEE using(EMP_ID)
INNER JOIN SERVICE_STATUS USING(STATUS_ID)
WHERE DESP='CLOSED'
GROUP BY EMP_ID
ORDER BY TOTAL DESC ;

-- 10 Delete all requests served by ‘Kumar’ as he has left the company.
DELETE SR FROM SERVICE_REQUEST SR
INNER JOIN EMPLOYEE E ON SR.EMP_ID=E.EMP_ID
WHERE E.EMP_NAME='AMIT';

-- 11 Delete all cancelled requests from request table.
DELETE SR FROM SERVICE_REQUEST SR
INNER JOIN SERVICE_STATUS USING(STATUS_ID)
WHERE DESP='CANCELLED';

-- 12 Add 200 to the charges of service_request raised by customer ‘Singh’.
Select emp_id,(charges)+200 as 'TotalCharges'
from service_request
inner join customer using (cust_id)
where cust_name='sudarshan';

UPDATE SERVICE_REQUEST 
SET CHARGES=CHARGES+200
WHERE CUST_ID = (SELECT CUST_ID FROM CUSTOMER WHERE CUST_NAME='SUDARSHAN');

-- 13 Create a trigger which is fired when Service_request is updated. 
-- The trigger should update emp_rating in employee table
-- (emp_rating is average of all the service_requests ‘closed’ by employee).



-- 14 Create a stored procedure which returns the year-wise, month-wise addition of total_charges
-- sorted by year in descending and then month in ascending
SELECT year(REQUEST_OPEN_DATE)AS 'YEAR',month(REQUEST_OPEN_DATE)AS 'MONTH',SUM(CHARGES) AS 'TOTALCHARGES'
from SERVICE_REQUEST 
group by YEAR,MONTH
ORDER BY YEAR DESC,MONTH ASC;

call Total_chargesByMonthAndYear;

-- 15 Write single query to create SerReqCopy table which will have same structure and 
-- data of service_request table.
create table req_copy as select * from service_request;

select * from req_copy;

-- 16 Create index so that retrieval of records is faster when retrieved based on status id
create index status_id_index 
on service_request (status_id);

select * from service_request where status_id=3;
explain (select * from service_request where status_id=3);

-- 17 Create a view which will show customer name, service desc , employee name , service charges , 
-- status desc of requests which are not closed.
SELECT CUST_NAME, SERVICE_DESC, EMP_NAME, CHARGES
FROM SERVICE_REQUEST
INNER JOIN CUSTOMER USING (CUST_ID)
INNER JOIN EMPLOYEE USING(EMP_ID)
INNER JOIN SERVICE_STATUS USING(STATUS_ID)
WHERE DESP<> 'CLOSED';

SELECT * from show_details;