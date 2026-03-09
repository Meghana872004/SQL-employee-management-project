use employee_project;
show databases;

/*create tables*/

create table departments(
dept_id int primary key,
dept_name varchar(50),
location varchar(50));

create table employees(
emp_id int primary key,
emp_name varchar(50),
age int,
gender varchar(10),
dept_id int,
salary int,
joining_date date);

create table projects(
project_id int primary key,
emp_id int,
project_name varchar(50),
project_budget int);

show tables;

/* insert values*/

insert into departments values
(1,'HR','Bangaluru'),
(2,'IT','Hydrabad'),
(3,'Finance','Mumbai'),
(4,'Sales','Delhi'),
(5,'Marketing','chennai');

insert into employees values
(101,'Amit',28,'Male',2,60000,'2025-03-1'),
(102,'Priya',25,'Female',1,45000,'2025-01-15'),
(103,'Rahul',30,'Male',2,70000,'2023-07-20'),
(104,'Sneha',27,'Female',3,65000,'2020-11-12'),
(105,'Arjun',35,'Male',4,55000,'2022-09-05'),
(106,'Pooja',29,'Female',5,48000,'2023-02-18');

insert into projects values
(201,101,'AI system',500000),
(202,103,'Website Development',200000),
(203,104,'Financial Analysis',150000),
(204,105,'Sales Dashboard',100000),
(205,106,'Marketing Campaign',120000);

/*check table*/
select * from departments;
select * from employees;
select * from projects;

/*salary check with condition*/
select emp_name, salary
from employees
where salary>50000; 

/*average salary*/
select avg(salary) as average_salary
from employees; 

/*count employees in each department*/
select dept_id, count(*) as total_employees
from employees
group by dept_id;

/*join*/
select e.emp_name, d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id;

/*employee working on project*/
select e.emp_name, p.project_name
from employees e
join projects p
on e.emp_id = p.emp_id;

/*highest salary employee*/
select emp_name,salary
from employees
order by salary desc
limit 1;

/*Department wise average salary*/
select dept_id, avg(salary) as avg_salary
from employees
group by dept_id;

/*total project budget*/
select sum(project_budget) as total_budget
from projects;

/*employees joined after 2022*/
select emp_name, joining_date
from employees
where joining_date > '2022-01-01';

/*employees with their department name*/
select e.emp_name, d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id;

/* department name + average salary*/
select d.dept_name, avg(e.salary) as avg_salary
from employees e
join departments d
on e.dept_id=d.dept_id
group by d.dept_name;

/*2nd highest salary*/
select emp_name, salary
from employees
order by salary desc
limit 1,1;

/*subqueries (query inside another quesry) employee with highest salary*/
select emp_name, salary
from employees
where salary=(
select max(salary)
from employees);

/*window functions*/
select emp_name, salary,rank() over (order by salary desc) as salary_rank
from employees;

/*second highest salary using window function*/
select* from(select emp_name, salary, rank() over (order by salary desc) as rnk
from employees)t
where rnk = 2;
