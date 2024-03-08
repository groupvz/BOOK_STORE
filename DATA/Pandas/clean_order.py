import pandas as pd
from random import choice

user_df = pd.read_csv('./CSVs/users.csv')
ids = user_df['ID'] #List of all user IDs

order_df = pd.read_csv('./Raw_CSVs/sales_data.csv')
order_df=order_df[['Order Date','Order ID']]

#Take 300 orders
order_df = order_df[:300]
for i in range(len(order_df)):
    #Randomly assign a user ID to each order
    order_df['Order ID'][i] = choice(ids)


order_df.index.rename('OrderID', inplace=True)
order_df.to_csv('./CSVs/orders.csv',index='OrderID')
