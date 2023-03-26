create database Company;

use Company;

create table manager(
	man_id smallint not null primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50) not null );

insert into  manager values (1, "Martina", "Yusuf");

select * from manager;

create table employee(
	emp_id smallint not null primary key auto_increment,
	first_name varchar(50),
	last_name varchar(50) not null,
	dep_id smallint not null,
	dep_name varchar(5),
	emp_role varchar(20),
	manager_id smallint,
	foreign key (manager_id) references manager(man_id) );
    
insert into employee values (1, "Tooth", "Fairy", 7, "IT", "HR", 1);

select * from employee;
