-- 1. View first 100 records
SELECT * FROM cleaned_data LIMIT 100;

-- 2. Count of total number of patients
SELECT COUNT(*) AS total_patients FROM cleaned_data;

-- 3. Calculated total revenue
SELECT SUM(`Total Paid`) AS total_revenue FROM cleaned_data;

-- 4. Count of each treatment type (excluding OPD/X-Ray only)
SELECT 
  Treatment AS treatment_type, 
  COUNT(*) AS treatment_count
FROM cleaned_data
WHERE Treatment IS NOT NULL 
  AND Treatment NOT IN ('OPD', 'OPD + X-Ray')
GROUP BY Treatment
ORDER BY treatment_count DESC;

-- 5. Monthly revenue trend
SELECT 
  DATE_FORMAT(`Visit Date`, '%Y-%m') AS year_months,
  SUM(`Total Paid`) AS monthly_revenue
FROM cleaned_data
GROUP BY year_months
ORDER BY year_months;

-- 6. Patients with pending dues
SELECT 
  `Patient ID`, 
  `Patient Name`, 
  `Total Paid`, 
  `Due`
FROM cleaned_data
WHERE `Due` > 0
ORDER BY `Due` DESC;

-- 7. Top 10 revenue-generating locations
SELECT 
  Address AS location,
  COUNT(*) AS total_patients,
  SUM(`Total Paid`) AS total_revenue
FROM cleaned_data
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;

-- 8. Most common treatments done (excluding OPD/X-Ray)
SELECT 
  Treatment AS treatment_type,
  COUNT(*) AS total_cases,
  SUM(`Total Paid`) AS total_revenue
FROM cleaned_data
WHERE Treatment IS NOT NULL 
  AND Treatment NOT IN ('OPD', 'OPD + X-Ray')
GROUP BY treatment_type
ORDER BY total_cases DESC;

-- 9. Doctor-wise performance report
SELECT 
  `Consulted By` AS doctor,
  COUNT(*) AS total_patients,
  SUM(`Total Paid`) AS total_revenue,
  AVG(Profit) AS avg_profit_per_patient
FROM cleaned_data
WHERE Treatment IS NOT NULL 
  AND Treatment NOT IN ('OPD', 'OPD + X-Ray')
GROUP BY doctor
ORDER BY total_revenue DESC;

-- 10. Area-wise patient distribution
SELECT 
  Address AS area,
  COUNT(*) AS total_patients,
  SUM(`Total Paid`) AS total_revenue
FROM cleaned_data
GROUP BY area
ORDER BY total_patients DESC;

-- 11. Treatment-wise revenue analysis
SELECT 
  Treatment AS treatment_type,
  COUNT(*) AS total_cases,
  SUM(`Total Paid`) AS total_revenue,
  SUM(Profit) AS total_profit
FROM cleaned_data
GROUP BY treatment_type
ORDER BY total_revenue DESC;

-- 12. Doctor-wise profit contribution (with percentage)
SELECT 
  `Consulted By` AS doctor_name,
  COUNT(*) AS total_patients,
  SUM(`Total Paid`) AS total_revenue,
  SUM(Profit) AS total_profit,
  ROUND((SUM(Profit) / (SELECT SUM(Profit) FROM cleaned_data)) * 100, 2) AS profit_percentage
FROM cleaned_data
GROUP BY doctor_name
ORDER BY total_profit DESC;

-- 13. Number of free OPD patients from camps
SELECT 
  COUNT(*) AS free_opd_patients
FROM cleaned_data
WHERE `Total Paid` = 0 AND `Treatment` IN ('OPD', 'OPD + X-Ray');
