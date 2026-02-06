--Most Common Job Titles
SELECT "Job Title", COUNT(*) AS job_count
FROM glassdoor
GROUP BY "Job Title"
ORDER BY job_count DESC;


 --Job Availability by Sector
 SELECT "Sector", COUNT(*) AS total_jobs
FROM glassdoor
GROUP BY "Sector"
ORDER BY total_jobs DESC;
--Insight

--Newly Established vs. Established Companies
SELECT CASE 
    WHEN "Founded" >= 2000 THEN 'New'
    WHEN "Founded" BETWEEN 1980 AND 1999 THEN 'Mid-age'
    ELSE 'Established'
    END AS company_age_group, COUNT(*) AS company_count
FROM glassdoor
GROUP BY company_age_group
ORDER BY company_count DESC;


--Most Competitive Companies
SELECT "Company Name", COUNT(DISTINCT "Competitors") AS competitor_count
FROM glassdoor
GROUP BY "Company Name"
ORDER BY competitor_count DESC
LIMIT 10;


--Rating vs. Founded Year Relationship
SELECT "Founded", AVG("Rating") AS avg_rating
FROM glassdoor
GROUP BY "Founded"
ORDER BY avg_rating DESC;


--Job Count by Ownership Type
SELECT "Type of ownership", COUNT(*) AS job_count
FROM glassdoor
GROUP BY "Type of ownership"
ORDER BY job_count DESC;

--Highest Rated Companies for Each Industry
SELECT "Industry", "Company Name", MAX("Rating") AS highest_rating
FROM glassdoor
GROUP BY "Industry", "Company Name"
ORDER BY highest_rating DESC;

--Competitor Information for Top-Rated Companies
SELECT "Company Name", "Competitors"
FROM glassdoor
WHERE "Rating" >= 4.5;






 
