-- ====================================================================
-- Project: Financial Customer Complaints Analysis
-- Script: 01_schema_setup.sql
-- Description: Creates the database schema and defines the table 
--              structure prior to importing cleaned data via the 
--              MySQL Table Data Import Wizard.
-- ====================================================================

-- Step 1: Create Database Schema
CREATE DATABASE IF NOT EXISTS financial_db;
USE financial_db;

-- Step 2: Drop existing table if re-running setup
DROP TABLE IF EXISTS complaints;

-- Step 3: Define Complaints Table Schema
CREATE TABLE complaints (
	complaints_id INT PRIMARY KEY,
    submittet_via VARCHAR(50),
    date_submitted DATE,
    date_received DATE,
    state VARCHAR(10),
    product VARCHAR(100),
    sub_product VARCHAR(100),
    issue VARCHAR(255),
    sub_issue VARCHAR(255),
    public_response VARCHAR(100),
    response_to_consumer VARCHAR(100),
    timely_response VARCHAR(10)
    );


-- Note: Once this script is executed in MySQL Workbench, use the 
-- Table Data Import Wizard (Right-click 'complaints' table > Table Data Import Wizard)
-- to populate the records from data/cleaned_data.csv.
