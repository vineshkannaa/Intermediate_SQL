-- Task 3 -----------------------------------
 show databases;
 create database tem_database;
create database world_peace;


-- Task 4 -----------------------------------
use world_peace;
create table temp_table(
item_id CHAR(10),
description varchar(40),
unit_price int
);
drop table temp_table;

create table merchandise_item(
item_id CHAR(20),
descr varchar(50),
price int
);


-- Task 5 -----------------------------------
create table customer(
cust_id CHAR(10) PRIMARY KEY,
cust_name VARCHAR(50)
);
 INSERT INTO customer
 SET cust_id = "C000000001",
 cust_name = "Harrison Kong";

INSERT INTO customer
SET cust_id = "C000000001",
cust_name = "John Doe";

truncate table merchandise_item;
INSERT INTO merchandise_item
SET item_id = "BAMBOOBOOK",
descr = "Bamboo Notebook",
price = 200;

INSERT INTO merchandise_item SET
item_id = "BAMBOOBOOK",
descr = "Dragon Painting",
price = 300;

update merchandise_item
set item_id = 'DRAGONPTING'
where price = 300;
alter table merchandise_item ADD CONSTRAINT merchandise_item_pk PRIMARY KEY (item_id);


-- Task 6 -----------------------------------
create index descr_idx on merchandise_item(descr);

drop index descr_idx on merchandise_item;

create unique index descr_idx on merchandise_item(descr);

insert into merchandise_item set item_id = "THORSTATUE",
descr = "Dragon painting";


-- Task 7 -----------------------------------
create table customer_order(
order_id CHAR(10) PRIMARY KEY,
customer_id CHAR(10),
foreign key (customer_id)
references customer(cust_id) );

insert into customer_order
set order_id = "0123456789",
customer_id = "C123456789";

create table cust_order_line_item(
cust_order_id CHAR(10),
cust_id CHAR(10),
merchandise_item_id CHAR(10),
quantity int,
primary key (cust_order_id,merchandise_item_id),
foreign key (cust_order_id)
references
customer_order(order_id)
);

alter table cust_order_line_item
add constraint item_id_fk
foreign key (merchandise_item_id)
references merchandise_item
(item_id);
