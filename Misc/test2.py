import subprocess
import pymysql

# Connect to the MySQL server
connection = pymysql.connect(host='localhost',
                             user='user',
                             password='user1234',
                             db='CaumPetClinic',
                             port = 3306,
                             cursorclass=pymysql.cursors.DictCursor)

# Dump the schema of the 'database' to a file
subprocess.call(["mysqldump", "-u", "user", "-p", "user1234", "--no-data", "CaumPetClinic", ">", "./database.sql"])

# Close the connection
connection.close()
