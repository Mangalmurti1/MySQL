-- We cant delete all the column of the table using ALTER table statement.Instead we should use DROP table command;


create database Nested;
use nested;
create table emp
(
   ename varchar(20),
   deptid int
);
create table dept
(
   deptname varchar(20),
   deptid int
);

insert into emp values('Mahesh',1),('Dhiraj',2),('Muskan',3);
insert into emp values('Rugved',5);
insert into dept values('Sales',4),('HR',5),('Admin',6);

update dept set deptid=1 where deptname='sales';
update dept set deptid=2 where deptname='HR';

select * from emp;
select * from dept;

/* We can return the result from multiple tables using either nested query or using join*/

--------------------------------------- Nested with SELECT statement --------------------------------------------
 --- Retrive the employee name whos belongs to HR department
 
 select deptid,ename from emp where deptid in (select deptid from dept where deptname='HR');
 
 
 --------------------------------------- Nested with INSERT statement -------------------------------------------
 -- here i am creating creating one another table to which we can insert record.
 
 create table school
 (
   ename varchar(20),
   deptid int
 );
 select * from school;
 alter table school drop column deptid;
 alter table school add column ename varchar(20);
 alter table school drop column empcity;
 desc school;
 drop table school;
 
 
 
--- insert the data into school table if deptid of dept table matches with deptid of emp table. 
 insert into school
 select * from emp where deptid in(select deptid from dept);
 truncate table school;
 
 --------------------------- Nested UPDATE ------------------------------------------------------------------
 -- update the name of emplyee to 'Shambho' whos belongs to 'HR' department
 
 update emp set ename='shambho' where deptid in(select deptid from dept where deptname='HR');
 
 
 --------------------------- Nested DELETE --------------------------------------------------------------------
 -- delete the records from employee table who belongs to 'sales' department.
 delete from emp where deptid in(select deptid from dept where deptname='sales');


-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
use clause;
show tables;
select * from data;
update data set per=71 where name='bhikaji';
select max(per) from data;

----------------------- NESTED QUERY WITH SELECT STATEMENT --------------------------------------

-------- QUESTION: Find second highest salary ---------
------ without using nested query & agregate function
select * from data order by per desc limit 1 offset 1;

------- Using nested query & agregate function
select max(per),name,per from data where per < (select max(per) from data);

------ QUESTION: Find all data of students who belongs to malwadi and per is greater than 70
------ without Using nested query & agregate function
select * from data where city='malwadi' and per>70;

------ Using nested query & agregate function
select * from data where city='malwadi' and per in (select per from data where per>70);


---------------------------- NESTED QUERY USING UPDATE STATEMENT ------------------------------------------
select * from data;
------------ increase the per by 0.25 of student who scored more than 74
------- without Using nested query & agregate function

update data set per=per+(per*0.25) where per>74;



------------------------------------------ NESTED QUERIES with SELECT Statement using different operators -------------------
use nested;
show tables;
select * from emp;
select * from dept;
-- 1. IN - find name, address of employees which belongs to HR department.
select ename from emp where deptid in(select deptid from dept where deptname='HR');

--- INSERT 
insert into emp (deptid)
select deptid from dept where deptid in(select deptid from dept where deptid=6);

------- UPDATE -------------
update emp set ename='Surendra' where deptid in(select deptid from dept where deptid=6);

---------- DELETE ---------------
delete from dept where deptid in(select deptid from emp where deptid=6);


