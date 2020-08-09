-- Verify the import data
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--select emp_no as employee_number, last_name ,"Sex" from employees
-- select emp_no,salary from salaries

--using join funtion on employee and salaries tables  to get the  reqired fields(employee number, last name, first name, sex, and salary)
select emp.emp_no,emp.last_name,emp."Sex" ,emp.first_name,sal.salary 
from employees as emp
inner join salaries as sal
on emp.emp_no=sal.emp_no

-- check the numberof records
select count(*)  from employees

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

--join dept-manager and employee  and departments tables to get  employee number, last name, first name.
--query
select dept.dept_no,dept.dept_name,emp.emp_no,emp.last_name,emp.first_name
from departments as dept
inner join dept_manager
on dept.dept_no= dept_manager.dept_no
inner join employees as emp
on dept_manager.emp_no=emp.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

--select deptm.dept_name,deptm.dept_no,depte.emp_no,emp.last_name,emp.first_name
select depte.emp_no,emp.last_name,emp.first_name,deptm.dept_name
from departments as deptm
inner join dept_emp as depte
on deptm.dept_no=depte.dept_no
inner join employees as emp
on emp.emp_no=depte.emp_no

--

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name,last_name,"Sex"
from employees
where first_name= 'Hercules' and last_name like 'B%'


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept.dept_name,depte.emp_no ,emp.last_name,emp.first_name
from departments as dept
inner join dept_emp as depte
on dept.dept_no=depte.dept_no
inner join employees as emp
on emp.emp_no=depte.emp_no
where dept.dept_name='Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select depte.emp_no ,emp.last_name,emp.first_name,dept.dept_name
from departments as dept
inner join dept_emp as depte
on dept.dept_no=depte.dept_no
inner join employees as emp
on emp.emp_no=depte.emp_no
where dept.dept_name='Sales' or  dept.dept_name= 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	count( emp_no ) as employeeNumber
FROM
	employees
GROUP BY
	last_name
ORDER BY
	employeeNumber Desc;

-- Bonus


--Create a bar chart of average salary by title.
select * from salaries
select * from titles
select * from employees
--3. Create a bar chart of average salary by title.

-- join two tables employees and salaries to get the the required fields
create view joinemployees_salaries as
select emp."emp_title-id" as title_id,emp.last_name,emp.first_name,sal.salary 
from employees as emp
inner join salaries as sal
on emp.emp_no=sal.emp_no

-- check view   joinemployees_salaries table data
select * from  joinemployees_salaries
--using joinemployee_salaries table we can get average salary and title id
select  title_id, round(avg(salary),2) as avearage_salary 
from joinemployees_salaries
group by(title_id)
order by (title_id)
--



	
	
	
	

