import sqlite3
import csv
import os

# open a connection to the database file
db_path = './data/cs_conf_release.db'
# conn = sqlite3.connect('cs_conf_release.db')
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# get a list of all tables in the database
cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
tables = [table[0] for table in cursor.fetchall()]

# create a directory to store the csv files
if not os.path.exists('csv_files'):
    os.makedirs('csv_files')

# loop through the tables and export them to csv files
for table in tables:
    print(table)
    filename = f"csv_files/{table}.csv"
    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        cursor.execute(f"SELECT * FROM {table}")
        # write the column headers to the csv file
        column_names = [description[0] for description in cursor.description]
        csvwriter.writerow(column_names)
        # write the data to the csv file
        for row in cursor.fetchall():
            csvwriter.writerow(row)

# close the connection to the database
conn.close()