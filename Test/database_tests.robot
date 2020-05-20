*** Settings ***
Library  DatabaseLibrary

*** Variables ***
${db_name}  "C:/Users/aruna/sqldatabases/sql1.db"
${msg}  hello
*** Test Cases ***
Check connection
    connect to database using custom params     sqlite3  database=${db_name}
    log to console   connection successful
    log     ${msg}
#Create table in database
#    ${output}=  execute sql string  CREATE TABLE person (id integer unique,first_name varchar,last_name varchar);
#    Log     ${output}

#Insert data in the table
#    ${output}=  execute sql string  Insert into person values(2,'Vihaan','Mahajan');
#    Log     ${output}

Reterive data from table
    ${output}=  QUERY  Select * from STUDENTS;
    log     ${output}

Reterive data from table users
    ${output}=  QUERY  Select * from Users;
    log     ${output}