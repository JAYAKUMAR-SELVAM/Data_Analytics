
create database joins;

CREATE TABLE BANK_CUSTOMER
( customer_id INT PRIMARY KEY,
customer_name VARCHAR(20),
Address VARCHAR(20),
state_code  VARCHAR(3) ,
Telephone   VARCHAR(10));


INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord","CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow","NY" , "1897614000");

CREATE TABLE Bank_Account_Details
(Customer_id INT,
Account_Number VARCHAR(19) PRIMARY KEY,
Account_type VARCHAR(25) ,
Balance_amount INT,
Account_status VARCHAR(10),
Relationship_type varchar(1)) ;


ALTER TABLE Bank_Account_Details ADD FOREIGN KEY (Customer_id) REFERENCES bank_customer(Customer_id);

INSERT INTO Bank_Account_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , 200000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123001, "5000-1700-3456", "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS", 400000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" ,750000,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123004, "5000-1700-6091", "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123004, "4000-1956-3401",  "SAVINGS" , 655000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123005, "4000-1956-5102",  "SAVINGS" , 300000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, "4000-1956-5698",  "SAVINGS" , 455000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , 355000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S");
INSERT INTO Bank_Account_Details  VALUES (123007, "9000-1700-7777-4321",  "Credit Card",0  ,"INACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123007, '5900-1900-9877-5543', "Add-on Credit Card" ,   0   ,"ACTIVE", "S");
INSERT INTO Bank_Account_Details  VALUES (123006, '5800-1700-9800-7755', "Credit Card"   ,0,"ACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5890-1970-7706-8912', "Add-on Credit Card"   ,0,"ACTIVE", "S");
INSERT INTO Bank_Account_Details VALUES (123004,'5000-1700-7791','RECURRING DEPOSITS',40000,'ACTIVE','S');

CREATE TABLE Bank_Account_Relationship_Details
( Customer_id INT ,
Account_Number VARCHAR(19) PRIMARY KEY ,
Account_type VARCHAR(25),
Linking_Account_Number VARCHAR(19)
);

ALTER TABLE Bank_Account_Relationship_Details ADD FOREIGN KEY (Customer_id) REFERENCES bank_customer(Customer_id);
ALTER TABLE Bank_Account_Relationship_Details ADD FOREIGN KEY (Linking_Account_Number) REFERENCES bank_account_details(Account_Number);

INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , NULL);
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" , "4000-1956-3456");
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS" , NULL );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" , "4000-1956-2001" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" , NULL );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-7791",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , NULL);
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , "5000-1700-9800" );



-- Question 1
-- calculate the number of customer has a primary account type as "SAVINGS"

select * from bank_customer ;
select * from Bank_Account_Details;
select * from Bank_Account_Relationship_Details;

select count(customer_name) 
from Bank_Account_Details a  join bank_customer c 
on c.customer_id = a.Customer_id 
where a.Account_type = "SAVINGS";

#Question 2
#1) calculate the number of account owned by the each customer
#2) calculate the number of account owned by the each customer having atleast two account

select customer_name, count(Account_type) as count
from Bank_Account_Details a  right join bank_customer c 
on c.customer_id = a.Customer_id 
group by customer_name ;

select c.customer_name, count(a.Account_type) as count
from Bank_Account_Details a  right join bank_customer c 
on c.customer_id = a.Customer_id 
group by customer_name having count >= 2 ;

#Question 3
#1) list the customer name whose primary account type is "Credit Card"
#2) list the customer name whose primary account type is "Credit Card" and order the result in descending manner

select c.customer_name , a.Account_type
from Bank_Account_Details a right join bank_customer c 
on c.customer_id = a.Customer_id 
where a.Account_type = "Credit Card" ;

select c.customer_name , a.Account_type
from Bank_Account_Details a right join bank_customer c 
on c.customer_id = a.Customer_id 
where a.Account_type = "Credit Card" order by c.customer_name desc;

#Question 4
#1) Query to report the details of customer(customer id, customer_name, account number) having linking account number.
#2) Query to report the details of all customer having linking account number or not.

select c.customer_name , d.Account_type , d.Account_Number,d.Customer_id, d.Linking_Account_Number
from Bank_Account_Relationship_Details d right join bank_customer c 
on c.customer_id = d.Customer_id 
where d.Linking_Account_Number is not null;

select c.customer_name , d.Account_type , d.Account_Number,d.Customer_id, d.Linking_Account_Number
from Bank_Account_Relationship_Details d right join bank_customer c 
on c.customer_id = d.Customer_id;

#Question 5
#Query to report the customer_name, Address,Account_Number, Account_type,Balance_amount,Linking_Account_Number from the above tables.

