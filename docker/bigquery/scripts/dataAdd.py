from google.cloud import bigquery
import random
import string

project_id = 'studied-beanbag-422111'
table_id = f"{project_id}.my_dataset.my_table"

client = bigquery.Client()

rows_to_insert = [
    {"id": i, "tag": random.choice(string.ascii_uppercase), "count": random.randint(0, 9)}
    for i in range(1000)
]

errors = client.insert_rows_json(table_id, rows_to_insert)
if errors == []:
    print("New rows added")
else:
    print("Errors while inserting rows: {}".format(errors))
