CREATE DATABASE CRICKET_TOURNAMENT;
USE CRICKET_TOURNAMENT;

/*CREATE TABLE*/
create table SUPPLIER(
SID VARCHAR(5) PRIMARY KEY,
SNAME VARCHAR(10),
CITY VARCHAR(10));

CREATE TABLE ITEM(
ITEM_ID VARCHAR(10),
INAME VARCHAR(10),
COLOR VARCHAR(10),
WEIGHT INT(10));

DROP TABLE ITEM;

CREATE TABLE ITEM(
ITEM_ID VARCHAR(10) primary KEY,
INAME VARCHAR(10),
COLOR VARCHAR(10),
WEIGHT INT(10));

CREATE TABLE SUPPLY(
SID VARCHAR(10),
foreign key(SID) references SUPPLIER(SID),
ITEM_ID VARCHAR(10),
foreign key(ITEM_ID) references ITEM(ITEM_ID),
QUANTITY INT(10));

/*INSERT TABLE*/
INSERT INTO SUPPLIER values
('S001','MANISH','KOLKATA'),
('SOO2','HARI','DELHI'),
('SOO3','KUNDAN','KOLKATA'),
('SOO4','SAGAR','PATNA'),
('SOO5','ZAHIR','DELHI');

INSERT INTO ITEM values
('ITEM 1','DESK','BROWN',20),
('ITEM 2','CHAIR','RED',7),
('ITEM 3','BOARD-1','BLUE',15),
('ITEM 4','BOARD-2','WHITE',10),
('ITEM 5','MARKER','BLACK',20);

INSERT INTO SUPPLY values
('SOO2','ITEM 2',210),
('S001','ITEM 5',200),
('SOO5','ITEM 1',125),
('SOO2','ITEM 5',500),
('SOO5','ITEM 2',156),
('S001','ITEM 1',370); 

/*SHOW ALL TABLE*/
SELECT * FROM SUPPLIER;
SELECT * FROM ITEM;
SELECT * FROM SUPPLY;

/* Q2. Find all the existing suppliers*/
SELECT * FROM SUPPLIER;

/* Q3. Find all item which are store by at least one supplier*/
select * from ITEM where ITEM_ID in(
select ITEM_ID from SUPPLY
group by SID having count(ITEM_ID)>=1);

/* Q4. Find all supplier who lives in delhi*/
select * from SUPPLIER
where city='DELHI';

/* Q5. Find all supplier who do not lives in kolkata*/
select * from SUPPLIER
where city!='KOLKATA';

/* Q6. Find all supplier who do not sell any item*/
select * from SUPPLIER
where SID not in(
select distinct SID 
from SUPPLY);

/* Q7. Find all supplier who sell at least one item*/
select * from SUPPLIER
where SID in(
select SID from SUPPLY
group by SID having count(ITEM_ID)>=1);

/* Q8. Find all supplier who sell the item number 'ITEM 1'*/
select * from SUPPLIER
where SID in(
select SID from SUPPLY
where ITEM_ID='ITEM 1');

/* Q9. Find all supplier who sell either the item number 'ITEM 1' or 'ITEM 2'*/
select * from SUPPLIER
where SID in(
select SID from SUPPLY
where ITEM_ID in ('ITEM 1','ITEM 2'));


/* Q10. Find all supplier who sell the item color 'red'*/
select * from SUPPLIER
where SID in(
select SID from SUPPLY
where ITEM_ID in (
select ITEM_ID from ITEM 
where color='RED'));

/* Q10. Find all supplier who sell the item color 'red' with quantity between 200 and 500*/
select * from SUPPLIER
where SID in (select SID from SUPPLY 
where ITEM_ID in(select ITEM_ID from ITEM
where color='RED')
and QUANTITY between 200 and 500
);

