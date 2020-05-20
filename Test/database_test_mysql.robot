*** Settings ***
Library  DatabaseLibrary

Suite Setup  Connect to Database    ${dpabiModuleName}  ${dbname}   ${dbUserName}   ${dbPassword}   ${dbHost}   ${dbPort}
Suite Teardown  Disconnect From Database

*** Variables ***
${dpabiModuleName}  pymysql
${dbname}   my_db
${dbUserName}   root
${dbPassword}   root@pass1603
${dbHost}   127.0.0.1
${dbPort}   3306

*** Test Cases ***
Create a customer table
    ${output}   execute sql string  create table if not exists customer(customer_id int, customer_name varchar(50), billing_address varchar(50), shipping_address varchar(50))
    log to console  ${output}
    should be equal as strings  ${output}   None

check if customer table exist
    table must exist  customer

insert data in table
#    ${output}   execute sql string  insert into my_db.customer(customer_id,customer_name,billing_address,shipping_address) values (213,"C1","B add 1","B add 1");
    ${output}   execute sql script  ./Test_data/insertIntoCustomer.sql
    log to console  ${output}
    should be equal as strings  ${output}   None

select data from table
    @{result}   query   select * from my_db.customer;
    log many  @{result}