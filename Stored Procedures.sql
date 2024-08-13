-- ********************************* Stored procedures ******************************************
/* MySQL does not natively support PL/SQL, which is Oracle's procedural extension for SQL. 
However, MySQL does have its own procedural language that offers similar functionality, 
called MySQL Stored Procedures and Functions.
Stored Procedures and Functions: You can create reusable SQL code blocks.

-use of delimiter :
Default delimeter of stored procedure is ; (semicolon) means whenever server finds the ; in the block of statement it trats as end of the block.  
We need to use the multiple statements which may have ; So, we can use other delimiter like // etc

- Updating a stored procedure in MySQL involves dropping the existing procedure and then recreating it with the necessary modifications.
 MySQL does not provide a direct ALTER PROCEDURE command
*/ 
use join3tables;
show tables;
select * from employee;
select * from positions;


DELIMITER //
create procedure mahesh()
select * from employee;
select * from employee where department_id=201;
GO//

DELIMITER ; -- Here i have set delimiter to default value ; (semicolon)


-- To check stored procedures is saved or not 
select * from information_schema.routines where routine_name='Mahesh';

DELIMITER //

CREATE PROCEDURE AddEmployee(IN emp_name VARCHAR(100),IN dept_id INT,OUT total_employees INT)
BEGIN
    -- Insert a new employee record
    INSERT INTO employees (name, department_id) VALUES (emp_name, dept_id);

    -- Update the total number of employees in the department
    UPDATE departments
    SET employee_count = employee_count + 1
    WHERE id = dept_id;

    -- Select the updated total number of employees in the department
    SELECT employee_count INTO total_employees
    FROM departments
    WHERE id = dept_id;
END //

DELIMITER ;

select * from information_schema.routines;


