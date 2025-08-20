-- SQL 4: Top kategorie podle tržeb
SELECT p.product_category, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_purchases p ON f.transaction_id = p.transaction_id
GROUP BY p.product_category
ORDER BY revenue DESC
INTO OUTFILE 'sql_4.csv' FORMAT CSV;