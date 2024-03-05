import pandas as pd
from random import randint

df = pd.read_csv("./CSVs/OrderStatus.csv")

for i in range(len(df)):
    df['OrderID'][i]=randint(1,200)

df.to_csv("./CSVs/OrderStatus.csv", index=False)