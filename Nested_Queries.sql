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