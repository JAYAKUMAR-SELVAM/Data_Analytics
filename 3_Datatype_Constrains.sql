# 1 Question1: 
Write a small explanation of all commands in Data Control Language (DCL) and Transaction 
Control Language (TCL), along with some examples. 

Answer :
Data Control Language (DCL) – 
GRANT: This command gives users access privileges to the database. 
Syntax: 
GRANT SELECT, UPDATE ON MY_TABLE TO SOME_USER, ANOTHER_USER; 
Eg: Grant select, Insert on Users To ’user2’@localhost. 
REVOKE: This command withdraws the user’s access privileges given by using the GRANT 
command. 
Syntax: 
REVOKE SELECT, UPDATE ON MY_TABLE FROM USER1, USER2; 
Eg: Revoke select, Insert on Users from ’user2’@localhost 
Transaction Control Language (TCL)- 
COMMIT: Commit a transaction 
Syntax: Commit 
Eg: Update products set product_name = “Sample” where product_id=1 
Commit; 
---------------------------------------------------------------------------------------------------------------------------------
# Question 2: 
Create an table customer with following columns 

Answer :
create table customer(cust_id SMALLINT,Cust_no MEDIUMINT,cust_Firstname CHAR , 
cust_Lastname varchar(20),cust_gender varchar(15),cust_dob date , cust_age 
int(2),cust_revenue decimal , cust_spend float,cust_addr TEXT ,cust_city 
char,cust_comments TEXT , cust_status ENUM('ACTIVE','INACTIVE'),cust_available boolean);

insert into customer values(1,1,"ram","kumar","male","1999-04-04",20,2000,1000,"hjfkjk","chennai","no","avtive",true)
---------------------------------------------------------------------------------------------------------------------------------
# Question 3: 
The output of the SELECT statement should be a single column 

Answer :
SELECT CAST(cust_id AS CHAR) AS cust_id_string 
FROM customer; 
SELECT CAST(cust_dob as  Date) AS cust_dob_date 
FROM customer; 
SELECT CAST(cust_revenue AS SIGNED) AS cust_revenue_int 
FROM customer; 
SELECT CAST(cust_available AS CHAR) AS cust_available_text 
FROM customer; 

---------------------------------------------------------------------------------------------------------------------------------
# Question 4 : 
Return "Child" if the customer's age is less than 18,			
Adult Customer  if the customer's age is between 21 and 65,			
and "Senior Customer" if the customer age is greater than 65.	

Answer :
SELECT cust_id, cust_age, 
CASE 
    WHEN cust_age < 18 THEN 'Child' 
	WHEN cust_age >= 21 AND cust_age<= 65 then 'ADULT' 
	ELSE 'Senior Citizen' 
	END AS age_group 
FROM customer; 	

---------------------------------------------------------------------------------------------------------------------------------
# Question 5: 
Alter the above table by adding the following constraints

Answer :
ALTER TABLE customer MODIFY COLUMN cust_id SMALLINT NOT NULL; 
ALTER TABLE customer MODIFY COLUMN cust_no MEDIUMINT UNIQUE; 
ALTER TABLE customer MODIFY COLUMN cust_city char(30) default 'NY'; 

---------------------------------------------------------------------------------------------------------------------------------
# Question 6 : 
Create a table called 'Employees' with the following columns:

Answer :
create table employees (emp_id int primary key,emp_name varchar(50) not null, 
emp_age int,emp_dept varchar(50) default 'IT' , CHECK(emp_age >= 18));

---------------------------------------------------------------------------------------------------------------------------------
# Question 7: 
Create an table "customers_data" with below columns 

Answer :
create table customer_data (cust_id int primary key,cust_name varchar(30)); 
INSERT INTO customer_data(cust_id,cust_name) values(1,'Vishal'); 
INSERT INTO customer_data(cust_id,cust_name) values(2,'Aiyam'); 
INSERT INTO customer_data(cust_id,cust_name) values(3,'Perumal'); 

create table orders (order_id int primary key,cust_id int not null , order_date date, 
FOREIGN KEY  (cust_id) references customer_data(cust_id) ) ;
insert into orders(order_id, cust_id, order_date) values (1,2,'1999-04-04'); 
insert into orders(order_id, cust_id, order_date) values (2,2,'1999-04-04');

---------------------------------------------------------------------------------------------------------------------------------
# Question 8 
Enter some random 5 records of data into customers_data and orders table. 

Answer :
INSERT INTO customer_data(cust_id,cust_name) values(4,'jayakumar'); 
INSERT INTO customer_data(cust_id,cust_name) values(5,'bala'); 
INSERT INTO customer_data(cust_id,cust_name) values(6,'gopi'); 
INSERT INTO customer_data(cust_id,cust_name) values(7,'siva'); 
INSERT INTO customer_data(cust_id,cust_name) values(8,'subu'); 

insert into orders(order_id,cust_id,order_date) values (3,1,'1999-04-04'); 
insert into orders(order_id,cust_id,order_date) values (4,2,'2000-02-25'); 
insert into orders(order_id,cust_id,order_date) values (5,3,'1999-12-25'); 

---------------------------------------------------------------------------------------------------------------------------------
# Question 9: 
Remove any of 2 records from the customers data and orders table. 

Answer :
delete from orders where cust_id in (3,5) 
delete from customer_data where cust_id in (3,5) 

---------------------------------------------------------------------------------------------------------------------------------
# Question 10: 
1) Difference between unique and primary key 

Answer :
PRIMARY:
1. Primary key does not store null values 
2. Table can contain only one primary key
3. We can’t able to delete or modify values of primary key
4. The primary Key is used for indicating the rows uniquely. 
5. Used to serve as a unique identifier for each row in a table.

UNIQUE:
1. Unique key stores null values 
2. Table can contain multiple unique keys 
3. We can able to change values of unique key 
4. The Unique Key is used for preventing duplicate entries.  
5. Uniquely determines a row that isn’t the primary key.


2) Differnce between float, double and decimal 

Answer :
FLOAT: 
M should be greater than D 
Eg: Float(4,2) 
32 bits 
Values are less accurate 
Upto 24 precision
 
DOUBLE: 
M should be greater than D 
Eg: Double(4,2) 
64 bits 
More accurate than float
Greater than 24 precision 

DECIMAL:
Convert to Whole , if no 
precision 
128bits 
More accurate than float 
and double 
---------------------------------------------------------------------------------------------------------------------------------






