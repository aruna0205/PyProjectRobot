*** Settings ***
Library  DatabaseLibrary

*** Keywords ***
query maker
    connect to database using custom params     sqlite3  database="C:/Users/aruna/sqldatabases/sql1.db"

read yml file
