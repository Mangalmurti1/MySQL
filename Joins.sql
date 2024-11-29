/*
We do not need a foreign key constraint to perform a join operation in MySQL. 
Joins are based purely on the logic of matching column values, and they do not require explicit database-enforced relationships
like foreign key constraints. However, having a foreign key can help maintain data integrity and consistency between related tables.
*/

create database joindb;
use joindb;
create table student
(
  roll_no int,
  name varchar(20),
  address varchar(40),
  age int
  );
  
  create table studentCourse
  (
  course_id int,
  roll_no int
  );
  
  insert into student values(1,'mahesh','Malwadi',28),
                          (2,'chiku','Ashta',20),
                          (3,'natu','Kolhapur',23),
                          (4,'suhas','Shivajinagar',25),
                          (5,'Barkya','Sangli',34);
                          insert into student values(8,'Mangya','Keral',21);
select * from student; 

insert into studentCourse values(1,1),(2,2),(3,3),(4,5),(5,7),(6,8);
select * from studentCourse; 

-------------------------------------------------------- INNER JOIN -----------------------------------------------------------------------------
-- It returns matched rows between two tables.
select student.name,student.age,student.address,studentCourse.course_id from student inner join studentCourse on student.roll_no=studentCourse.roll_no;


-------------------------------------------------------- LEFT JOIN ------------------------------------------------------------------------------
-- It returns all the rows from first/left table and matched rows from second/right table.
select studentCourse.course_id,student.name,student.age,student.address from studentCourse left join student on studentCourse.roll_no =student.roll_no;

-------------------------------------------------------- RIGHT JOIN -----------------------------------------------------------------------------
-- It returns all the rows from second/right table and matched rows from left/first table.
select studentCourse.course_id,student.name,student.age,student.address from studentCourse right join student on studentCourse.roll_no=student.roll_no;

-------------------------------------------------------- FULL JOIN ------------------------------------------------------------------------------
-- it returns all the data between two tables
select studentCourse.course_id,student.name,student.age,student.address from studentCourse full join student on studentCourse.roll_no=student.roll_no;


/* create table first
(
 name varchar(20),
 roll_no int
);

create table second
(
 DOB date,
 address varchar(40)

);

insert into first values('mahesh',1),('Suhas',2),('Sudham',3),('Dinkar',4);
truncate table first;
select * from first;
alter table first add constraint primary key(roll_no);
alter table second add column roll_no int;
desc second;
alter table second add foreign key(roll_no) references first(roll_no);

insert into second values('1995-08-01','Bhilawadi',1),('1995-07-02','Sukhwadi',2);
select * from second;

-- INNER JOIN --
select first.name,first.roll_no, second.DOB, second.address from first inner join second on first.roll_no=second.roll_no;

-- LEFT JOIN --
select first.*, second.* from first left join second on first.roll_no=second.roll_no;

-- RIGHT JOIN --
select first.*,second.* from first right join second on first.roll_no =second.roll_no;

-- FULL JOIN --
select first.*,second.* from first left join second on first.roll_no=second.roll_no 
union
select first.*, second.* from first right join second on first.roll_no=second.roll_no;

-- SELF JOIN ---------*/
create table selfjoin
(
 roll_no int,
name varchar(20)
);
insert into selfjoin values(1,'Mahesh'),(2,'Rakesh');
select t1.roll_no,t2.name from selfjoin t1,selfjoin t2 where t1.roll_no=t2.roll_no;

--- JOIN THREE TABLES ----------------------------------------------
CREATE TABLE employees 
(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Jim', 'Brown', 1);
select * from employees; 

CREATE TABLE departments 
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Engineering');
select * from departments;

CREATE TABLE projects 
(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT
);


INSERT INTO projects VALUES
(1, 'Recruitment', 1),
(2, 'Software Development', 2);
select * from projects;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, p.project_name 
FROM employees e JOIN departments d ON e.department_id = d.department_id
JOIN projects p ON d.department_id = p.department_id;

show tables;

------------------------------- EXERCISE ---------------------------------------------------------------------------------
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department_id INT
);

INSERT INTO Employees (emp_id, emp_name, department_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL),
(4, 'Diana', 103),
(5, 'Eve', 101);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

INSERT INTO Departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Sales'),
(104, 'Marketing');

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    emp_id INT
);

INSERT INTO Projects (project_id, project_name, emp_id) VALUES
(201, 'Project Alpha', 1),
(202, 'Project Beta', 2),
(203, 'Project Gamma', 4),
(204, 'Project Delta', NULL);

select * from departments;
select * from employees;
select * from projects; 




