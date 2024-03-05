import pandas as pd

# Load the data
books = pd.read_csv('./Raw_CSVs/books.csv')
categories = pd.read_csv('./Raw_CSVs/categories1.csv')
mapping = {
    'BookID':[],
    'CategoryID':[]
}
for i in range(len(books)):
    for j in range(len(categories)):
        if str(categories['Category'][j]).lower() in str(books['Category'][i]).lower():
            mapping['BookID'].append(books['BookID'][i])
            mapping['CategoryID'].append(categories['CategoryID'][j])
            
mapping = pd.DataFrame(mapping)
books.drop('Category', axis=1, inplace=True)
for i in range(len(books)):
    books['Quantity'][i] = int(books['Quantity'][i])
    
books.to_csv('./CSVs/Books.csv', index=False)
mapping.to_csv('./CSVs/BookCategoryMapping', index=True)
categories.to_csv('./CSVs/Categories.csv', index=False)

