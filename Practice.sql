-- https://www.techbeamers.com/sql-query-questions-answers-for-practice/
use assignment1;
show tables;
set autocommit=0;
create table mahesh
(
 roll_no int,
 name1 varchar(20)
);
show tables;
desc a;
drop table mahesh;
use clause;
desc data1;
select sysdate();
select now();
show create table data1;
alter table data rename column name to Javed;
alter table data rename column javed to name;
create table ram as select roll_no,name1 from mahesh;
alter table data rename to data1;
create table worker
(
 worker_id int,
 F_name varchar(20),
 L_name varchar(20),
 Salary float,
 J_date date,
 Dept varchar(20)
);
alter table worker drop column DOB; 
desc worker;
create table Bonus
(
  workRefId int,
  bonus_date datetime,
  bonus_amount float
);
desc bonus;
create table title
(
 workRefId int,
 worker_title varchar(55),
 affected_date date
 );
 
 alter table worker add constraint primary key(worker_id);
 alter table bonus add constraint foreign key(workRefid) references worker(worker_id);
 
 
 INSERT INTO Worker 
	(WORKER_ID, F_NAME, L_NAME, SALARY, J_DATE, DEPt) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');
        select * from worker;
        select salary from worker order by salary;
        select salary from worker order by salary desc limit 1 offset 1; 
        select max(salary) from worker; -- order by salary desc; 
        
        
	INSERT INTO Bonus 
	(workRefId, bonus_amount, bonus_date) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');
        insert into bonus values(10,86000,2023-10-04 01:10:34,10);
        select * from bonus;
        select now();
        select user from mysql.user;
        show grants for mahesh;
        select user();
 
 mysql -u root -p;
 alter ;
 
 show tables;
 select * from student;
 
 select * from empdetails;
 
 select * from empdetails order by empid desc limit 1 offset 3;
 
 show tables;
 select * from student;
 
 create table student
 (
   eno int,
   sname varchar(20),
   DOB date,
   pyear int,
   stream varchar(30)
);

insert into student values(123,'Mahesh','1995-08-17',2017,'Computer'),
						  (124,'Yuvraj','1993-06-12',2015,'Electronics'),
                          (125,'Snehal','1994-09-23',2016,'Mechanical'),
                          (126,'Suraj','1998-06-12',2018,'Electronics'),
                          (127,'Vitthal','1999-08-12',2019,'Electronics'),
                          (128,'Abhi','1992-06-15',2013,'Mechanical');
                          
 select stream, count(*) from student group by stream order by count(*) desc;   
 select count(stream) from student group by stream;
 
 
 show databases;
 use information_schema;
 show tables;
 select * from check_constraints;
 select * from key_column_usage;
******************************************************** 22JUN2024 ******************************************** 
 CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(5, 2),
    hire_date DATE,
    manager_id INT
);
show create table employee;
 INSERT INTO employee (first_name, last_name, department_id, salary, hire_date, manager_id)
VALUES
    ('John', 'Doe', 2, 60000.00, '2020-01-15', NULL),
    ('Jane', 'Smith', 3, 80000.00, '2019-03-22', 1),
    ('Alice', 'Johnson', 4, 55000.00, '2021-07-30', 1),
    ('Bob', 'Brown', 1, 50000.00, '2018-10-05', 2);
 
alter table employee modify column salary decimal(9,2);
 select * from employee;
 CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Insert four records into the departments table
INSERT INTO departments VALUES(1,'HR'),(2,'IT'),(3,'Finance'),(4,'Marketing');
truncate table departments;
  select * from departments;
 
-- Retrieve all employees in the IT department.	
select e.first_name,e.last_name,e.salary,e.employee_id,d.department_name from employee e join departments d on e.department_id=d.department_id where d.department_name='IT';					
INSERT INTO employee values(5,'Mahesh', 'Rokade', 2, 90000.00, '2022-05-23', 2);
 -- List all employees along with their department names.							
select employee.*, departments.* from employee join departments on employee.department_id=departments.department_id;

-- select records of higher salary employee from IT Department;
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employee e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
ORDER BY e.salary DESC
LIMIT 1;

-- Find the total salary for each department, but only include departments where the total salary exceeds $100,000.							
select department_id,sum(salary) from employee group by department_id having sum(salary)>100000;
   
   
   CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO project (project_id, project_name, start_date, end_date)
VALUES 
    (1, 'Project Alpha', '2024-01-01', '2024-06-30'),
    (2, 'Project Beta', '2024-02-15', '2024-08-15'),
    (3, 'Project Gamma', '2024-03-01', '2024-09-30');
   
 -- Retrieve all projects, ordered by their start date.							
select * from project order by start_date;


