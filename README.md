# complaints_analysis_project
**This is a data analysis project that I have done on public data. The dataset is on financial customer complaints that I got from Mavern Analytics Data Playground.**

# Markdown
## 📊 Financial Customer Complaints Analysis 
**Executive Summary:** A data-driven analysis exploring financial customer complaints using Google Sheet, MySQL, and BI Power,  resulting in actionable recommendations to improve products with the most complaints by providing ideas to help lower the amount of complaints.  

## 📌 Business Overview & Problem 
**Context:** Financial industry specifically in customer service. 

**Objective:** Identifying the different products with most customer complaints, what those complaints are and if they were dealt with swiftly. 

**Key Business Question:** Checking and savings accounts experienced the most complaints with the biggest issues stemming from managing an account.  

## 🛠️ Tech Stack & Tools
**Data Processing & Analysis:**  MySQL and Excel

**Data Visualization:** Power BI

**Documentation & Presentation:** PDF/Canva

## 🔍 Key Insights & Findings
**Finding #1 - Complaints per Product:**
- Checkings/Savings accounts were the product with the most complaints. Amounting to 24.8K complaints  making up 40% of the total complaints made. Followed by Credit/Prepaid cards with 16.2K complaints, 26% of complaints. Credit report/repair with 7.7K complaints, 12.3K of complaints. Mortgages with 6.6K complaints, 10.6% of complaints. All other products individually made up less than 6%.

**Finding #2 - Top Issue:** 
- The biggest issue stems from “Managing an account” with the majority of the sub-issues being “Deposits and withdrawals” and “Problems using a debit or ATM card”. 

**Finding #3 - Complaints per Month:**
- The spring and summer months saw a slight influx in complaints with July seeing the biggest increase at 23.9%.

## 💡 Strategic Recommendations
- Customer FAQ Resources: Publish accessible product templates and video walkthroughs targeting top customer pain points to enable seamless self-service support.
- Employee Skills Training: Implement targeted quarterly training and practical exercises focusing on high-volume and time-intensive support issues to boost team resolution efficiency.
- Proactive Customer Engagement: Send regular bi-annual or quarterly reminders encouraging users to review the updated FAQ to resolve common issues proactively. 

## 📊 Presentation & Deliverables
- Slide Deck: View the full slide deck here. 
- Interactive Dashboard PDF: Explore the interactive PowerBI dashboard pdf here. 

## 🚀 How to Run the Analysis
Prerequisites
- Database: MySQL Server (v8.0+ recommended)
- GUI Tool: MySQL Workbench 
- Spreadsheet Software: Google Sheets or Microsoft Excel
- Visualization: Power BI Desktop

## 

**Step 1: Data Cleaning (Google Sheets / Excel)**
- Open data/raw_data.csv in Google Sheets or Excel.
- Perform initial data preparation (trimming whitespace, handling missing values, standardizing dates, and formatting text fields).
- Save the cleaned dataset as data/cleaned_data.xlsx or export it back to CSV for database loading.

## 

**Step 2: Database Setup & Query Execution (MySQL)**
	
	Using MySQL Workbench (GUI)

	Launch MySQL Workbench and connect to your local MySQL instance.
	Create a new database/schema:

  	CREATE DATABASE financial_db; 
	USE financial_db; 
	Import the data:
	•	Right-click financial_db in the Schemas pane.
	•	Select Table Data Import Wizard and select data/cleaned_data.xlsx (or .csv).
	•	Follow the prompts to set data types and create the target table (complaints).
	Execute SQL Analysis:
	•	Go to File > Open SQL Script... and select sql/02_analysis_queries.sql.
	•	Click the Lightning Bolt (⚡) icon to execute the analysis and view aggregated metrics.

**Step 3: Power BI Dashboard Visualization**
- Open Power BI Desktop.
- Connect to the MySQL Database (Get Data > MySQL Database) or import the processed .xlsx/.csv file directly from the data/ folder.
- If connecting to MySQL, enter server details (localhost), database name (financial_db), and run/load the required SQL queries or tables.
- Open dashboards/financial_complaints.pbix to view and interact with the pre-built visual dashboard.

## 👤 Author & Contact
- Name: Axel Campa
- LinkedIn: www.linkedin.com/in/axel-campa
- Email: axel.b.campa@gmail.com
