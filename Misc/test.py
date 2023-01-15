import pymysql
import subprocess
import datetime

connection = pymysql.connect(
    host='localhost',
    user='prog',
    password='prog1234',
    db='CaumPetClinic',
    cursorclass=pymysql.cursors.DictCursor)

schema_name = "CaumPetClinic"

dumpfile = './backup/' + schema_name + '_' + str(datetime.datetime.now().strftime('%Y%m%d%H%M%S')) + '.sql'
dump_cmd = 'mysqldump --skip-lock-tables -u ' + 'prog' + ' -p' + 'prog1234' + ' ' + schema_name + ' > ' + dumpfile
subprocess.call(dump_cmd, shell=True)

connection.close()
