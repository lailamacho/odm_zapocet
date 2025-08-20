-- SQL 3: Průměrná cena produktu v jednotlivých kategoriích
SELECT p.product_category, AVG(p.price) AS avg_price
FROM fact_sales f
JOIN dim_purchases p ON f.transaction_id = p.transaction_id
GROUP BY p.product_category
ORDER BY avg_price DESC
INTO OUTFILE 'sql_3.csv' FORMAT CSV;