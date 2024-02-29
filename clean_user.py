import pandas as pd

phonedf = pd.read_csv("phone.csv")
usersdf = pd.read_csv("users.csv")

for i in range(len(usersdf)):
    usersdf["Phone"][i] = phonedf["Phone"][i]

usersdf.to_csv("users.csv", index=False)