-- SQL 1: Průměrná útrata dle pohlaví a věku
SELECT c.age, c.gender, AVG(f.total_amount) AS avg_spent
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.age, c.gender
ORDER BY age DESC
INTO OUTFILE 'sql_1.csv' FORMAT CSV;