show databases;
create database constraints;
use constraints;
show tables;

----------------------------------------------------------------------------------- NOT NULL -------------------------------------------------------------------------
-- It means value for that column should not be decalared as NULL. There should be something.
-- MySql does not support direct syantax to give name to NOT NULL constraint.
-- While creation of table
create table First
(
 Roll_no int not null,
 Name varchar(20)
);
desc first;
insert into first values(null,'mahesh'); -- it gives you error.
-- After creation of table
alter table first modify column Name varchar(20) not null;
-- Drop NOT NULL constraint
alter table first modify column Name varchar(20);

------------------------------------------------------------------------------- DEFAULT ----------------------------------------------------------- -------------------------------------------------------
-- MySql does not support. We cannot directly give the name to default constarints like SQLServer and PostGreSQL.
-- we can achieve similar functionality using named triggers or stored procedures.

drop table first;
-- While creation of table
create table First
(
 Roll_no int default(100),
 Name varchar(20)
);
insert into first(name) values('Mahesh'); -- I have not enter details for roll_no still it saves roll_no=100 because of default constarint.
select * from first;
-- After creation of table
alter table first modify column name varchar(20) default 'mahesh';
-- Drop constraints
alter table first alter column name drop default;

------------------------------------------------------------------------------ CHECK --------------------------------------------------------------------
-- We can give the name to the check contraint.
-- creation of table
create table First
(
 Roll_no int ,
 Name varchar(20),
 constraint ch_k check (name='rohit')
);
desc first;
----- To verify the CHECK constraint is applied or not with name
show databases;
use information_schema;
show tables;
select * from table_constraints;
select * from check_constraints; -- it will show information about all the applied check constraints in databases.
  -- OR --
  Select * from information_schema.table_constraints where table_name='first';
insert into first values(1,'mahesh'); -- it will give you error
insert into first values(1,'rohit'); -- executed
insert into first values(1,'rohi');-- it will give you error
drop table first;
------ After creation of table
alter table first add constraint my_check check (roll_no>5);
-------- DROP CHECK Constraint 
alter table first drop constraint ch_k;
select * from first;

------------------------------------------------------------------ UNIQUE ----------------------------------------------------------------------------------------
-- It means column on which we have applied unique key constraint will not accepts duplicate values.
-- We can give the name to the Unique contraint.
drop table first;
-- While creation of table
create table First
(
 Roll_no int unique,
 Name varchar(20)
);
insert into first values(1,'mah');
insert into first values(1,'mah'); --- it gives you error because value of roll_no repeated. it should be unique
--------- After creation of table
alter table first add constraint unique (name);
desc first;
select * from first;
insert into first values(19,'Mahesh');
insert into first values(19,'Dinesh');

----------- DROP unique constraint
alter table first drop constraint roll_no; 


----------------------------------------------------------------------- PRIMARY KEY ----------------------------------------------------------------------------
-- We can give name to the primary key constarint while create/alter the table.but it will not reflect in information_schema database.
-- it is a combination of NOT NULL & UNIQUE constraint. we can define only one primary key in a single table.
drop table first;
-- While creation of table
create table First
(
 Roll_no int primary key,
 Name varchar(20)
);

------------ drop --------------
alter table first drop primary key;
---------- AFTER creation of table
alter table first add primary key(name);

---------------------------------------------------------------------- FOREIGN KEY-------------------------------------------------------------------------------
-- The table with the foreign key is called the child table & table with primary key is called the Parent table. 
 /* Basic Rules: 
   1. Referential Integrity: A foreign key in one table points to a primary key in another table,.. 
   ...ensuring that the relationship between the two tables remains consistent.
   2. Matching Values: The value of a foreign key must match an existing value in the referenced primary key column
   3. We cant add new row in child table (foreign key table), it violates the rules.
   4. We can update or delete parent table data if we add ON Delete set null & on delete CASCADE 
    e.g.   create table orders
          (
			orderId int primary key,
			orderdate date not null,
			customerID int ,
			foreign key(customerID) references customers(customerID)
			on delete set null
			on update cascade
		  );
	it means that if we delete from parent table then same entry from child table get deleted.
    and if we update parent data then same data in child get updated.
drop table first;
*/
-- While creation of table
create table First
(
 Roll_no int primary key,
 Name varchar(20)
);
create table second
(
 address varchar(20),
 roll_no int,
 foreign key (roll_no) references first(roll_no)
);
desc first;
desc second;
---------------- DROP foreign 
alter table second drop foreign key second_ibfk_1;

-------------- After creation of table
 -- check the constraints applied on databases
 show databases;
 use information_schema;
show tables;
select * from table_constraints;
--------- After creation of table
alter table second add foreign key(address) references first(roll_no);
drop table second;
commit;
show create table first; -- to check table information.
