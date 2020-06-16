CREATE TABLE [Check] (
  [CheckID] INT NOT NULL	,
  [PatientID] INT NOT NULL,
  [TotalPrice] INT NOT NULL,
  [DoctorID] INT NOT NULL,
  PRIMARY KEY ([CheckID])
);

CREATE INDEX [FK] ON  [Check] ([PatientID], [DoctorID]);

CREATE TABLE [Patients] (
  [PatientID] INT NOT NULL,
  [FirstName] VARCHAR(50),
  [LastName] VARCHAR(50),
  [MedicineID] INT NOT NULL,
  [Phone] INT NOT NULL,
  [DoctorID] INT NOT NULL,
  PRIMARY KEY ([PatientID])
);

CREATE INDEX [FK] ON  [Patients] ([MedicineID], [DoctorID]);

CREATE TABLE [Doctors] (
  [DoctorrID] INT NOT NULL,
  [FirstName] VARCHAR(50),
  [LastName] VARCHAR(50),
  [PhoneNO] INT NOT NULL,
  PRIMARY KEY ([DoctorrID])
);

CREATE TABLE [Medicines] (
  [MedicineID] INT NOT NULL,
  [MedicineType] VARCHAR(50),
  [Quantity] INT NOT NULL,
  [Description] VARCHAR(50),
  [Price] VARCHAR(50),
  PRIMARY KEY ([MedicineID])
);

CREATE TABLE [Receptionists] (
  [ReceptionistID] INT NOT NULL,
  [Name] VARCHAR(50),
  [Phone] INT NOT NULL,
  PRIMARY KEY ([ReceptionistID])
);


1* Write an SQL query to find the position of the alphabet (‘a’) in the Firstname column ‘Amitabh’ from patients table.?

Select INSTR(FIRST_NAME, BINARY'a') from patients where FIRST_NAME = 'Amitabh';

--------
2* Write an SQL query to print the FIRST_NAME from patients table after removing white spaces from the right side.?

Select RTRIM(FIRST_NAME) from patients;
--------
3* Write an SQL query that fetches the unique values of Medicines from Worker table and prints its length?

Select distinct length(Medicines ) from patients;
------
4* Write an SQL query to print the FIRST_NAME Patients table after replacing ‘a’ with ‘A’?

Select REPLACE(FIRST_NAME,'a','A') from Patients;
----------

5*Write an SQL query to print the FIRST_NAME and LAST_NAME from Patients table into a single column COMPLETE_NAME. A space char should separate them?

Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Patients;
--------
6* Write an SQL query to print details for Patient with the first name as “Vipul” and “Satish” from Patients table.?

Select * from Patients where FIRST_NAME in ('Vipul','Satish');
 
------------
7*  Write an SQL query to print details of Patient excluding last names, “Vipul” and “Satish” from Patients table.?

Select * from Patients where LAST_NAME not in ('Vipul','Satish');


---------
8* Write an SQL query to print the FIRST_NAME Doctors table after replacing ‘a’ with ‘A’?

Select REPLACE(FIRST_NAME,'a','A') from Doctors;
----------

9*Write an SQL query to print the FIRST_NAME and LAST_NAME from Doctors table into a single column COMPLETE_NAME. A space char should separate them?

Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Doctors;
--------
10* Write an SQL query to Doctors details for Doctor with the first name as “Vipul” and “Satish” from Doctors table.?

Select * from Doctors where FIRST_NAME in ('Vipul','Satish');
 
------------
11*  Write an SQL query to print details of Patient excluding last names, “Vipul” and “Satish” from Patients table.?

Select * from Customers where LAST_NAME not in ('Vipul','Satish');


---------

12* Write an SQL query to show only odd rows from a table.??

SELECT * FROM Doctors WHERE MOD (Doctor_ID, 2) <> 0;

----------
13* Write an SQL query to show only even rows from a table.??

SELECT * FROM Doctors WHERE MOD (Doctor_ID, 2) = 0;
---------
14* Write an SQL query to clone a new table from another table.?

SELECT * INTO DoctorClone FROM Doctors;
SELECT * INTO DoctorClone FROM Doctors WHERE 1 = 0;
CREATE TABLE DoctorClone LIKE Doctors;

