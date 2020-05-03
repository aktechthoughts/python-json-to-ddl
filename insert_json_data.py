import sys
import os
import mysql.connector

mydb = mysql.connector.connect(
  host=os.environ['DB_HOST_NAME'],
  user=os.environ['USER_NAME'],
  passwd=os.environ['PASSWORD'],
  database=os.environ['DB_NAME'],
)

def insert_json_data(inputfile):
    
  f=open(inputfile, "r")
  fl =f.readlines()
  mycursor = mydb.cursor()


  for i in range(len(fl)):
    sql = "INSERT INTO Feeds (data) VALUES(%s)"
    val = [(fl[i])]
    mycursor.execute(sql, val)

    mydb.commit()
    print(mycursor.rowcount, "record inserted.")

 
if __name__== "__main__":
  inputfile = sys.argv[1]
  insert_json_data(inputfile)

