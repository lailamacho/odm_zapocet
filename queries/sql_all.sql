-- Prodeje podle roku a pohlaví
SELECT d.year, c.gender, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, c.gender
ORDER BY d.year, c.gender;

-- Top kategorie podle tržeb
SELECT p.product_category, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_purchases p ON f.transaction_id = p.transaction_id
GROUP BY p.product_category
ORDER BY revenue DESC;

-- Denní průměrná útrata zákazníků
SELECT d.date, AVG(f.total_amount) AS avg_spent
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.date
ORDER BY d.date;

-- Počet objednávek podle věkových skupin
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
ORDER BY orders DESC;
INTO OUTFILE 'count_age.csv' FORMAT CSV;


-- Útrata dle pohlaví a věku
SELECT c.age, c.gender, SUM(f.total_amount) AS total_spent
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.age, c.gender
ORDER BY age DESC;


-- export do CSV
INTO OUTFILE './customer_spending.csv' FORMAT CSV;

-- Celkové tržby dle jednotlivých měsíců
SELECT d.month, SUM(f.total_amount) AS revenue
FROM fact_sales f 
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.month
ORDER BY month;


--
-- cluster_1 sql_dm.csv
SELECT c.age, AVG(f.total_amount) AS avg_spent
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.age
ORDER BY age
INTO OUTFILE 'sql_dm.csv' FORMAT CSV;

-- Cluster 2 mining.csv
SELECT
    c.customer_id,
    c.age,
    c.gender,
    SUM(f.total_amount) AS total_spent,
    COUNT(f.transaction_id) AS num_transactions
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.age, c.gender
INTO OUTFILE 'mining.csv' FORMAT CSVWithNames;

