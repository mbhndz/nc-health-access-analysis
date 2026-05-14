-- Basic SQL queries for the NC county health analysis project.
-- These queries are intended as a small companion to the Python notebook.

-- 1. Preview the cleaned table.
SELECT *
FROM nc_county_health_analysis
LIMIT 10;

-- 2. Count the number of counties in the dataset.
SELECT COUNT(*) AS county_count
FROM nc_county_health_analysis;

-- 3. List counties by % fair or poor health, highest first.
SELECT
    County,
    "% Fair or Poor Health"
FROM nc_county_health_analysis
ORDER BY "% Fair or Poor Health" DESC
LIMIT 10;

-- 4. List counties by primary care physician access, highest first.
SELECT
    County,
    PCP_Ratio_Numeric
FROM nc_county_health_analysis
ORDER BY PCP_Ratio_Numeric DESC
LIMIT 10;

-- 5. Identify counties with above average % fair or poor Health
-- and better than average physician access.
SELECT
    County,
    "% Fair or Poor Health",
    PCP_Ratio_Numeric,
    "% Children in Poverty",
    "% Households with Broadband Access",
    "% Uninsured"
FROM nc_county_health_analysis
WHERE "% Fair or Poor Health" > (
    SELECT AVG("% Fair or Poor Health")
    FROM nc_county_health_analysis
)
AND PCP_Ratio_Numeric < (
    SELECT AVG(PCP_Ratio_Numeric)
    FROM nc_county_health_analysis
)
ORDER BY "% Fair or Poor Health" DESC;

-- 6. Summarize related variables for the full dataset.
SELECT
    AVG("% Children in Poverty") AS avg_child_poverty,
    AVG("% Households with Broadband Access") AS avg_broadband_access,
    AVG("% Uninsured") AS avg_uninsured
FROM nc_county_health_analysis;