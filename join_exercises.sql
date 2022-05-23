use join_example_db;
select * from roles; #4
select * from users; #6

#1 Select all the records from both the users and roles tables. Join.
select *
from users
join roles on users.role_id = roles.id;
#1 left join
select *
from users
left join roles on users.role_id = roles.id;
# right join 
select *
from users
right join roles on users.role_id = roles.id;

#Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
 SELECT count(users.name),
		roles.name
    FROM
        users
    Right JOIN roles ON users.role_id = roles.id
    Group by roles.name;

####!!!The below is wrong, but I would like to leave it there for my learning purposes. Please skip to the next blue comment to continue grading. 

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SELECT 
    role_name, COUNT(roles_name)
FROM

(SELECT 
			users.id AS user_id,
            users.name AS user_name,
            users.email AS user_email,
            users.role_id,
            roles.id AS roles_id,
            roles.name AS roles_name
    FROM
        users
    LEFT JOIN roles ON users.role_id = roles.id
    GROUP BY roles_name) as mini;





SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    users.role_id,
    roles.id AS roles_id,
    roles.name AS roles_name
FROM
    users
        LEFT JOIN
    roles ON users.role_id = roles.id;
    
    
    SELECT count(users.name),
            roles.name
    FROM
        users
    Right JOIN roles ON users.role_id = roles.id
    GROUP BY users.name;

 SELECT count(users.name),
		roles.name
    FROM
        users
    Right JOIN roles ON users.role_id = roles.id
    Group by roles.name;
    
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#####!!!Start grading again here!!!####
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

use employees;

#2shows each department along with the name of the current manager for that department
SELECT 
    CONCAT(employees.first_name, ' ',
            employees.last_name) AS Dept_Manager,
    departments.dept_name
FROM
    employees
        JOIN
    dept_manager ON employees.emp_no = dept_manager.emp_no
        JOIN
    departments ON dept_manager.dept_no = departments.dept_no
    where dept_manager.to_date > now();
    
#3 Find the name of all departments currently managed by women
SELECT 
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS Dept_Manager,
    departments.dept_name
FROM
    employees
        JOIN
    dept_manager ON employees.emp_no = dept_manager.emp_no
        JOIN
    departments ON dept_manager.dept_no = departments.dept_no
WHERE
    dept_manager.to_date > now() and employees.gender = 'F';
    
#4 Find the current titles of employees currently working in the Customer Service department.
select titles.title, count(*)
from 
dept_emp
join
titles on dept_emp.emp_no = titles.emp_no
where dept_emp.dept_no = 'd009'
and dept_emp.to_date> now()
and titles.to_date > now()
group by (titles.title);
#LEARNED: you have ot filiter by date on both tables that were joined together

#5 Find the current salary of all current managers.
select dept_name as Department_Name, concat(employees.first_name, ' ', last_name), salary 
from
salaries
join 
employees on salaries.emp_no = employees.emp_no
join
dept_manager on employees.emp_no = dept_manager.emp_no
join 
departments on dept_manager.dept_no = departments.dept_no
where salaries.to_date > now()
and dept_manager.to_date > now()
order by Department_Name asc;

#6 Find the number of current employees in each department.
select dept_emp.dept_no, dept_name, count(*)
from
dept_emp
join
departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date > now()
group by dept_no
order by dept_no asc;

#7 Which department has the highest average salary? Hint: Use current not historic information.
select dept_name, avg(salary)
from
salaries
join
dept_emp on salaries.emp_no = dept_emp.emp_no
join
departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date > now()
and dept_emp.to_date > now()
group by dept_name
order by avg(salary) desc
limit 1;
# cannot do select max(avg(salary)) because max and avg are query functions, you would need a query within a query to do max and avg


#8 Who is the highest paid employee in the Marketing department?
select employees.first_name, employees.last_name
from
employees
join 
salaries on employees.emp_no = salaries.emp_no
join
dept_emp on salaries.emp_no = dept_emp.emp_no
where salaries.to_date > now()
and dept_no = 'd001'
order by salary desc
limit 1;

#9 Which current department manager has the highest salary?
select employees.first_name, employees.last_name, salary, departments.dept_name
from
employees
join 
salaries on employees.emp_no = salaries.emp_no
join
dept_manager on salaries.emp_no = dept_manager.emp_no
join
departments on dept_manager.dept_no = departments.dept_no
where salaries.to_date > now()
and dept_manager.to_date > now()
and dept_name = 'Marketing'
order by salary desc;


#10 Determine the average salary for each department. Use all salary information and round your results.
select dept_name, round(avg(salary), 0)
from
salaries
join
dept_emp on salaries.emp_no = dept_emp.emp_no
join
departments on dept_emp.dept_no = departments.dept_no
group by dept_name
order by avg(salary) desc;
#round works becuase it is a basic function-not a query within a query

select * from titles;
select * from dept_emp;
select * from departments;
select * from salaries;
select * from dept_manager;
select * from employees;