-- Update the salary of an employee.
update employee
set salary = (salary*1.25);				

-- Calculate the average salary of all employees.							
-- using aggregate function
select avg(salary) from employee;	
-- without using aggregate function.
select sum(salary)/count(*) from employee;

select substr('mahesh',1,3);
select right('Mahesh',2);		

use joindb;
select * from employee where first_name like '_a%';
select * from employee where first_name like '_____';
select substr(first_name,1,4) from employee;
select * from employee;
select * from employee where hire_date like '____-01-__';

 -- *****************************************20JULY24 ******************************************************
 show databases;
 create database 20july;
 use 20july;
 show databases;
 
 create table vivek(
  name varchar(20),
 age int ,
 DOB date,
 per float(4,2)
 );
 show tables;
 show create table vivek;
 desc vivek;
 
 alter table vivek add column blood_group text;
 alter table vivek modify column blood_group text after name;
 alter table vivek modify column age int;
 
 
 alter table vivek rename mahesh;
 drop table mahesh;
 alter table mahesh rename column per to marks;
 
 alter table mahesh drop column marks;
 
 insert into vivek (name,age,DOB,per) values('Mahesh',29,'1995-08-17',72.25);
 select * from vivek;
 insert into vivek values('Shivam',17,'2004-08-31',67.00);
 truncate table vivek;
 delete from vivek where name='Mahesh';
 
 select name, date_format(DOB,'%d/%m/%Y') as changed_format_of_date from vivek;
 update vivek set name='Mukesh' where name='mahesh';
 update vivek set age=21 where per between 65 and 70 or DOB ='1995-09-23';
 
 set autocommit=0;
 -- Except DML all other language commands are autocommitted.
 select * from vivek;
 insert into vivek values('Kedar',22 ,'2011-04-9',89.00);
 commit;
 rollback;
 
 start transaction;
 insert into vivek values('Vaishnavi',45,'2005-10-17',71.00);
 update vivek set age=32 where name='vikalp';
 commit;
 
 start transaction;
 savepoint sp1;
 delete from vivek where age=45;
 
 rollback to savepoint sp1;
 
 select user from mysql.user;
 create user 'Dilip'@'localhost' identified by 'Dilip';
 show grants for 'mahesh'@'localhost';
 grant select on joindb.customers to 'Dilip'@'localhost';
 revoke select on joindb.customers from 'Dilip'@'localhost';
 grant all privileges on *.* to 'Dilip'@'localhost';
 flush privileges;
 grant reload on *.* to 'Dilip'@'localhost';
 flush privileges;
 grant ALL PRIVILEGES on *.* to 'Dilip'@'localhost';
 flush privileges;
 show grants for 'Dilip'@'localhost';
 grant ALL PRIVILEGES on joindb.* to 'Dilip'@'localhost';


use joindb;
show tables;
select * from customers;
select name from customers where customerid=1;
select * from employee;

select * from employee having hire_date between '2018-01-01' and '2019-04-01' order by hire_date asc;
select  employee_id,salary,department_id from employee group by salary having salary between 60000 and 70000 order by salary;
select avg(salary) from employee;
select min(salary) from employee;
select first_name from employee where employee_id in(1,9,7);
select * from employee where salary not in (75000,68750);
select first_name from employee where department_id = 1 or salary=1000;
select * from employee where first_name like '_o%';
select * from employee order by salary desc limit 1;
select distinct department_id from employee order by department_id;

use 20july;
show tables;

drop table vivek;
create table vivek(
 name varchar(20),
 age int,
 DOB date,
 per float(4,2)
 );
 
 show create table vivek;
 desc vivek;
 insert into vivek (DOB,per) values('1998-09-09',78.78);
 alter table vivek modify column name varchar(20);
 select * from vivek;
 
 alter table vivek alter column name drop default;
 
 alter table vivek add constraint unique(age);
 
 insert into vivek values('mahesh',12,'2022-09-09',89.76),('Mahesh',12,'1998-12-31',67.87);
 
 alter table vivek drop constraint age;
 
 
 
-- **************************************** Nth salary ******************************************************** 
use joindb;
 select * from employee;
 select salary from employee order by salary desc; 

SELECT first_name,salary FROM employee e1 WHERE 4-1 = 
( SELECT COUNT(DISTINCT salary) 
FROM employee e2 WHERE e2.salary > e1.salary
);
 
 
 SELECT  * FROM employee limit 2;

 select salary from employee order by salary desc limit 2,1;
 select max(salary) from employee where salary < (select max(salary) from employee where salary <(select max(salary) from employee));
 select min(salary) from employee where salary > (select min(salary) from employee where salary > (select min(salary) from employee));
 
 -- ****************************JOIN**************************************
 -- self join 
 select e1.*, e2.* FROM employee e1 JOIN employee e2 ON e1.employee = e2.employee;
 
