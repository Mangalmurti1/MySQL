-------------------------------------------------------- Clauses ---------------------------------------------------------------------------
show databases; 
create database clause;
use clause;
create table Data
(
  name varchar(30),
  roll_no int,
  DOB date,
  per float(4,2),
city varchar(20)
);
show tables;
desc data;

insert into data values('Mahesh',13,'1995-08-17',74.91,'Malwadi'),
					   ('Rohit',1,'1993-08-08',63.50,'Sangli'),
					   ('Omkar',2,'2000-06-21',72.40,'Malwadi'),
                       ('Bhikaji',5,'1990-06-01',56.77,'Sangli');
                       
alter table data add column salary int;
desc data;


-------- Order of clause=====SELECT, FROM, WHERE, GROUP BY, HAVING, and ORDER BY--------------------------------------

--------------------------------------------------------- WHERE -------------------------------------------------------------------------------------
------- To limit on the data to be displayed in the output.
-------- We can use it with select,update and delete
Select name from data where city='Sangli';
Select * from data where DOB<'1991-01-01'; 
select roll_no from data where per>=72.40;
update data set salary=12000 where roll_no=1;
update data set salary=25000 where name='Mahesh';
update data set salary =20000 where roll_no=2 ;
update data set salary= 32000 where dob='1990-06-01';
select * from data;
delete from data where dob='1990-06-01';
insert into data values('Bhikaji',12,'1990-06-01',57.87,'Hatkanangale');
select * from data where per=74.91 or city='sangli';


--------------------------------------------------------- GROUP BY -----------------------------------------------------------------------------------
---- where clause is not used in aggregate functions so, to overcome this w can use Group by clause. 
-- Here select should have aggregate function in select list and in group by clause use column which is used in select list.
--- We can use it with select & aggregate function
select city,count(*) from data group by city;
select sum(per),city from data group by city;
select avg(per),city from data group by city;
select name,sum(salary) from data group by name;
select avg(per) from data group by per;
select min(DOB) from data;


--------------------------------------------------------- ORDER BY -----------------------------------------------------------------------------------
-- Arrange the data in either ascending or descending order we can use it. Default order is Ascending.
-- We can use it with select clause
select name from data order by city;
select name,per from data order by per desc;
select name from data order by salary desc;
select * from data order by salary asc;
select * from data;


----------------------------------------------------------- HAVING --------------------------------------------------------------------------------------
-- It is always used with GROUP BY clause. It is used to fetch records which is grouped already.
-- Here select should have aggregate function in select list and in group by clause use column which is used in select list & in having clause use column used in select.
-- We can use it with select & group by clause.
select city,count(city) from data group by city having count(city)>2;
select roll_no,sum(salary) from data group by roll_no having roll_no>7;
select * from data having roll_no>5;
select name,min(roll_no) from data where city='Sangli';  
select city, count(*) from data group by city having count(city)>1;
select distinct city from data; -- its is used to fetch the unique/distinct cities from the table data


------------------------------------------------------- BETWEEN --------------------------------------------------------------------------------------
-- We can fetch data within specifi range then we can use BETWEEN clause.
-- We can use it with select and Where clause.
-- here both the values are inclusive 
select * from data where salary between 20000 and 25000;
select name,dob from data where dob between '1995-01-01' and '1998-01-01';
select name,roll_no from data where roll_no between 1 and 2;
select * from data where salary;

---------------------------------------------------- LIMIT & OFFSET -------------------------------------------------------------
/* LIMIT clause is used to specify the maximum number of rows that the query should return.
   OFFSET clause is used to specify the number of rows to skip before starting to return rows from the query. */
use clause;
select * from data1 limit 2; -- It will fetch the top 2 records
select * from data1 limit 1 offset 2; -- It will fetch the third record from table 
select * from data1 order by per desc limit 1 offset 2; -- It will fetch the third largest per from table
select * from data1 limit 2,1; -- It will fetch third record from table. Here, limit 2,1 means it will skip first 2 records & print next record.


-------------------------------------- EXERCISE -------------------------------------------------------------------------------
use clause;
 show tables;
 select * from data;
 INSERT INTO data (name, roll_no, DOB, per, city)
VALUES
    ('Alice', 101, '2000-05-12', 89.50, 'New York'),
    ('Bob', 102, '2001-07-19', 78.75, 'Los Chicago'),
    ('Charlie', 103, '1999-11-23', 92.40, 'Chicago'),
    ('Diana', 104, '2002-03-15', 85.20, 'Houston'),
    ('Ethan', 105, '2000-12-09', 91.60, 'New york');

 update data set city='Chicago' where roll_no=101;

 -- 1. SELECT Clause -- Retrieve all columns from the data table.
 select * from data;
 
 -- 2. WHERE Clause -- Retrieve records where the percentage (per) is greater than 85.
select * from data where per>85;

-- 3. ORDER BY Clause -- Sort the records by per in descending order.
select * from data order by per desc;

-- 4. GROUP BY Clause -- Group records by city and calculate the average percentage of students in each city.
select city,avg(per) from data group by city;

-- 5. HAVING Clause -- Filter groups where the average percentage is greater than 85. 
select avg(per) as Avg_per,city from data group by city having avg(per)>85;

-- 6. DISTINCT Clause -- Retrieve distinct cities from the data table.
select distinct(city) from data;

-- 7. LIMIT  -- Retrieve the top 3 students with the highest percentages.
select * from data order by per desc limit 3; 

-- 8. OFFSET -- Retrieve the third highest percentage from the table 'Data'.
 select * from data order by per desc limit 1 offset 2;
 
-- 9. Find nth highest percentage -- GENERIC QUERY - just replace n with expected highest percentage
SELECT per 
FROM data d1 
WHERE 3-1 = (
    SELECT COUNT(DISTINCT per) 
    FROM data d2 
    WHERE d2.per > d1.per
);
