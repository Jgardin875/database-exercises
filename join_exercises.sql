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

#####!!!Start grading again here!!!####
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








