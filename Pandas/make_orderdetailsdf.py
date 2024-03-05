import pandas as pd
from random import randint
from random import randint
#OrderdetailId,OrderId,BookId,Quantity

order_details = {
    "OrderdetailId": [0]*400,
    "OrderId": [0]*400,
    "BookId": [0]*400,
    "Quantity": [0]*400
}

for i in range(300):
    order_details['OrderdetailId'][i] = i
    order_details['OrderId'][i] = i
    order_details['BookId'][i] = randint(1,1000)
    order_details['Quantity'][i] = randint(1,10)
    
for i in range(300,400):
    order_details['OrderdetailId'][i] = i
    order_details['OrderId'][i] = randint(0,300)
    order_details['BookId'][i] = randint(1,1000)
    order_details['Quantity'][i] = randint(1,10)
    
order_details_df = pd.DataFrame(order_details)
order_details_df.sort_values(by=['OrderId'], inplace=True)
order_details_df.drop(columns=['OrderdetailId'],inplace=True)  # Corrected the method name to 'drop' and added the missing 'columns' parameter
order_details_df.to_csv("OrderDetails.csv", index=True)