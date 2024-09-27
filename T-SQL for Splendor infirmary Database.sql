/*
-----------------------------------------------------------
Create a Database to house Hospital information
--The database is called SplendorInfirmary
and
use the database to Create tables to house specific data:
	patients
	departments
	medical_records
	doctors
	appointments
-------------------------------------------------------------
*/
CREATE DATABASE SplendorInfirmary;
USE SplendorInfirmary;

CREATE TABLE patients (
    PatientId INT PRIMARY KEY IDENTITY(1,1)
    ,Prefix VARCHAR(10)
    ,FirstName VARCHAR(50) NOT NULL
    ,LastName VARCHAR(50) NOT NULL
	,DateOfBirth DATE NOT NULL
    ,Insurance VARCHAR(50)
    ,Gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')) 
	,MaritalStatus VARCHAR(20) CHECK(Maritalstatus IN ('Single', 'Married', 'Divorced', 'Widowed'))
    ,Race VARCHAR(50)
    ,Address VARCHAR(100)
    ,City VARCHAR(50)
    ,EmailAddress VARCHAR(100) UNIQUE 
    ,PhoneNumber VARCHAR(15) UNIQUE 
);
-- New column to record the date when a patient leaves
ALTER TABLE patients
ADD DateLeft DATE NULL;

CREATE TABLE departments (
    DepartmentId INT PRIMARY KEY IDENTITY(100,1)
    ,DepartmentName VARCHAR(50) NOT NULL   
);

CREATE TABLE medical_records (
    RecordId INT PRIMARY KEY IDENTITY(1,1)
    ,PatientId INT NOT NULL
	,DepartmentId INT NOT NULL
    ,DiagnosisHistory TEXT
    ,SpecialityVisited VARCHAR(100)
    ,StartDate DATE
    ,EndDate DATE
    ,AdmissionType VARCHAR(20) CHECK (AdmissionType IN ('Regular','Daycase', 'Emergency', 'Inpatient', 'Outpatient'))
    ,Prescription TEXT
    ,Allergies TEXT DEFAULT 'No Allergies'
	,Cost DECIMAL(10, 2) CHECK (Cost >= 0)
    ,FOREIGN KEY (PatientId) REFERENCES patients(PatientId) ON DELETE CASCADE ON UPDATE CASCADE	
	,FOREIGN KEY (DepartmentId) REFERENCES departments(DepartmentId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE doctors (
    DoctorId INT PRIMARY KEY IDENTITY(1000,1)
	,FirstName VARCHAR(20)
	,Lastname CHAR(1)
	,Speciality VARCHAR(50)
    ,DepartmentId INT NOT NULL
    ,Rank VARCHAR(50) CHECK (Rank IN ('Junior', 'Senior', 'Specialist', 'Consultant'))
    ,FOREIGN KEY (departmentId) REFERENCES departments(DepartmentId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE appointments (
    AppointmentId INT PRIMARY KEY IDENTITY(1,1)
    ,DoctorId INT NOT NULL
    ,PatientId INT NOT NULL
    ,Date DATE NOT NULL
    ,Time TIME NOT NULL
    ,Status VARCHAR(50) CHECK (Status IN ('Scheduled', 'Completed', 'Canceled'))
    ,BookingStatus VARCHAR(50) CHECK (BookingStatus IN ('Rebooked', 'Not Rebooked','Done')) DEFAULT 'Done'
	,TreatmentOutcome TEXT
    ,FOREIGN KEY (DoctorId) REFERENCES Doctors(DoctorId) ON DELETE CASCADE
    ,FOREIGN KEY (PatientId) REFERENCES Patients(PatientId) ON DELETE CASCADE
);

-- create a trigger to check if the status is changed to "Canceled" and ensure that the appointment is rebooked
CREATE TRIGGER rebooking
ON appointments
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Status = 'Canceled' AND BookingStatus = 'Not Rebooked')
    BEGIN
        RAISERROR ('Appointment is canceled. You must rebook the appointment before proceeding.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

SELECT * FROM patients
SELECT * FROM departments
SELECT * FROM appointments
SELECT * FROM medical_records
SELECT * FROM doctors

--alter the appointments table to add the constraint to check that the appointment date is not in the past.
ALTER TABLE appointments
ADD CONSTRAINT NoPastAppointmentDates
CHECK (Date >= CAST(GETDATE() AS DATE));

--Query the database to list all the patients who are older than 40 and have cancer in their diagnosis.
--perform a left Join between the patients and the medical records tables
SELECT p.*,mr.DiagnosisHistory
FROM patients p
LEFT JOIN medical_records mr ON p.PatientId = mr.PatientId
WHERE DATEDIFF(YEAR, p.DateOfBirth, GETDATE()) > 40 
  AND (mr.DiagnosisHistory LIKE '%Cancer%');

--Query the database to get information that allows the hospital to identify the number of completed appointments with the specialty of doctors as ‘Gastroenterologists’.
--perform a left Join between the appointments and the doctors tables
SELECT a.*,d.Speciality
FROM appointments a
LEFT JOIN doctors d ON a.DoctorId = d.DoctorId
WHERE a.Status = 'Completed' AND d.Speciality = 'Gastroenterologist';
