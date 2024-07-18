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

