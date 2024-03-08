create database juin;
use juin;
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



