use Company;
select * from manager;
-- drop
-- can drop tables, or whole database

-- insert
-- when you have a column that will auto-increment, or other columns you don't want to fill
-- specify which columns you will provide data for
-- doesn't need to be in the order they are in the table, but order you list them must match order you put data in
-- can do multiple rows at once, separate parentheses with commas
insert into manager(first_name, last_name) values ('Santa','Claus'), ('Christmas','Elf'), ('Jane','Eyre');

-- update
-- to change data in existing rows
-- use where to "filter" the table
update manager set last_name='Rochester' where man_id=4;
-- by default safe-mode is on, so you need to use primary key to identify the row
-- may be some scenarios where you want to update all rows with a certain value in one field so would need to turn off safe mode

-- also use update to delete data from single column
update manager set first_name=null where man_id=3;
-- null is an unknown value, a value that has not been provided
-- not the same as 0 or an empty string

-- delete
-- deletes the whole row
delete from manager; -- will clear the whole table of all data
delete from manager where man_id = 4;
-- will not recycle auto-increment ID numbers
-- but can insert a new row with the deleted ID

-- select
-- select * from table to see all data in table
-- name columns to see only some
select first_name, last_name, manager_id from employee;
-- use where to filter and only see certain rows
select first_name, last_name from employee where manager_id = 2;
-- can specify alias for returned columns
select first_name as fname, last_name as lname from employee where manager_id != 2;
-- can order returned data (default ascending)
select * from employee order by first_name;
select * from employee order by emp_role desc;
-- database can do processing faster than python, so do it in the database if you can

-- calculate virtual column
-- multiplying dep_id by 3.5 and returning that in a virtual column "age"
-- doesn't alter the actual database, this calculated column only exists when reading it
select first_name, last_name, dep_id*3.5 as age from employee;
-- quotes around column alias are not required for single word alias
-- keyword as is also not required (dep_id*3.5 age) would be the same

-- concatenation, conbines values
select concat(first_name,' ',last_name) as 'full name' from employee;
-- distinct, returns unique values
select distinct manager_id from employee;
-- can also count, can combine with distinct
select count(distinct manager_id) from employee;
-- min, max, average calcs also possible
-- can introduce conditions
select * from employee where dep_id >6; -- can also do between (inclusive)
-- in works like or, can also do not in
select first_name, last_name, manager_id from employee where first_name in ("Tooth","Tom");
-- like
-- _ for single character % for any number of characters (incl none)
select * from employee where first_name like "T%"; -- first names that starts with "T"
-- SQL language is not case sensitive, however the data is!
-- starts with "T%" is not the same as "t%"
-- "%a%" contains an a
-- "_t%n%r_" more complicated pattern matching is possible!
-- can't match NULL!

-- join
-- still specify the connection, even though you already stated the foreign key connection when setting up tables!
-- inner join (default), only shows you the data that is matched up (does not include any employees without managers or managers without employees)
-- has duplicated foreign key data
select * from employee join manager on manager_id = man_id;
-- left or right outer join is also possible
-- left outer join: all employees, some may have null manager
-- right outer join: all managers, some may have null employee
select * from employee right outer join manager on manager_id = man_id;
-- to get rid of unneeded columns, specify the column names
-- where there is ambiguity, do table name . column name
-- can also use alias for table names
select e.first_name, e.last_name, m.first_name, m.last_name from employee e join manager m on manager_id = man_id;
