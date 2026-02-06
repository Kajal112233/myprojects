Select * from "Loan "."Finance";
-- Business question : What is the total loan amount issued by the company?
SELECT 
    SUM(loan_amount) AS total_loan_amount
FROM "Loan "."Finance";
--Answer: Shows the company’s total lending exposure and portfolio size.

-- Business question : How many loans are fully paid, charged off, or currently active?
SELECT 
    loan_status,
    COUNT(*) AS total_loans
FROM "Loan "."Finance"
GROUP BY loan_status
ORDER BY total_loans DESC;
-- Answer: Helps assess portfolio health and default distribution.

-- Average Loan Amount by Home Ownership

--Business question: Does home ownership impact the average loan amount?

SELECT 
    home_ownership,
    ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM "Loan "."Finance"
GROUP BY home_ownership;
--Answer: Homeowners generally qualify for higher loan amounts due to lower risk.

-- State-wise Loan Applications
-- Business question: Which states have the highest number of loan applications?
SELECT 
    address_state,
    COUNT(*) AS total_loans
FROM "Loan "."Finance" 
GROUP BY address_state
ORDER BY total_loans DESC;
--Answer: Identifies high-performing regions for targeted marketing.

--Interest Rate Analysis by Loan Grade
--Business question: How do interest rates vary across different loan grades?

SELECT 
    grade,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM "Loan "."Finance" 
GROUP BY grade
ORDER BY grade;
-- Answer: Confirms risk-based pricing—lower grades attract higher interest rates.

--Borrower Income by Loan Grade
--Business question: What is the average annual income of borrowers for each loan grade?

SELECT 
    grade,
    ROUND(AVG(annual_income), 2) AS avg_annual_income
FROM "Loan "."Finance" 
GROUP BY grade
ORDER BY grade;
--Answer: Higher-grade borrowers generally have higher income levels.

--Loan Purpose Funding Analysis
--Business question: Which loan purpose receives the highest total funding?

SELECT 
    purpose,
    SUM(loan_amount) AS total_loan_amount
FROM "Loan "."Finance" 
GROUP BY purpose
ORDER BY total_loan_amount DESC;
-- Answer: Helps understand customer borrowing behavior and demand trends.

--Default Risk – Charged Off Loans
--Business question: What is the average loan amount for charged-off loans?

SELECT 
    ROUND(AVG(loan_amount), 2) AS avg_defaulted_loan
FROM "Loan "."Finance" 
WHERE loan_status = 'Charged Off';
--Answer: Used to estimate financial loss due to defaults.
--Loan Term Preference
--Business question: How are loans distributed across different loan terms?
SELECT 
    term,
    COUNT(*) AS total_loans
FROM "Loan "."Finance" 
GROUP BY term;
-- Answer: Shows borrower preference for short-term vs long-term loans.

--Debt-to-Income (DTI) Risk Analysis
--Business question: How does the average DTI vary by loan status?

SELECT 
    loan_status,
    ROUND(AVG(dti), 3) AS avg_dti
FROM "Loan "."Finance" 
GROUP BY loan_status;

-- Answer: Helps flag high-risk borrowers for tighter credit control.



