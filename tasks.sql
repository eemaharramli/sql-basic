create database HR
use HR

-- Creating Table for Employees
create table Employees(
    Employee_ID int primary key identity ,
    first_name nvarchar(20) not null ,
    last_name nvarchar(40) not null ,
    email nvarchar(30) not null ,
    phone_number nvarchar(20),
    hire_date date default getdate(),
    job_ID nvarchar(5) not null ,
    salary int not null ,
    department_ID int not null
)

-- Creating Table for Jobs

create table Jobs(
    job_ID nvarchar(5) not null,
    job_title nvarchar(40) not null
)

-- Create Table for Departments

create table Departments(
    department_ID int primary key ,
    department_name nvarchar(40) not null
)

insert into Employees(first_name, last_name, email, phone_number, job_ID, salary, department_ID)
values ('Elnur', 'Maharramli', 'elnur@maharramli.az', '+994 (55)-111-11-11', '1', 1111, 1),
       ('Akif', 'Talibov', 'akif@talibov.az', '+994 (55) 222-22-22', '2', 2222, 2),
       ('Sabir', 'Amirli', 'sabir@amirli.az', '+994 (50) 333-33-33', '3', 3333, 3),
       ('Xayali', 'Mammadov', 'xeyali@mammadov.az', '+994 (51) 444-44-44', '4', 4444, 4),
       ('Orxan', 'Nasibli', 'orxan@nasibli.az', '+994 (77) 555-55-55', '5', 5555, 5),
       ('Madat', 'Nazaraliyev', 'madat@nazaraliyev.az', '+994 (99) 666-66-66', '6', 6666, 6);


select *
from Departments;

insert into Departments values (1, 'Backend Development'),
                               (2, 'System Administration'),
                               (3, ''),
                               (4, 'Network Administration'),
                               (5, 'Linux Administration'),
                               (6, 'SCCM Administration')

insert into Jobs values ('1', 'Programming'),
                        ('2', 'Support for Microsoft Servers'),
                        ('3', ''),
                        ('4', 'Support for Network'),
                        ('5', 'Support for Linux Servers'),
                        ('6', 'Support for SCCM');

-- Joining all tables with natural join?

select *
from Employees
    join Departments D on Employees.department_ID = D.department_ID
    join Jobs J on Employees.job_ID = J.job_ID;

-- Joining all tables with inner join

select * from Employees
inner join Departments D on Employees.department_ID = D.department_ID
inner join Jobs J on Employees.job_ID = J.job_ID

-- Show employees with salary more than average

select *
from Employees
where salary > (select avg(salary) from Employees);

-- Show employees with two 'a' in a mail

select * from Employees
where email like '%a%a%'

-- Change email with conditions

update Employees set email = 'elnur@maharramli.az' where Employee_ID = 1
update Employees set email = 'akif@talibov.com' where first_name like 'akif'
update Employees set email = 'sabir@amirli.net' where last_name like '%amir%'
update Employees set email = 'xayali@mammadov.org' where salary between 4000 and 5000
update Employees set email = 'orxan@nasibli.ua' where department_ID = 5
update Employees set email = 'madat@nazaraliyev.me' where hire_date like '%02-20%'

-- Show employees with domain name com

select *
from Employees
where email like '%com';

-- Show employees with name length more than 4 char

select *
from Employees
where len(first_name) > 4;

-- Concat employee name and surname with column name full name

select concat(first_name, ' ' ,last_name) as 'Full name' from Employees
where first_name is not null and last_name is not null

-- Show employees with hire date early than 2021 October

select * from Employees
where hire_date <= '2021-10-12'

-- Show operator code from employee phone number

select first_name, last_name, substring(phone_number, charindex('(', phone_number) + 1, 2) as 'Operator Code' from Employees


-- Show employees with hiring in 2019

select * from Employees
where hire_date like '%2019%'

-- Show all employees with salary + 20% and symbol $

select first_name, last_name, concat(salary + (salary * 0.2), '$') as commission_pct from Employees

-- Show the sum of employees and they salary

select concat(count(*), ' ' ,'persons') as 'Employee count', sum(salary) 'Sum of employee salary' from Employees









