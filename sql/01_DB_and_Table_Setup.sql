CREATE DATABASE ML_DENTAL_DB;
USE ML_DENTAL_DB;
CREATE TABLE cleaned_data (
    `Patient ID` VARCHAR(10),
    `Patient Name` VARCHAR(100),
    `Gender` VARCHAR(10),
    `Age` INT,
    `Visit Date` DATE,
    `Address` VARCHAR(255),
    `Consulted By` VARCHAR(50),
    `Treatment` VARCHAR(100),
    `Dental Camp` VARCHAR(10),
    `X-Ray Done` VARCHAR(10),
    `Patient Type` VARCHAR(50),
    `Treatment Type` VARCHAR(100),
    `Treatment Cost` INT,
    `OPD Cost` INT,
    `Lab Charges` INT,
    `X-Ray Cost` INT,
    `Discount` INT,
    `Total Paid` INT,
    `Due` INT,
    `Profit` INT,
    `Payment method` VARCHAR(50),
    Visit_Month VARCHAR(20)
);

 

 
