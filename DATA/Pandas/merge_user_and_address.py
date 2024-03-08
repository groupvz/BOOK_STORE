import pandas as pd

user = pd.read_csv('./Raw_CSVs/users_from_players_fifa22.csv')

address = pd.read_csv('./Raw_CSVs/usa_address.csv')

# print(len(user), len(address))  #1000 234
#Merge 200 users with 200 addresses

user_address = pd.merge(user, address, left_index=True, right_index=True)
user_address = user_address[:200]

for i in range(len(user_address)):
    user_address['Country'][i] = 'USA'
    user_address['address'][i] = user_address['address'][i] + ', ' + user_address['city'][i] + ', ' + user_address['state'][i] + ', ' + str(user_address['zip'][i])
    
user_address = user_address.drop(['city', 'state', 'zip'], axis=1)
user_address.rename(
        columns={'address': 'Address'}, inplace=True)

user_address.to_csv('./CSVs/users.csv', index=False)