-------------

15* Write an SQL query to fetch intersecting records of two tables?
(SELECT * FROM Receptionists)
INTERSECT
(SELECT * FROM ReceptionistClone);
-------------
16*  Write an SQL query to show the second highest Price from a table.?

Select max(Price) from Medicines 
where Price not in (Select max(Price) from Medicines);
--------
17* Write an SQL query to show only odd rows from a table.??

SELECT * FROM Medicines WHERE MOD (Medicine_ID, 2) <> 0;

----------
18* Write an SQL query to show only even rows from a table.??

SELECT * FROM Medicines WHERE MOD (Medicine_ID, 2) = 0;
---------
19* Write an SQL query to clone a new table from another table.?

SELECT * INTO MedicineClone FROM Medicines;
SELECT * INTO MedicineClone FROM Medicines WHERE 1 = 0;
CREATE TABLE MedicineClone LIKE Medicines;

-------------

20* Write an SQL query to fetch intersecting records of two tables?
(SELECT * FROM Medicines)
INTERSECT
(SELECT * FROM MedicineClone);






select statments

-- 6 insert statment

INSERT INTO Patients VALUES(1,'Lotfy ','shawky',11,01222,12);
INSERT INTO Patients VALUES(2,'Saad','fathy',male,22,01111,14);
INSERT INTO Patients VALUES(3,'Tarek','omar',male,33,01000,16);
INSERT INTO Medicines VALUES(1,'bill','300',for grands,33 L.E);
INSERT INTO Medicines VALUES(2,'Drink','120',for Kids,100L.E);






-- 3 select using subquery


SELECT * 
   FROM Patients 
   WHERE PatientID IN (SELECT PatientID
         FROM Patients 
         WHERE PatientID = 1) ;

SELECT * 
   FROM Equipments 
   WHERE EquipmentID IN (SELECT EquipmentID
         FROM Equipments 
         WHERE EquipmentID = 1) ;

SELECT * 
   FROM Medicines 
   WHERE MedicinName IN (SELECT MedicinName
         FROM Medicines 
         WHERE MedicinName = 'revoo') ;







-- 2 select statments using count and group functions

SELECT MedicintType, COUNT(*)  'count'
FROM Medicines 
GROUP BY MedicinType;

SELECT PhoneNO, COUNT(*) 'count'
FROM Doctors 
GROUP BY Doctors;






-- 5 update statments

UPDATE Medicines
SET MedicinName = 'reno'
WHERE MedicinID = 1;

UPDATE Medicines
SET MedicinName = 'kinakom'
WHERE MedicinID = 2;

UPDATE Medicines
SET MedicinName = 'banadool'
WHERE MedicinID = 3;

UPDATE Patients
SET Firstname = 'Naguib'
WHERE PatientID = 1;

UPDATE Patients
SET Surname = 'Mafouz' 
WHERE PatientID = 2;



-- 5 select statements using different joins

SELECT Patients.PatientID, Patients.PatientFirstName
FROM Patients
INNER JOIN Treat ON Patients.PatientID=Patients.PatientID;

SELECT Patients.PatientID, Patients.PatientFirstName
FROM Patients
LEFT JOIN Book ON Patients.PatientID=Patients.PatientID;

SELECT Patients.PatientID, Patient.PatientFirstName
FROM Patients
RIGHT JOIN Book ON Patients.PatientID=Patients.PatientID;

SELECT Patients.PatientID, Patients.PatienttFirstName
FROM Patients
FULL JOIN Book ON Patients.PatientID=Patients.PatientID;

SELECT Medicin.MedicinID, Medicin.MedicinID
FROM Medicin
INNER JOIN Medicines ON Medicin.MedicinID=Medicin.MedicinID;



-- 5 delete statments

DELETE FROM Patients WHERE PatientID= 1;
DELETE FROM Patients WHERE PatientID= 2;
DELETE FROM Patients WHERE PatientID= 3;
DELETE FROM Medicines WHERE MedicinID= 1;
DELETE FROM Medicines WHERE MedicinID= 1;
