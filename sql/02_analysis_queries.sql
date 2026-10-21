-- Inserted csv file with table data import wizard along with creating new table
-- ====================================================================
-- Project: Financial Customer Complaints Analysis
-- Script: 02_analysis_queries.sql
-- Description: Writing query scripts to rename columns, change data types
--              finding duplicates, finding # of complaints per products,
--              finding top issues per product and etc. 
-- ====================================================================

-- Renaming Columns
ALTER TABLE `financial_complaints`
RENAME COLUMN `Complaint ID` TO Complaint_ID,
RENAME COLUMN `Submitted via` TO Submitted_via,
RENAME COLUMN `Date submitted` TO Date_submitted,
RENAME COLUMN `Date received` TO Date_received,
RENAME COLUMN `Sub-product` TO Sub_product,
RENAME COLUMN `Sub-issue` TO Sub_issue,
RENAME COLUMN `Company public response` TO Public_response,
RENAME COLUMN `Company response to consumer` TO Response_to_customer,
RENAME COLUMN `Timely response?` TO Timely_response;

-- Replacing Date Submitted/received into DATE data type 
ALTER TABLE  `financial_complaints` 
MODIFY COLUMN Date_submitted DATE,
MODIFY COLUMN Date_received DATE; 

-- Replacing Blank cells into NULL cells
UPDATE `financial_complaints`
SET Complaint_ID = NULLIF(Complaint_ID, ''),
	Submitted_via = NULLIF(Submitted_via, ''),
    State = NULLIF(State, ''),
    Product = NULLIF(Product, ''),
    Sub_product = NULLIF(Sub_product, ''),
    Issue = NULLIF(Issue, ''),
    Sub_issue = NULLIF(Sub_issue, ''),
    Cmpy_pblc_response = NULLIF(Cmpy_pblc_response, ''),
    Response_consumer = NULLIF(Response_consumer, ''),
    Timely_response = NULLIF(Timely_response, '');
    
-- Finding Dulpicate Complaints
SELECT Complaint_ID, COUNT(*) AS occurrence
FROM `financial_complaints`
GROUP BY Complaint_ID
HAVING occurrence > 1;

-- Finding the total of Complaints
SELECT COUNT(*)
FROM `financial_complaints`;

-- Finding the different products
SELECT Product, COUNT(*) AS Num_Complaints
FROM financial_complaints
GROUP BY Product
ORDER BY COUNT(*) DESC;

-- Finding the top issues in the products with most issues
SELECT Issue, COUNT(*)
FROM financial_complaints
WHERE Product IN ('Checking or savings account', 'Credit card or prepaid card')
GROUP BY Issue
HAVING COUNT(*) > 2000
ORDER BY COUNT(*) DESC, Issue;

-- Finding the different sub-products
SELECT Sub_product, COUNT(*) AS Num_Complaints
FROM financial_complaints
GROUP BY Sub_product
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Finding the most common issues
SELECT Issue, COUNT(*) AS Num_Complaints
FROM financial_complaints
GROUP BY Issue
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Find the Top Sub-issues in Top Issues
SELECT Sub_issue, COUNT(*)
FROM `financial_complaints`
WHERE Issue IN ('Managing an account', 'Problem with a purchase shown on your statement')
GROUP BY Sub_Issue
ORDER BY COUNT(*) DESC, Sub_issue;

-- Find the different issues for the different products 
SELECT Product, Issue, COUNT(*)
FROM `financial_complaints`
GROUP BY Product, Issue
ORDER BY COUNT(Issue) DESC;

-- Product, Issues, Sub-issue
SELECT Product, Issue, Sub_issue, COUNT(*)
FROM financial_complaints
GROUP BY Product, Issue, Sub_issue
ORDER BY COUNT(*) DESC;

-- Different Top sub-issues for issues with 'Managing an account'
SELECT Issue, Sub_issue, COUNT(Issue)
FROM financial_complaints
WHERE Issue = 'Managing an account'
GROUP BY Issue, Sub_issue
ORDER BY COUNT(Issue) DESC;

-- Find the different issues for the different sub-products 
SELECT Issue, Sub_issue, COUNT(Sub_issue)
FROM `financial_complaints`
GROUP BY Issue, Sub_issue
HAVING COUNT(Sub_issue) > 2000
ORDER BY COUNT(Sub_issue) DESC;

-- Finding the amount of issues per month 
SELECT EXTRACT(MONTH FROM Date_submitted) AS Month, COUNT(Issue) AS Num_issues
FROM financial_complaints
GROUP BY EXTRACT(MONTH FROM Date_submitted)
ORDER BY EXTRACT(MONTH FROM Date_submitted) ASC;

-- Amount of timely repsonses to the amount of untimely responses 
SELECT Timely_response, COUNT(*)
FROM `financial_complaints`
GROUP BY Timely_response;

-- Finding the most common issues for untimely responses with
SELECT Issue, COUNT(*)
FROM `financial_complaints`
WHERE Timely_response = "No"
GROUP BY Timely_response, Issue
HAVING COUNT(*) > 100
ORDER BY COUNT(*) DESC;

-- Biggest Issue for every product
WITH ranked_counts AS (
	SELECT 
		Product, Issue, COUNT(*) AS Num_Issues,
	DENSE_RANK() OVER (PARTITION BY Product ORDER BY COUNT(*) DESC) AS rnk
	FROM `financial_complaints`
    GROUP BY Product, Issue
)
SELECT Product, Issue, Num_Issues
FROM ranked_counts
WHERE rnk = 1;
