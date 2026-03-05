import pandas as pd
import matplotlib.pyplot as plt

#reads the csv file
df = pd.read_csv("data/flu_deaths.csv")

#looks at first few rows
print(df.head())

#looks at column headers
print(df.columns())

# group deaths by year
yearly_deaths = df.groupby("Year")["Deaths"].sum()

print(yearly_deaths)

yearly_deaths.plot(kind="line", marker="o")

plt.title("US Influenza Deaths by Year")
plt.xlabel("Year")
plt.ylabel("Deaths")
plt.tight_layout()

plt.savefig("plots/deaths_by_year.png")

plt.show()





