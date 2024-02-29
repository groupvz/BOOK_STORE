import pandas as pd

mappingdf = pd.read_csv('./BookCategoryMapping.csv')
mappingdf.index.name = 'ID'
mappingdf.to_csv('./BookCategoryMapping.csv')