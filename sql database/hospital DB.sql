create database hdb;
use hdb;

-- Table: Department
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(45)
);

INSERT INTO Department VALUES 
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'Radiology');

-- Table: Role
CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    RoleDesc VARCHAR(45)
);

INSERT INTO Role VALUES 
(1, 'Doctor'),
(2, 'Nurse'),
(3, 'Technician'),
(4, 'Receptionist'),
(5, 'Administrator');

-- Table: Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeNumber VARCHAR(45),
    EmailID VARCHAR(45),
    Password VARCHAR(45),
    CreatedBy INT,
    CreatedOn DATETIME
);

INSERT INTO Employee VALUES 
(1, 'E001', 'doc1@example.com', 'password123', 1, '2024-01-01 10:00:00'),
(2, 'E002', 'nurse1@example.com', 'password123', 1, '2024-01-02 10:00:00'),
(3, 'E003', 'tech1@example.com', 'password123', 1, '2024-01-03 10:00:00'),
(4, 'E004', 'rec1@example.com', 'password123', 1, '2024-01-04 10:00:00'),
(5, 'E005', 'admin@example.com', 'password123', 1, '2024-01-05 10:00:00');

-- Table: EmployeeDetails
CREATE TABLE EmployeeDetails (
    EmployeeDetailsID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(45),
    RoleID INT,
    CreatedOn DATETIME,
    ModifiedOn DATETIME,
    EmployeeID INT,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO EmployeeDetails VALUES 
(1, 'John', 'Doe', '1980-05-15', 'Male', '1234567890', 1, '2024-01-01 10:00:00', NULL, 1),
(2, 'Jane', 'Smith', '1990-08-25', 'Female', '1234567891', 2, '2024-01-02 10:00:00', NULL, 2),
(3, 'Mike', 'Brown', '1975-03-10', 'Male', '1234567892', 3, '2024-01-03 10:00:00', NULL, 3),
(4, 'Emma', 'Wilson', '1985-12-20', 'Female', '1234567893', 4, '2024-01-04 10:00:00', NULL, 4),
(5, 'Sophia', 'Davis', '2000-09-14', 'Female', '1234567894', 5, '2024-01-05 10:00:00', NULL, 5);

-- Table: EmployeeDepartment
CREATE TABLE EmployeeDepartment (
    EmployeeID INT,
    DepartmentID INT,
    IsActive BIT,
    PRIMARY KEY (EmployeeID, DepartmentID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO EmployeeDepartment VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- Table: Patient
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientRegNo VARCHAR(45),
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(45),
    EmailID VARCHAR(45),
    Height VARCHAR(10),
    Weight VARCHAR(10),
    BloodGroup VARCHAR(10),
    CreatedOn DATETIME,
    ModifiedOn DATETIME
);

INSERT INTO Patient VALUES 
(1, 'P001', 'John', 'Doe', '1980-05-15', 'Male', '1234567890', 'john.doe@example.com', '180', '75', 'O+', '2024-01-01 10:00:00', NULL),
(2, 'P002', 'Jane', 'Smith', '1990-08-25', 'Female', '1234567891', 'jane.smith@example.com', '165', '60', 'A+', '2024-01-02 10:00:00', NULL),
(3, 'P003', 'Mike', 'Brown', '1975-03-10', 'Male', '1234567892', 'mike.brown@example.com', '175', '80', 'B-', '2024-01-03 10:00:00', NULL),
(4, 'P004', 'Emma', 'Wilson', '1985-12-20', 'Female', '1234567893', 'emma.wilson@example.com', '170', '65', 'AB+', '2024-01-04 10:00:00', NULL),
(5, 'P005', 'Sophia', 'Davis', '2000-09-14', 'Female', '1234567894', 'sophia.davis@example.com', '160', '50', 'O-', '2024-01-05 10:00:00', NULL);

-- Table: PatientInsurance
CREATE TABLE PatientInsurance (
    PatientInsuranceID INT PRIMARY KEY,
    PatientID INT,
    ProviderName VARCHAR(45),
    GroupNumber VARCHAR(45),
    InsuranceNumber VARCHAR(45),
    InNetworkCoPay INT,
    OutNetworkCoPay INT,
    StartDate DATETIME,
    EndDate DATETIME,
    IsCurrent BIT,
    CreatedOn DATETIME,
    ModifiedOn DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO PatientInsurance VALUES 
(1, 1, 'Aetna', 'G12345', 'IN12345', 20, 50, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1, '2024-01-01 10:00:00', NULL),
(2, 2, 'Blue Cross', 'G67890', 'IN67890', 15, 40, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1, '2024-01-02 10:00:00', NULL),
(3, 3, 'Cigna', 'G11111', 'IN11111', 25, 60, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1, '2024-01-03 10:00:00', NULL),
(4, 4, 'United Health', 'G22222', 'IN22222', 30, 70, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1, '2024-01-04 10:00:00', NULL),
(5, 5, 'Humana', 'G33333', 'IN33333', 10, 30, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1, '2024-01-05 10:00:00', NULL);



-- Table: Disease
CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    Name VARCHAR(45)
);

INSERT INTO Disease VALUES 
(1, 'Hypertension'),
(2, 'Diabetes'),
(3, 'Asthma'),
(4, 'Arthritis'),
(5, 'Migraine');

-- Table: PatientDisease
CREATE TABLE PatientDisease (
    PatientRegisterID INT,
    DiseaseID INT,
    PRIMARY KEY (PatientRegisterID, DiseaseID),
    FOREIGN KEY (PatientRegisterID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DiseaseID) REFERENCES Disease(DiseaseID)
);

INSERT INTO PatientDisease VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Table: PatientAppointment
CREATE TABLE PatientAppointment (
    PatientID INT,
    EmployeeID INT,
    AppointmentDate DATETIME,
    IsComplete BIT,
    IsCanceled BIT,
    IsNoShow BIT,
    CreatedBy INT,
    CreatedOn DATETIME,
    PRIMARY KEY (PatientID, EmployeeID, AppointmentDate),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO PatientAppointment VALUES 
(1, 1, '2024-01-10 09:00:00', 1, 0, 0, 1, '2024-01-01 10:00:00'),
(2, 2, '2024-01-11 10:00:00', 1, 0, 0, 1, '2024-01-02 10:00:00'),
(3, 3, '2024-01-12 11:00:00', 1, 0, 0, 1, '2024-01-03 10:00:00'),
(4, 4, '2024-01-13 14:00:00', 1, 0, 0, 1, '2024-01-04 10:00:00'),
(5, 5, '2024-01-14 15:00:00', 1, 0, 0, 1, '2024-01-05 10:00:00');

-- Table: Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    FromPatientID INT,
    ToEmployeeID INT,
    Comment VARCHAR(255),
    Rating VARCHAR(45),
    CreatedOn DATETIME,
    FOREIGN KEY (FromPatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (ToEmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Feedback VALUES 
(1, 1, 1, 'Excellent service', '5', '2024-01-01 10:00:00'),
(2, 2, 2, 'Very helpful', '4', '2024-01-02 10:00:00'),
(3, 3, 3, 'Friendly staff', '5', '2024-01-03 10:00:00'),
(4, 4, 4, 'Good experience', '4', '2024-01-04 10:00:00'),
(5, 5, 5, 'Highly recommended', '5', '2024-01-05 10:00:00');

-- Table: AddressType
CREATE TABLE AddressType (
    AddressTypeID INT PRIMARY KEY,
    Type VARCHAR(45)
);

INSERT INTO AddressType VALUES 
(1, 'Home'),
(2, 'Work'),
(3, 'Billing'),
(4, 'Temporary'),
(5, 'Permanent');

-- Table: PatientAddressMapping
CREATE TABLE PatientAddressMapping (
    PatientAddressMappingID INT PRIMARY KEY,
    PatientID INT,
    AddressTypeID INT,
    AddressID INT,
    IsActive BIT,
    CreatedOn DATETIME,
    ModifiedOn DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (AddressTypeID) REFERENCES AddressType(AddressTypeID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

INSERT INTO PatientAddressMapping VALUES 
(1, 1, 1, 1, 1, '2024-01-01 10:00:00', NULL),
(2, 2, 2, 2, 1, '2024-01-02 10:00:00', NULL),
(3, 3, 3, 3, 1, '2024-01-03 10:00:00', NULL),
(4, 4, 4, 4, 1, '2024-01-04 10:00:00', NULL),
(5, 5, 5, 5, 1, '2024-01-05 10:00:00', NULL);

-- Table: PatientBilling
CREATE TABLE PatientBilling (
    PatientBillingID INT PRIMARY KEY,
    PatientID INT,
    TransactionDesc VARCHAR(45),
    Amount DECIMAL(8, 2),
    PaidDate DATETIME,
    Type VARCHAR(45),
    CreatedOn DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO PatientBilling VALUES 
(1, 1, 'Consultation Fee', 200.00, '2024-01-01 10:00:00', 'Credit', '2024-01-01 10:00:00'),
(2, 2, 'Lab Test', 150.00, '2024-01-02 11:00:00', 'Debit', '2024-01-02 11:00:00'),
(3, 3, 'Medication', 75.00, '2024-01-03 12:00:00', 'Credit', '2024-01-03 12:00:00'),
(4, 4, 'Surgery Fee', 500.00, '2024-01-04 13:00:00', 'Debit', '2024-01-04 13:00:00'),
(5, 5, 'Room Charges', 300.00, '2024-01-05 14:00:00', 'Credit', '2024-01-05 14:00:00');


CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    Address1 VARCHAR(45),
    Address2 VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    Zipcode VARCHAR(45),
    IsActive BIT,
    CreatedOn DATETIME,
    ModifiedOn DATETIME
);

INSERT INTO Address VALUES
(1, '123 Main St', 'Apt 1', 'New York', 'NY', '10001', 1, '2024-01-01 10:00:00', NULL),
(2, '456 Elm St', 'Suite 202', 'Los Angeles', 'CA', '90001', 1, '2024-01-02 11:00:00', NULL),
(3, '789 Oak St', NULL, 'Chicago', 'IL', '60007', 1, '2024-01-03 12:00:00', NULL),
(4, '321 Maple St', 'Unit B', 'Houston', 'TX', '77001', 1, '2024-01-04 13:00:00', NULL),
(5, '654 Pine St', NULL, 'Miami', 'FL', '33101', 1, '2024-01-05 14:00:00', NULL);

show tables;
