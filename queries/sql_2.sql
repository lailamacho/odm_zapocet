-- SQL 2: Celkové tržby dle jednotlivých měsíců
SELECT d.month, SUM(f.total_amount) AS revenue
FROM fact_sales f 
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.month
ORDER BY month
INTO OUTFILE 'sql_2.csv' FORMAT CSV;