--------------------------------------------- DDL -------------------------------------------------------
-- All the DDL commands are auto commited. 
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
-- All the DML commands are not autocommited. we should set(enable) it by using SET autocommit=1; and disable it by using Set autocommit=0;
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
grant all privileges on *.* to 'shambho'@'localhost'; -- first * denotes all databases & second * denotes all the tables.

-- Unfortunately MySQL does not have a single command to revoke all privileges at once. So, use below one
revoke all privileges, grant option from 'shambho'@'localhost';


grant select,insert on zink.just to 'new'@'localhost';
grant All privileges on zink.just to 'new' @'localhost';  -- Provided all priviledges to user new
grant all privileges on *.* to 'new'@'localhost';  -- provided all priviledges on all database tables to user new.

show grants for 'new'@'localhost'; -- to checck granted priviledges for particular user. hit it from root account.
show grants; -- used to check the current user permissions. hit it from created user account.
flush privileges; -- The newly granted permission for the user will be activated after executing the FLUSH PRIVILEGES command

revoke insert on zink.just from 'new'@'localhost'; -- to get back given priviledges.
revoke all privileges on zink.just from 'new'@'localhost';








