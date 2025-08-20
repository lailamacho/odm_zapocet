import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Nastavení stylu
sns.set_theme(style="whitegrid", palette="muted", font_scale=1.2)

# Průměrná útrata dle pohlaví a věku
df1 = pd.read_csv("./outputs/sql_1.csv", names=["age", "gender", "avg_spent"])
plt.figure(figsize=(10,6))
sns.lineplot(data=df1, x="age", y="avg_spent", hue="gender", marker="o")
plt.title("Průměrná útrata dle pohlaví a věku")
plt.xlabel("Věk")
plt.ylabel("Průměrná útrata")
plt.tight_layout()
plt.savefig(fname='./outputs/sql_1.png')


# Celkové tržby dle jednotlivých měsíců
df2 = pd.read_csv("./outputs/sql_2.csv", names=["month", "revenue"])
plt.figure(figsize=(8,6))
sns.barplot(data=df2, x="month", y="revenue", color="skyblue")
plt.title("Celkové tržby dle jednotlivých měsíců")
plt.xlabel("Měsíc")
plt.ylabel("Tržby")
plt.tight_layout()
plt.savefig(fname='./outputs/sql_2.png')


# Průměrná cena produktu v jednotlivých kategoriích
df3 = pd.read_csv("./outputs/sql_3.csv", names=["product_category", "avg_price"])
plt.figure(figsize=(10,6))
sns.barplot(data=df3, x="avg_price", y="product_category", palette="viridis")
plt.title("Průměrná cena produktu v jednotlivých kategoriích")
plt.xlabel("Průměrná cena")
plt.ylabel("Kategorie")
plt.tight_layout()
plt.savefig(fname='./outputs/sql_3.png')


# Top kategorie podle tržeb
df4 = pd.read_csv("./outputs/sql_4.csv", names=["product_category", "revenue"])
plt.figure(figsize=(10,6))
sns.barplot(data=df4, x="revenue", y="product_category", palette="magma")
plt.title("Top kategorie podle tržeb")
plt.xlabel("Tržby")
plt.ylabel("Kategorie")
plt.tight_layout()
plt.savefig(fname='./outputs/sql_4.png')


# Počet objednávek dle věkových skupin
df5 = pd.read_csv("./outputs/sql_5.csv", names=["age_group", "orders"])
plt.figure(figsize=(8,6))
sns.barplot(data=df5, x="age_group", y="orders", palette="Set2")
plt.title("Počet objednávek dle věkových skupin")
plt.xlabel("Věková skupina")
plt.ylabel("Počet objednávek")
plt.tight_layout()
plt.savefig(fname='./outputs/sql_5.png')