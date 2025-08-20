#!/bin/bash

CONTAINER=clickhouse-server
DB=dwh_sales

echo "Načítám customers_dim.csv ..."
docker exec -i $CONTAINER clickhouse-client --query="INSERT INTO $DB.dim_customers FORMAT CSVWithNames" < ./data/customers_dim.csv

echo "Načítám date_dim.csv ..."
docker exec -i $CONTAINER clickhouse-client --query="INSERT INTO $DB.dim_date FORMAT CSVWithNames" < ./data/date_dim.csv

echo "Načítám purchases_dim.csv ..."
docker exec -i $CONTAINER clickhouse-client --query="INSERT INTO $DB.dim_purchases FORMAT CSVWithNames" < ./data/purchases_dim.csv

echo "Načítám fact_sales.csv ..."
docker exec -i $CONTAINER clickhouse-client --query="INSERT INTO $DB.fact_sales FORMAT CSVWithNames" < ./data/fact.csv

echo "Import dat hotový!"
