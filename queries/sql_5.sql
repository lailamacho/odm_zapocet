-- SQL 5: Počet objednávek dle věkových skupin
SELECT
    CASE
        WHEN c.age < 20 THEN 'under_20'
        WHEN c.age BETWEEN 20 AND 39 THEN '20_39'
        WHEN c.age BETWEEN 40 AND 59 THEN '40_59'
        ELSE '60_plus'
    END AS age_group,
    COUNT(*) AS orders
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY age_group
ORDER BY orders DESC
INTO OUTFILE 'sql_5.csv' FORMAT CSV;