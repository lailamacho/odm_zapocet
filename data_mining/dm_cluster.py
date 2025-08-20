import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("./data_mining/sql_dm.csv")

# Standardizace (škálování) – aby věk a útrata měly stejnou váhu
scaler = StandardScaler()
X_scaled = scaler.fit_transform(df)

# Shlukování (KMeans)
kmeans = KMeans(n_clusters=4, random_state=42)
df["cluster"] = kmeans.fit_predict(X_scaled)
print(df.groupby("cluster").mean())

# Vizualizace
plt.figure(figsize=(10,6))
scatter = plt.scatter(df["age"], df["avg_spent"], c=df["cluster"], cmap="viridis", s=100, alpha=0.7)
plt.xlabel("Věk zákazníka")
plt.ylabel("Průměrná útrata")
plt.title("Shlukování zákazníků podle věku a útraty")
plt.colorbar(scatter, label="Cluster")
plt.grid(True)
plt.savefig(fname='cluster.png')