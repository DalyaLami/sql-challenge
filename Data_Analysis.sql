
--1.List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
from employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_date
from employees
where hire_date between '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name
from dept_manager
left join departments
on departments.dept_no = dept_manager.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no
ORDER BY dept_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dept_emp.dept_no,departments.dept_name,dept_emp.emp_no,employees.last_name,employees.first_name
from dept_emp
left join departments
on departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
ORDER BY dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.last_name,employees.first_name,employees.sex
from employees
where employees.first_name = 'Hercules'
and employees.last_name Like 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
select dept_emp.emp_no,employees.last_name,employees.first_name
from dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
join departments 
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' ;

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name
from dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
join departments 
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;