select * from customers;
select * from orders;
delete from orders where orderid=104;

select customers.*,orders.* from customers left join orders on customers.customerid=orders.customerid;
select customers.name,orders.amount from customers left join orders on customers.customerid=orders.customerid;

select customers.*,orders.* from customers right join orders on customers.customerid=orders.customerid;
select customers.*,orders.* from customers inner join orders on customers.customerid=orders.customerid;


select customers.*,orders.* from customers left join orders on customers.customerid=orders.customerid
union
select customers.*,orders.* from customers right join orders on customers.customerid=orders.customerid;

select customers.customerid,customers.name,orders.amount from customers left join orders on customers.customerid = orders.customerid;
select customers.*,orders.* from customers right join orders on customers.customerid = orders.customerid; 
select customers.*,orders.* from customers inner join orders on customers.customerid = orders.customerid;

select customers.*,orders.* from customers join orders on customers.customerid = orders.customerid;

 select customers.*,orders.* from customers left join orders on customers.customerid = orders.customerid
 union
 select customers.*,orders.* from customers right join orders on customers.customerid = orders.customerid;
 
 select * from customers cross join orders;
 
  select * from employee;
  select count(*),department_id from employee 
  group by department_id having count(department_id)>1;
 
  
  select upper(first_name) from employee;
  select lower(first_name) from employee;
  select concat(first_name,last_name) as fullname from employee;
  select substr(first_name,1,3) from employee;
  
  select salary from employee e1 where 4-1=(select count(distinct salary)from employee e2 where e2.salary>e1.salary);
  
  -- *************************JOIN Three tables **************************************
  
  create database join3tables;
  use join3tables;
  show tables;
  create table departments(
    department_id int primary key,
    department_name varchar(20)
    );
    
    create table positions(
    position_id int primary key,
    position_name varchar(20)
    );
  
  create table employee(
  employee_id int primary key,
  employee_name varchar(30),
  department_id int,
  position_id int,
  foreign key(department_id) references departments(department_id),
  foreign key(position_id) references positions(position_id)
  );
  
  INSERT INTO departments (department_id, department_name) VALUES
(201, 'HR'),
(202, 'IT'),
(203, 'Finance');
select * from departments;

INSERT INTO positions (position_id, position_name) VALUES
(101, 'Manager'),
(102, 'Developer'),
(103, 'Analyst'),
(104, 'Designer');

select * from positions;

INSERT INTO employee (employee_id, employee_name, position_id, department_id) VALUES
(1, 'Alice', 101, 201),
(2, 'Bob', 102, 202),
(3, 'Charlie', 101, 201),
(4, 'David', 103, 203),
(5, 'Eve', 104, 202);

select * from employee;

SELECT e.employee_name, p.position_name, d.department_name
FROM employee e JOIN positions p ON e.position_id = p.position_id 
JOIN departments d ON e.department_id = d.department_id;				
				

 
 
 use mock;
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, p.project_name 
FROM employees e JOIN departments d ON e.department_id = d.department_id
JOIN projects p ON d.department_id = p.department_id;


create table just
(
 name varchar(20),
 id int primary key
 ); 
desc just;

show databases;
use information_schema;
show tables;
select * from table_constraints where table_name='just';



use join3tables;
drop table just;
show create table just;
alter table just alter column name drop default;

alter table just drop constraint chk;
alter table just add constraint chck check(id<5);
select * from information_schema.table_constraints where table_name='just';

alter table just drop constraint id;

show tables;
create table Country
(
  id int primary key,
  country_name varchar(20)
  );
  desc country;
  create table state
  (
    id int primary key,
    state_name varchar(20),
    country_id int,
    foreign key(country_id) references country(country_id)
    );
desc state;
alter table country rename column id to country_id;

insert into country values(1,'USA'),(2,'India'),(3,'Zimbabve'),(4,'portugal');
select * from country;

insert into state values(101,'California',1),
						(102,'Texas',1),
                        (201,'Maharshtra',2),
                        (202,'Dhule',2),
                        (301,'Harare',3),
                        (302,'Bulawayo',3),
                        (401,'Minho',4),
                        (402,'Algarve',4);
                        
                        select * from state;
                        
select country.country_name,state.state_name from country join state on country.country_id=state.country_id where state.country_id=4;

show tables;
create procedure Mahesh()
select * from country
-- select * from departments where department_id=201;
GO;


call mahesh();

select * from information_schema.routines where routine_name='Mahesh';
drop procedure mahesh;