select c.customer_name, c.Address , a.Account_Number, a.Account_type ,a. Balance_amount ,d.Linking_Account_Number
from Bank_Account_Details a right join bank_customer c 
on c.customer_id = a.Customer_id
left join Bank_Account_Relationship_Details d on c.customer_id = d.Customer_id ;
 
#Question 6
#Query to report all the Bank Customer and their respective account number,Account type,Balance amount,Account status and Relationship type.

select c.customer_name, a.Account_Number, a.Account_type ,a. Balance_amount, a.Account_status, a.Relationship_type
from Bank_Account_Details a right join bank_customer c 
on c.customer_id = a.Customer_id;

#Question 7
#1) create a table called employees with following below data

# EmpID  Name  Manager ID
# 1      Mark    3
# 2      Natasha 4
# 3      Chris   2
# 4      Robert  Null
# 5      Steve   2

create table employees ( EmpID int,
						 Name varchar(20),
                         Manager_ID int) ;
                         
insert into employees values (1,"Mark",3), (2,"Natasha",4) ,(3,"Chris",2) ,(4,"Robert",null), (5,"Steve",2);
 select * from employees;
 
 
# 2) query to get the all the employee id, employee name and their manager name and manager id
 
 select ep1.EmpID, ep1.Name as employee_name, ep2.Name as manager_name, ep2.Manager_ID 
 from employees ep1 
 left join employees ep2 
 on ep1.EmpID = ep2.Manager_ID 
 order by employee_name ;

# Question 8
# Write a difference between the inner join, left join, right join, self join and cross join

Answer:

Inner Join: 
Retrieves rows where there is a match in both tables based on the specified condition.
 
Syntax: 
SELECT * FROM table1 
INNER JOIN table2 ON table1.column = table2.column;
-----------------------------------------------------------------------------------------------------------------------------
Left Join: 
Retrieves all rows from the left table and matching rows from the right 
table. If no match is found in the right table, NULL values are used for 
the right table columns. 

Syntax: 
SELECT * FROM table1 
LEFT JOIN table2 ON table1.column = table2.column; 
This query will return all rows from table1, along with matching rows 
from table2.
 -----------------------------------------------------------------------------------------------------------------------------
Right Join: 
Retrieves all rows from the right table and matching rows from the left 
table. If no match is found in the left table, NULL values are used for 
the left table columns. 

Syntax: 
SELECT * FROM table1 
RIGHT JOIN table2 ON table1.column = table2.column; 
This query will return all rows from table2, along with matching rows 
from table1.
 -----------------------------------------------------------------------------------------------------------------------------
Self Join: 
Joins a table with itself, typically using aliases to distinguish between 
the two instances of the table. 

Syntax: 
SELECT * FROM table1 AS t1 INNER 
JOIN table1 AS t2 ON t1.column = t2.column; 
This query will join table1 with itself using the aliases t1 and t2. 
-----------------------------------------------------------------------------------------------------------------------------
Cross Join: 
Produces a Cartesian product of all rows from both tables, resulting in 
a potentially large result set. 

Syntax: 
SELECT * FROM table1 
CROSS JOIN table2; 
This query will return all possible combinations of rows between table1 
and table2. 

# Question 9
# Explain full outer join and how to achieve in MySQL

Answer:

A Full Outer join returns all rows from both the left and the right tables, along with the matching rows between them. If there is no 
match in either the left or right table, the result will include NULL values for columns from the table without a match. In MySQL, there is
no direct FULL OUTER JOIN syntax, but you can achieve the same result using a combination of a LEFT JOIN and a RIGHT JOIN, along with a 
UNION to combine the results.
 
Syntax -- Retrieve records from table1 and matching records from table2 

SELECT * 
FROM table1 
LEFT JOIN table2 ON table1.id = table2.id 
UNION -- Retrieve records from table2 that don't have a match in table1 
SELECT * 
FROM table1 
RIGHT JOIN table2 ON table1.id = table2.id 
WHERE table1.id IS NULL;

# Question 10
# Query to report the customer_name, Address,Account_Number, Account_type,Balance_amount,Linking_Account_Number from the above tables whose customer name is Oliver,Harry.

select c.customer_name, c.Address , a.Account_Number, a.Account_type ,a. Balance_amount ,d.Linking_Account_Number
from Bank_Account_Details a right join bank_customer c 
on c.customer_id = a.Customer_id
left join Bank_Account_Relationship_Details d on c.customer_id = d.Customer_id 
where c.customer_name in ("Oliver","Harry");


# Question 11
# Query to report the average balance amount of the each customer in their account.

select c.customer_name, avg(a.Balance_amount)
from Bank_Account_Details a  join bank_customer c 
on c.customer_id = a.Customer_id
group by  c.customer_name;
