import sys
import pip

pip.main(["install","pymysql"])
pip.main(["install","schedule"])

import pymysql
import subprocess
import datetime
import schedule

class Scheduler():

    def __init__(self):
        usrName, password, schedules, pathForBackups = self.scheduleInquiry()
        self.initDump(usrName,password,pathForBackups)
    
    def scheduleInquiry(self):
        username = input("What is your Username (to access the DataBase): ")
        password = input("What is your Password: ")
        numberOfSchedulesPerDay = input("What is the number of backups that you want to do (per day):")
        schedules = []
        for i in range(int(numberOfSchedulesPerDay)):
            hour, minutes = input(f"What time would you like the backup no. {i} to be on(HH:MM):").split(":")
            schedules.append((hour,minutes))
        pathForBackups = input("What is the path for the backups: ")
        return username,password,schedules,pathForBackups

    def initDump(self, username, password, pathForBackups):
        connection = pymysql.connect(
            host='localhost',
            user=username,
            password=password,
            db='CaumPetClinic',
            cursorclass=pymysql.cursors.DictCursor)

        schema_name = "CaumPetClinic"
        dumpfile = f'{pathForBackups}/' + schema_name + '_' + str(datetime.datetime.now().strftime('%Y%m%d%H%M%S')) + '.sql'
        dump_cmd = 'mysqldump --skip-lock-tables -u ' + username + ' -p ' + password + ' ' + schema_name + ' > ' + dumpfile
        subprocess.call(dump_cmd, shell=True)
        connection.close()

    def scheduler(self, schedules, username,password,pathForBackups):
        for hour,minute in schedules:
            schedule.every().day.at(f"{hour}:{minute}").do(self.initDump(username,password,pathForBackups))


Scheduler()
