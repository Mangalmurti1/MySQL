--------------------------------------------- DDL -------------------------------------------------------
create database zink;
show databases;
select user from mysql.user;
use zink;
show tables;
create table just
(
  roll_no int,
  name varchar(20),
  marks float(4,2)
);

show tables;
describe just;
desc just;
alter table just add column designation varchar(20);
alter table just modify column name varchar(10);
alter table just modify column marks float(2,2);
alter table just drop column cycle;
alter table just add column marks float(4,2);
truncate table just;
alter table just add column cycle int first;
alter table just add column profile varchar(10) after roll_no;

Alter table just rename column profile to new_profile;
Alter table just rename to just_1;
Alter table just_1 rename to just;
show tables;
------------------------------------- DML ---------------------------------------------
select * from just;
insert into just (cycle,roll_no,name) values(101,1,'Mahesh');
alter table just modify column new_profile varchar(13);
insert into just values(102,2,'Test engineer','Rohit','Qualiy Engineer',73.45);
update just set new_profile='SeniorEng' where roll_no=1;
delete from just where name="mahesh";
delete from just;
update just set cycle=101 where roll_no=1 or name='rahul';
update just set name='Chandu' where roll_no not in(2);


--------------------------------------- TCL ---------------------------------------------
set autocommit=0; -- it is used to disable to autocommit. enable it by using 1.

use zink;
Select * from just;
insert into just (roll_no,name) values(3,'Jitesh');
truncate table just;
insert into just (roll_no,name) values(1,'Jitesh');
commit;
rollback;
select user from mysql.user;
show databases;
use mysql;
select * from user;

-------------------------------------- DCL -------------------------------------------------
/*

select user from mysql.user;
login with root user(workbench)->create new user->grant permission
login with created user by root (command line)->work on it like see db,user etc.
create user 'saddam'@'localhost' identified by 'saddam'; -- create user*/
drop user 'saddam'@'localhost';
------------------------------------------
create user 'shambho'@'localhost' identified by 'shambho';
grant select on zink.just to 'shambho'@'localhost';
show grants for 'shambho'@'localhost';
revoke select on zink.just from 'shambho'@'localhost';
grant all privileges on *.* to 'shambho'@'localhost';


grant select,insert on zink.just to 'new'@'localhost';
grant All privileges on zink.just to 'new' @'localhost';  -- Provided all priviledges to user new
grant all privileges on *.* to 'new'@'localhost';  -- provided all priviledges on all database tables to user new.

show grants for 'new'@'localhost'; -- to checck granted priviledges for particular user. hit it from root account.
show grants; -- used to check the current user permissions. hit it from created user account.
flush privileges; -- The newly granted permission for the user will be activated after executing the FLUSH PRIVILEGES command

revoke insert on zink.just from 'new'@'localhost'; -- to get back given priviledges.
revoke all privileges on zink.just from 'new'@'localhost';

----------------------- Constraints ---------------------------------------------
------------ NOT NULL ------------
create table notnul
(
 roll_no int not null,
 name varchar(20)
);
desc notnul;
insert into notnul values(null,'forst');
alter table notnul modify column name varchar(20) not null; -- provide constraint after creation table.
drop table notnul;

------------------- UNIQUE ----------------------
create table notnul
(
 roll_no int unique,
 name varchar(20)
);
insert into notnul values(1,'forst'),(1,'forst');
select * from notnul;
update notnul set name='mangesh' where roll_no=2;
alter table notnul add constraint unique(name); -- After creation of table
alter table notnul drop index name;-- Drop unique

----------- PRIMARY KEY -------------
create table notnul
(
 roll_no int primary key,
 name varchar(20)
);
desc notnul;

alter table notnul drop primary key; -- Drop primary key
alter table notnul add constraint primary key(name); -- After creation

--------------------- Default -----------
create table notnul
(
 roll_no int default(100),
 name varchar(20)
);

insert into notnul(name) values('mahesh'); -- It takes default values beacuse i have not filled it.

alter table notnul alter roll_no drop default;
alter table notnul modify column name varchar (20) default 'Dhondiram';

------------- CHECK- -------------------
drop table notnul;
create table notnul
(
 roll_no int check(roll_no>2),
 name varchar(20)
);
insert into notnul values(1,'suga');
alter table notnul drop index roll_no;
desc notnul;
show tables;
show databases;
use information_schema;
show tables;
select * from check_constraints; -- used to view the applied check constraints.
select * from table_constraints; -- used to view the constraints applied on tables. 


---------------------------------- Foreign key ---------------------------------------
desc just;







