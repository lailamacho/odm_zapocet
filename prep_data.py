import pandas as pd

INPUT_FILE = "./data/sales_data.csv"

OUTPUT_CUSTOMERS = "./data/customers_dim.csv"
OUTPUT_DATE = "./data/date_dim.csv"
OUTPUT_PURCHASES = "./data/purchases_dim.csv"
OUTPUT_FACT = "./data/fact.csv"

df = pd.read_csv(INPUT_FILE, dtype={'Transaction ID':str}, sep=",")
df.columns = ['transaction_id', 'date', 'customer_id', 'gender', 'age', 'product_category', 'quantity', 'price', 'total_amount']
df['customer_id'] = df['customer_id'].str.replace('CUST', '', regex=False).astype(int)
df['date'] = pd.to_datetime(df['date'], errors='coerce')
df.dropna()

# -- Dimenze Zákazníků 
customers_dim = df[['customer_id', 'gender', 'age']].drop_duplicates().reset_index(drop=True)
customers_dim.to_csv(OUTPUT_CUSTOMERS, index=False)

# -- Dimenze času
date_dim = df[['date']].drop_duplicates().reset_index(drop=True)
date_dim['date'] = pd.to_datetime(date_dim['date'], errors='coerce')
date_dim['day'] = date_dim['date'].dt.day
date_dim['month'] = date_dim['date'].dt.month
date_dim['year'] = date_dim['date'].dt.year
date_dim ['date_id'] = date_dim.index + 1
date_dim.to_csv(OUTPUT_DATE, index=False)

# -- Dimenze Objednávek
purchases_dim = df[['transaction_id', 'product_category', 'price']].drop_duplicates().reset_index(drop=True)
purchases_dim.to_csv(OUTPUT_PURCHASES, index=False)

# -- Tabulka Faktů
fact = df.merge(date_dim[['date', 'date_id']], on='date', how='left')
fact_table = fact[['customer_id', 'date_id', 'transaction_id', 'quantity', 'total_amount']]
fact_table.to_csv(OUTPUT_FACT, index=False)