/*The ALTER TABLE statement is used to add, delete, modify or rename columns in an existing table.
The ALTER TABLE statement is also used to add and drop various constraints on an existing table*/

-- Alter table statement with add new column.
use cre;
desc vikram;
alter table vikram add column email varchar(255) after name;
alter table vikram modify column age float(6,2);

-- Alter table statement with drop
alter table vikram drop column email;
alter table vikram drop column Eem;

-- Alter table statement with Rename 
alter table vikram rename column email to gmail;
alter table vikram rename column gmail to eem;

-- Alter table with modify command(If we want to change the data type)
alter table vikram modify column gmail int(10);
alter table vikram modify column per float(4,2);

-- Alter table statement also used to add or delete constaraints.
alter table vikram add constraint primary key(gmail);
alter table vikram add constraint check(age>18);
desc vikram;
select * from vikram; 
truncate table vikram;

alter table vikram drop primary key;
alter table vikram drop check chk_age;


insert into vikram values('Mahesh',70.87,19.2056);
select * from vikram;
/*mahesh*/ truncate table vikram; 




 