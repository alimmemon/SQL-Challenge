CREATE TABLE department (
  dept_no varchar(4),
  dept_name varchar,
  PRIMARY KEY (dept_no)
);
CREATE TABLE title (
  title_id varchar(5),
  title varchar,
  PRIMARY KEY (title_id)
);
CREATE TABLE employee (
  emp_no int,
  emp_title_id varchar(5),
  birth_date date,
  first_name varchar,
  last_name varchar,
  sex varchar(1),
  hire_date date,
  PRIMARY KEY (emp_no),
  FOREIGN KEY(emp_title_id) References title(title_id)
);
CREATE TABLE department_manager (
  dept_no varchar(4),
  emp_no int,
  FOREIGN KEY(dept_no) references department(dept_no)
);
CREATE TABLE salary (
  emp_no int,
  salary int,
  FOREIGN KEY(emp_no) references employee(emp_no)	
);
CREATE TABLE department_employee (
  emp_no int,
  dept_no varchar(4),
   FOREIGN KEY(emp_no) references employee(emp_no),
   FOREIGN KEY(dept_no) references department(dept_no)
);


--Answer to question 1


select emp.emp_no as "Employee Number",
emp.last_name as "Last Name",
emp.first_name as "First Name",
emp.sex as "Gender",
sal.salary as "Salary"
from 
	employee as emp
left join 
	salary as sal
on 
	emp.emp_no = sal.emp_no


-- Answer to question 2

select * from employee;

select first_name, last_name, hire_date
from employee
where date_part('year', hire_date)=1986



--Answer to question 3

select* from department, department_manager, employee;


select emp.emp_no as "Employee Number", 
emp.last_name as "Last Name", 
emp.first_name as "First Name",
dept.dept_no as "Department Number",
dept.dept_name as "Department Name"
from 
	employee as emp
right join
	department_manager
on
	department_manager.emp_no = emp.emp_no
right join
	department as dept
on 
	department_manager.dept_no = dept.dept_no

-- Answer to question 4

SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
LEFT JOIN
	department_employee 
ON
	emp.emp_no=department_employee.emp_no
LEFT JOIN
	department as dept
ON



-- Answer to question 5

select 
	first_name, last_name, sex
from
	employee
where
	first_name= 'Hercules' 
	and
	last_name= 'B%'

-- Answer to question 6

select
	emp.emp_no as "Employee Number",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	dept.dept_name as "Department Name"

from
	employee as emp 
right join 
	department_employee
ON
	emp.emp_no=department_employee.emp_no
right join
	department as dept
on
	department_employee.dept_no=dept
and
	dept.dept_name is ('Sales')


-- Answer to question 7

SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
Right JOIN
	department_employee 
ON
	emp.emp_no=department_employee.emp_no
Right JOIN
	department as dept
ON
	department_employee.dept_no=dept.dept_no 
AND
	dept.dept_name in ('Sales','Development')




-- Answer to question 8
select last_name, count(*) as frequency
from employee
group by last_name
order by last_name desc












