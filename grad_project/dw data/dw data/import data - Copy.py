import pandas as pd
from sqlalchemy import create_engine

# إعداد الاتصال بقاعدة البيانات
server = 'DESKTOP-8CH3JCC\\SQLEXPRESS'
database = 'TeleDataWh'  # اسم قاعدة البيانات الجديدة
connection_string = f'mssql+pyodbc://{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'
engine = create_engine(connection_string)

# استرجاع البيانات من الجداول
tables = ['customer_trans', 'customer_inter', 'telco_customer_data']
dataframes = {}

for table in tables:
    df = pd.read_sql(f'SELECT * FROM {table}', engine)
    dataframes[table] = df
    print(f'تم استرجاع البيانات من جدول: {table}')

# حفظ البيانات كملفات CSV
for table, df in dataframes.items():
    df.to_csv(r'C:\Users\tetoi\OneDrive\سطح المكتب\dw data{table}.csv', index=False)
    print(f'تم حفظ البيانات من جدول {table} كملف CSV.')
