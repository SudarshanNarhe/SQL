CREATE DATABASE voterinfo;
USE voterinfo;
-- Create Voter table
CREATE TABLE Voter (
    VoterId INT PRIMARY KEY,
    VoterName VARCHAR(50),
    VotingArea VARCHAR(50),
    VoterAge INT,
    VAadhar VARCHAR(12) UNIQUE,
    Gender VARCHAR(10),
    VAddressID INT,
    FOREIGN KEY (VAddressID) REFERENCES ResidenceAddress(VAddressID));

-- Create ResidenceAddress table
CREATE TABLE ResidenceAddress (
    VAddressId INT PRIMARY KEY,
    SurveyNo VARCHAR(20),
    Building VARCHAR(50),
    Area VARCHAR(50),
    Pincode VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50)
);

-- Create BoothDetails table
CREATE TABLE BoothDetails (
    BoothId INT PRIMARY KEY,
    BoothIncharge VARCHAR(50),
    NoOfCoordinators INT DEFAULT 10,
    BoothArea VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);

-- Create VotingMapper table
CREATE TABLE VotingMapper (
    Id INT PRIMARY KEY,
    ElectionDate DATE,
    State VARCHAR(50),
    VoterID INT,
    BoothID INT,
    FOREIGN KEY (VoterID) REFERENCES Voter(VoterId) ON UPDATE CASCADE,
    FOREIGN KEY (BoothID) REFERENCES BoothDetails(BoothId) ON UPDATE CASCADE
);

-- Insert data into Voter table
INSERT INTO Voter VALUES
(1, 'John Doe', 'Area1', 25, '123456789012', 'Male', 1),
(2, 'Jane Doe', 'Area2', 30, '987654321098', 'Female', 2);
-- Add 8 more records

-- Insert data into ResidenceAddress table
INSERT INTO ResidenceAddress VALUES
(1, 'S1', 'Building1', 'Area1', '123456', 'City1', 'State1'),
(2, 'S2', 'Building2', 'Area2', '654321', 'City2', 'State2');
-- Add 8 more records

-- Insert data into BoothDetails table
INSERT INTO BoothDetails VALUES
(1, 'Incharge1', 15, 'BoothArea1', 'City1', 'State1'),
(2, 'Incharge2', 10, 'BoothArea2', 'City2', 'State2');
-- Add 8 more records

-- Insert data into VotingMapper table
INSERT INTO VotingMapper VALUES
(1, '2024-01-01', 'State1', 1, 1),
(2, '2024-01-02', 'State2', 2, 2);
-- Add 8 more records

-- Insert data into Voter table
INSERT INTO Voter VALUES
(3, 'Alice Smith', 'Area3', 22, '111111111111', 'Female', 3),
(4, 'Bob Johnson', 'Area4', 35, '222222222222', 'Male', 4),
(5, 'Eva White', 'Area5', 28, '333333333333', 'Female', 5),
(6, 'Michael Brown', 'Area6', 40, '444444444444', 'Male', 6),
(7, 'Sophia Davis', 'Area7', 30, '555555555555', 'Female', 7),
(8, 'Daniel Miller', 'Area8', 45, '666666666666', 'Male', 8),
(9, 'Olivia Wilson', 'Area9', 27, '777777777777', 'Female', 9),
(10, 'Liam Harris', 'Area10', 32, '888888888888', 'Male', 10);

-- Insert data into ResidenceAddress table
INSERT INTO ResidenceAddress VALUES
(3, 'S3', 'Building3', 'Area3', '111111', 'City3', 'State3'),
(4, 'S4', 'Building4', 'Area4', '222222', 'City4', 'State4'),
(5, 'S5', 'Building5', 'Area5', '333333', 'City5', 'State5'),
(6, 'S6', 'Building6', 'Area6', '444444', 'City6', 'State6'),
(7, 'S7', 'Building7', 'Area7', '555555', 'City7', 'State7'),
(8, 'S8', 'Building8', 'Area8', '666666', 'City8', 'State8'),
(9, 'S9', 'Building9', 'Area9', '777777', 'City9', 'State9'),
(10, 'S10', 'Building10', 'Area10', '888888', 'City10', 'State10');

-- Insert data into BoothDetails table
INSERT INTO BoothDetails VALUES
(3, 'Incharge3', 12, 'BoothArea3', 'City3', 'State3'),
(4, 'Incharge4', 10, 'BoothArea4', 'City4', 'State4'),
(5, 'Incharge5', 14, 'BoothArea5', 'City5', 'State5'),
(6, 'Incharge6', 10, 'BoothArea6', 'City6', 'State6'),
(7, 'Incharge7', 11, 'BoothArea7', 'City7', 'State7'),
(8, 'Incharge8', 10, 'BoothArea8', 'City8', 'State8'),
(9, 'Incharge9', 13, 'BoothArea9', 'City9', 'State9'),
(10, 'Incharge10', 10, 'BoothArea10', 'City10', 'State10');

-- Insert data into VotingMapper table
INSERT INTO VotingMapper VALUES
(3, '2024-01-03', 'State3', 3, 3),
(4, '2024-01-04', 'State4', 4, 4),
(5, '2024-01-05', 'State5', 5, 5),
(6, '2024-01-06', 'State6', 6, 6),
(7, '2024-01-07', 'State7', 7, 7),
(8, '2024-01-08', 'State8', 8, 8),
(9, '2024-01-09', 'State9', 9, 9),
(10, '2024-01-10', 'State10', 10, 10);

-- Write a query to  see details of male  senior citizen(age above 60) voters  
-- who stays in Sahakar Nagar area of Pune City	
select * from voter 
inner join residenceaddress using (VAddressID)
where voterage>35 and gender like '%male%' and city like '%city8%';

desc voter;

-- Write query to fetch City wise total male and total female voters.
select VAddressID ,
sum(case when gender like '%male%' then 1 else 0 end)as 'male_voters',
sum(case when gender like '%female%' then 1 else 0 end)as 'female_voters'
from voter
group by VAddressID;

-- Delete VotingMapper records if Election Date is before  Jan 2019 for Pune city.
Delete from VotingMapper
where year(ElectionDate)<'2019'; 

-- Change Booth ID of All voters from Parvati Voting area to 1113.
Update boothdetails
set boothid = 11
where bootharea='bootharea10';

/*Write a stored procedure which accepts new boothId of voters having age above 60 
and are with same address id  and voter name as parameter .*/

