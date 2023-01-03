-- 1). Display all infomation in the tables EMP and DEPT
-- select * from employees inner join departments on employees.department_id = departments.department_id;

-- 2). Display only the hire date and employee name for each emplyee.
-- select hire_date from employees;

-- 3).Display the name concatenated with the job ID, separateed by a comma and space, 
--  and name the column Emplyee and Title.
-- select concat(first_name,' ',last_name,' ',job_id) as 'Emplyee ans Title' from employees;

-- 4), Display the hire data, name and department numbeer for all clerks.
-- select hire_date, concat(first_name,' ',last_name) as 'name', department_id from employees;

-- 5). Create a query to display all the data from a EMP table. separated each column by a comma. 
-- Name the column THE_OUTPUT.
-- select concat(employee_id,' ',first_name,' ',last_name,' ',email,' ',phone_number,' ',hire_date,' ',job_id,' ',salary,' ',manager_id,' ',department_id) 
-- as 'THE_OUTPUT' from employees;

-- 6). Display the name and salaries greather than 2000.
-- select concat(first_name,' ',last_name), salary from employees where salary > 2000;

-- 7). Dispaly the names and dated of employee with column header "Name" and "Start Date".
-- select concat(first_name,' ',last_name) as 'Name', hire_date as 'Start_Date' from employees;

-- 8). Dispaly the names and hire dated of all emplyee in the order they were hired.
-- select hire_date, concat(first_name,' ',last_name) from employees order by hire_date;

--  9). Dispaly the names and salaried of all employee in reverse salary order.
-- select concat(first_name,' ',last_name), salary from employees order by salary DESC;

-- 10). Dispaly 'ename' and 'deptno' who are all earned commission and display the 
-- salary in reverse order.
-- insert into employees (commission) value ('100');

-- 11). Display the last name and job title of all employee who do not have a manager.
-- select employees.last_name, jobs.job_title from employees inner join jobs 
-- on employees.job_id = jobs.job_id where employees.manager_id is Null;

-- 12). Dispaly the laast name,job, and salary for all employee whose job is sales 
--      representative or stock clerk and whose salary is not equal to $2500,$3500 or $5000.
-- select employees.last_name, jobs.job_title, employees.salary from jobs inner join employees on employees.job_id = jobs.job_id
-- where job_title like '%sales%' or job_title like '%clerk%' and salary not in ('2500','3500','5000');

-- **** AGGRAGATORS ****
-- 1) Display the maximum, minimum and average salary and commission earned. 
-- select max(salary) as 'max_salary', min(salary) as 'min_salary', avg(salary) as 'avg_salary' from employees;

-- 2) Display the department number, total salary payout and total commission payout for each department. 
-- select employees.salary, departments.department_name, commission from employees inner join departments 
-- on employees.department_id = departments.department_id order by department_name;

-- 3) Display the department number and number of employees in each department. 
-- insert into departments (department_no) values ('1'); 


-- **** strings ****

-- 1). Write a query displays the employee's Last names only from the strings 2-5% position with the first letter 
-- capitalized end all other letters Lowercase, Give each column an appropriate lebel.
-- select CONCAT(UCASE(LEFT(last_name, 1)), LCASE(SUBSTRING(last_name, 2))) as Emp_Names from employees;

-- 2). Write a query displays the employee's first name end lest neme along with a in between tor e.g.: 
-- first name : Ram ; Last name : Kumar then Ram-Kumar. Also displays the month on vmch the employee hes joined. 
-- select concat(first_name,'-',last_name) as 'name', hire_date from employees;

-- 3). Write a query to display the employee's last name and if half of the salary is greater then ten thousand  
-- then increase the salary by 10% else by 11.5% alongwith the bonus amount of 1500 each. Provide each column an appropriate label. 
-- update employees
-- set salary = (salary + 10/100)
-- where salary / 2 > 10000;

-- 4). Display the employee ID by Appending two zeros after 2nd digit and '-E' in the end, department it, salary and the 
-- menager name all in upper case, if the Manager name consists of 'z' replace it with '$'.
-- select concat(left(employee_id,2)*100+right(employee_id,1),'-E'), department_id, salary, first_name,
-- if (first_name not like '%z%',upper(first_name), '$') as changed_irst_name from employees;

-- 5). Write a query displays the employee's Last names with the first letter capitalized and all other letters lowercase,
-- and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate lebeL Sort 
-- the results by the employees' last nemes 
-- ****** 
-- select last_name , if(last_name like 'A%','B%' , length(last_name), 0) as last_name_length from employees order by last_name;

-- 6). Create a query to display the last name and salary for all employees. Format the salary to be 15 
-- characters Long, left-padded with $. Label the column SALARY 
-- select last_name, LPAD(salary, 15, '$') as SALARY from employees;

-- 7). Display the employee's neme if it is palindrome 
-- ************

-- string - b

-- 8. Display First names of all employees with initcaps
-- select initcap(first_name) from employees;

-- 9. From LOCATIONS table, extract the word between first end second space from the STREET ADDRESS column.
-- ****************  
-- select street_address from locations where street_address like '% % %';

-- 10. Extract trst letter trom First Neme column and append it with the Last Name. ALSO add "@systechusa.com" at the end. Name the 
-- column as e-mail address. All characters should be in Lower case. Display this along with their First Name. 
-- select lower(concat(left(first_name,1), last_name, "@systechusa.com")) as 'e-mail address', first_name from employees;

-- 11. Display the names end job titles ot all employees with the same job es Trenne.
-- select concat(employees.first_name, employees.last_name) as 'name', jobs.job_title from employees inner join jobs 
-- on employees.job_id = jobs.job_id where jobs.job_title = 'Trenne';

-- 12. Display the names end department name of all employees working in the same city as Trenne. 
-- select concat(employees.first_name, employees.last_name) as 'name', departments.department_name from ((departments
-- inner join employees on departments.department_id = employees.department_id
-- inner join locations on departments.location_id = locations.location_id))
-- where locations.city = 'Trenna';

-- 13. Display the name of the employee wtose salary is the Lowest.
-- select concat(employees.first_name, employees.last_name), salary as 'name' from employees order by salary DESC;

-- 14. Display the names of employees except the lowest paid. 
-- select first_name, if(salary > avg(salary), salary, '0') from employees;