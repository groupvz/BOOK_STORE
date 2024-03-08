import pandas as pd

df = pd.read_csv("./Raw_CSVs/OrderDetails.csv")
df.index.rename('OrderdetailId', inplace=True)
df.to_csv("./CSVs/OrderDetails.csv", index=True)