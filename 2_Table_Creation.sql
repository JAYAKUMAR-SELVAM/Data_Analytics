-- Question 1 :
create database product_db;

-- Question 2 :
create table product (
 product_id int,
product varchar(10), 
quantity int,
price int, 
purchase_cost int, 
estimated_sales_price float
 );
 
 -- Question 3 :
 desc product;
 
  -- Question 4 :
 insert into product (product_id,product,quantity,price,purchase_cost,estimated_sales_price) values (1,"paycard",2,300,8000,9000.56), (2,"paypoints", 4,200,7000,6700.65);

 -- Question 5 :
alter table product add column location varchar (50);

select * from product;

 -- Question 6 :
update product set location = "usa" where product_id = 1;
update product set location = "india" where product_id = 2;

 -- Question 7 :
select product , location from product where product = 'Paycard';

 -- Question 8 :
alter table product modify product varchar(25);

 -- Question 9 :
alter table product modify location varchar(20);

 -- Question 10 :
update product set quantity = 10 where product ="paycard";

 -- Question 11 :
insert into product (product_id,product,quantity,price,purchase_cost,estimated_sales_price,location) values (4,"ceditcard",2,500,900,750,"india");

 -- Question 12 :
insert into product (product_id,product,quantity,price,purchase_cost,estimated_sales_price,location) values (5,"debitcard",4,500,2000,1850,"uk"), (6,"buyback",20,500,10000,9800.95,'usa');

 -- Question 13 :
alter table product add column zip_code mediumint ;

 -- Question 14 :
update product set zip_code = 84967 where location = "usa";
update product set zip_code = 65789 where location = "india";
update product set zip_code = 34567 where location = "uk";

 -- Question 15 :
alter table product drop column zip_code;

select * from product;
