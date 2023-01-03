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

-- 4. display the department number and total salary of employees in each department.
-- select department_id as department_number,sum(salary) as total_salary_of_employee_ineach_department from employees
-- group by department_id;

-- 5. display the employees names who doesn't earn a commission.order the result set without using the column name. (here 3 is the
-- commission_earned column ie third coulmn in select query)
-- select first_name,last_name,commission_earned from employees where commission_earned = 0  order by 3;

-- 6. display the employees name,department_id  and commission .if an employee doesn't earn the commission then display as 'no commission'.
-- name the column appropriately.
-- select first_name,last_name,department_id,commission_earned,if(commission_earned = 0,"NO COMMISSION",commission_earned) 
-- as result from employees;

-- 7. display the employees name,salary and commission multiplied by 2 .if an employee doesn't earn the commission,then display as 
-- 'no commission'.name the column appropriately.
-- select concat(first_name,last_name) as name, salary, if(commssion = 0, 'no commssion', commission * 2) as commssion_earned from employees;

-- 8. display the employees name,department_id who have the first name same as another employee in the same department.
-- select first_name, last_name, department_id from employees where first_name in (
-- select first_name from employees having count(first_name) > 1);

--  9. display the sum of salaries of the employees working under each manager.
-- select sum(salary), manager_id from employees group by manager_id;

-- 10. select the manager name,count of employees working under and the department id of the manager.
-- select manager_id, count(first_name) as Total_Staff_under_one_manager, department_id from employees group by manager_id;

-- 11. select the emp name,dept id,and salary.group the result with the manager name and the employee last name should have 
-- second letter 'a'.
-- select first_name,last_name, department_id, salary, manager_id from employees where last_name like '_a%' order by manager_id;

-- 12. display the average of sum of the salaries and group the result with the dept id .order the result with the dept id.
-- select sum(salary) / count(department_id) as avg, department_id from employees group by department_id;

-- 13. select the maximum salary of dept along with the dept id .
-- select max(salary), department_id from employees;

-- 14. display the commission , if not null display 10% 0f salary, if null display a default value 1.
-- select if(commission is not null, 0.10 * salary, 'null' ) as commission from employees;

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

-- **** 4 JOINS **** 

-- 1. Write a query to display the last name, department number, department name for all employees.
-- select employees.last_name, departments.department_no, departments.department_name from departments inner join employees
-- on departments.department_id = employees.department_id;

-- 2. Create a unique list of all jobs that are in department. Include the location of the department in the output.
-- select DISTINCT departments.department_name, locations.city from departments inner join locations on departments.location_id = locations.location_id;

-- 3. Write a query to display the employee last name,department name ,location id and city of all employees who earn commission.
-- select e.first_name,e.last_name, d.department_name, d.location_id, l.city from employees e, departments d, locations l where e.department_id = d.department_id
-- and d.location_id = l.location_id and e.commission_earned > 0;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name*/
-- select employees.last_name,departments.department_name from employees inner join departments on employees.department_id = departments.department_id
-- where last_name like '%a%';

-- 5. Write a query to display the last name ,job,department number and department name for all employees who work in TORONTO.
-- select employees.first_name,employees.last_name,employees.job_id,employees.department_id,departments.department_name from employees join departments 
-- on employees.department_id=departments.department_id join locations on departments.location_id=locations.location_id where locations.city = 'toronto';

-- 6. Display the employee last name and employee number along with their manager's last name and manager number.
-- select employee_id,first_name,last_name,manager_id from employees;

-- 8. Create a query that displays employees last name ,department number,and all the employees who work in the same department as a given 
-- employee.
-- select employees.first_name,employees.last_name,employees.department_id from employees inner join departments on 
-- employees.department_id= departments.department_id;

-- 9. Create a query that displays the name ,job,department name ,salary,grade for all employees.
-- Derive grade based on salary(>=50000=A, >=30000=6,<30000=C)

-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. 
-- Label the columns as Employee name , emp_hire_date,manager name,man_hire_date

-- **** 5. SUB - QUERY ****

-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.
-- select employees.last_name, employees.hire_date from employees inner join departments on employees.department_id = departments.department_id
-- where departments.department_name = 'SALES';

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. 
-- Sort the results in ascending order of salary.
-- select employee_id, last_name, salary from employees where salary > (select avg(salary) from employees) order by salary;

-- 3. Write a query that displays the employee numbers and Last names of all employees who work in a department with any employee whose 
-- last name contains a u
-- select employee_id, last_name, department_id from employees where last_name like '%u%' order by department_id; 
 
-- 4. Display the last name, department number, and job ID of all employees whose department Location is 1800.
-- select last_name, department_id, job_id from employees inner join locations where location_id = 1800;

-- 5. Display the last name and salary of every employee who reports to king.
-- select last_name, salary from employees where last_name like 'King';

-- 6. Display the department number, last name, and job ID for every employee in the marketing department
-- select department_no, last_name, job_id from departments inner join employees on departments.department_id = employees.department_id
-- where department_name = 'marketing'

-- 7. Modify the above query to display the employee numbers, Last names, and salaries of all employees who earn more than the average 
-- salary and who work in a department with any employee with a' ts' in their name.
-- select department_no, last_name, salary from employees inner join departments on departments.department_id = employees.department_id
-- where salary > (select avg(salary) from employees) and first_name like '%a' or '%ts' 

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.
-- select employees.first_name,employees.last_name from employees inner join jobs on employees.job_id = jobs.job_id 
-- join departments on departments.department_id = employees.department_id where department_name = 'sales';

-- 9. Write a compound query to produce a List of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 
-- are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees 
-- in department 6 are not given a raise.
-- select employee_id, '5%' as per_raise, salary * 1.05 as 'new salary', salary as 'old_salary' from  employees where department_id in (1,3) union
-- select employee_id, '10%' as per_raise, salary * 1.10 as 'new salary', salary as 'old_salary' from  employees where department_id in (2) union
-- select employee_id, '15%' as per_raise, salary * 1.15 as 'new salary', salary as 'old_salary' from  employees where department_id in (4,5) union
-- select employee_id, '5%' as per_raise, salary as 'new salary', salary as 'old_salary' from  employees where department_id in (6);

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their Last names and salaries.
-- select last_name, salary from employees order by salary DESC limit 3

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have 0 in 
-- the commission column
-- select salary, commission from employees where commission = 0;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.*/
-- select manager_id ,salary, department_id from employees group by department_id order by salary DESC limit 3;

-- **** DATA FUNCTION ****
