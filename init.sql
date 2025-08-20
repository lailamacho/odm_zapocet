CREATE DATABASE IF NOT EXISTS dwh_sales;
USE dwh_sales;

CREATE TABLE dim_customers (
    customer_id UInt32,
    gender String,
    age UInt8,
    PRIMARY KEY (customer_id)
) ENGINE = MergeTree()
ORDER BY customer_id;


CREATE TABLE dim_date (
    date_id UInt32,
    date Date,
    day UInt8,
    month UInt8,
    year UInt16,
    PRIMARY KEY (date_id)
) ENGINE = MergeTree()
ORDER BY date_id;


CREATE TABLE dim_purchases (
    transaction_id UInt32,
    product_category String,
    price Float32,
    PRIMARY KEY (transaction_id)
) ENGINE = MergeTree()
ORDER BY transaction_id;


CREATE TABLE fact_sales (
    customer_id UInt32,
    date_id UInt32,
    transaction_id UInt32,
    quantity UInt32,
    total_amount Float32
) ENGINE = MergeTree()
ORDER BY (customer_id, date_id, transaction_id);