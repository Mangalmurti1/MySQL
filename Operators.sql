use juin;
show tables;
select * from student;

---------------------------------------------------------------- IN ---------------------------------------------------------------------------------------
---- used to specify multiple values in a WHERE clause. It is a shorthand for multiple OR conditions 
 -- and can be used with both numeric and string types. 
 
select name,address from student where address in('Malwadi','Kolhapur','Bhilawadi');

select 10+5 as Addition;
select 10>5 as Greater;

------------- SET Operators ---------------------------
/* We have different Set operators like UNION,UNION ALL, INTERSECT & EXCEPT
UNION - It will join the result from two different select statement + It will eliminate duplicate values.
UNION ALL - It work same way like UNION but it will accept or print duplicate values.
 *Key Points to Remember*
Column Number and Data Types: All SELECT statements within a set operation must have the same number of columns
 in the result sets with similar data types.
Column Order: The order of the columns should be consistent across all SELECT statements.
Duplicate Handling: UNION removes duplicates, while UNION ALL includes all duplicates. 
INTERSECT and EXCEPT also inherently deal with duplicates based on their definitions.

MYSQL does not supports the INTERSECT operator instead we can use INNER JOIN or EXISTS.
MYSQL Does not supports the EXCEPT operator instead we can use the NOT IN,Left join etc.


*/
show tables;
select * from customers;
select * from first;
desc first;
desc second;
select * from second;
alter table second drop column  DOB;

------ UNION ---------
select roll_no from first union select roll_no from second;

------------------ UNION ALL
select roll_no from first union all select roll_no from second;



--------------- String functions -----------------------------------
show tables;
select * from customers;
select upper(name) from customers;
select concat() 
