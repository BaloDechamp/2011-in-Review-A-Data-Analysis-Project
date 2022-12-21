-- TATA Virtual Experience on FORAGE

-- Data Cleaning Exercise

-- Creating the Schema for this project
CREATE SCHEMA online_store;

-- Using the newly created database
USE online_store;

-- Creating the Table to store the provided data

DROP TABLE IF EXISTS dataset;

CREATE TABLE dataset (
Invoice_No VARCHAR(250),
Stoke_Code VARCHAR(50),
Description VARCHAR(250),
Quantity INT,
Invoice_Date DATE,
Unit_Price DECIMAL(10,2),
Customer_Id VARCHAR(250),
Country VARCHAR(250)
);

-- Previewing the table created
SELECT * FROM dataset;

-- Loading the provided into the Table created.
LOAD DATA INFILE "C:/Program Files/MySQL/Data_Set/Online Retail Data Set.csv" INTO TABLE dataset
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Previewing the table to confirm the update
SELECT * FROM dataset;

/*
Previewing the incorrect rows in the dataset
The incorrect rows in the dataset are rows with Quantity less than 1 and Unit_Price less than 0.
*/
SELECT * 
FROM dataset
WHERE Quantity < 1 OR Unit_Price <= 0;

/*
We have a total of 11,890 rows that are incorrect rows. I will proceed to remove these rows from the dataset
*/
DELETE FROM dataset
	WHERE Quantity < 1 OR Unit_Price <= 0;
    
-- Previewing the table to confirm the update
SELECT * FROM dataset;
    
