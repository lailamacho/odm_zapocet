Spuštění Dockeru na pozadí:
docker compose up -d

Načtení dat (nejdřive chmod +x load_data.sh)
./load_data.sh

Spuštění interaktivního klienta
docker exec -it clickhouse-server clickhouse-client

Test načtení dat:
docker exec -it clickhouse-server clickhouse-client -d dwh_sales --query "SELECT count() FROM fact_sales;

Spuštění SQL dotazů:
docker exec -i clickhouse-server clickhouse-client < queries/SQL_file.sql

* uložení výsledku do csv pro následnou vizualizaci:
docker exec -i clickhouse-server clickhouse-client --format CSV < queries/SQL_file.sql > results/SQL_file.csv

Ukončení včetně smazaní volumes:
docker compose down -v