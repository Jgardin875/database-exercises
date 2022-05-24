#1Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

use employees;

SELECT 
    emp_no,
    CONCAT(first_name, ' ', last_name) AS full_name,
    dept_no,
    hire_date,
    to_date,
    IF(to_date > NOW(), TRUE, FALSE) AS employed
FROM
    employees e
        JOIN
    dept_emp USING (emp_no);


#2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
#method 1 and 2 both work
select first_name, last_name,
	case
		when last_name between 'A' and 'I' then 'A-H'
        when last_name between 'I' and 'R' then 'I-Q'
        else 'R-Z'
	end as alpha_group
from employees;
        
        #like 'a%' or last_name like 'b%' or last_name like 'c%' or last_name like 'd%' or last_name like 'e%' or last_name like 'f%' or last_name like 'g%' or last_name like 'h%' or last_name like 'i%' or last_name like 'j%' or last_name like 'k%' or last_name like 'l%' or last_name like 'm% n% o% p% q% r% s% t% u% v% w % x% y% z%



select first_name, last_name,
	case
		when substr(last_name, 1, 1) <= 'H' then 'A-H'
        when substr(last_name, 1, 1) >= 'R' then 'R-Z'
        else 'I-Q'
	end as alpha_group
from employees;


#3 How many employees (current or previous) were born in each decade?
select
count(case when birth_date like '195%' then birth_date else null end) as '50',
count(case when birth_date like '196%' then birth_date else null end) as '60'
from employees;

# when birth_date like '195%" then '1950s'

#4 What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

use employees;
select
case 
when d.dept_name in ('Research', 'Development') then 'R&D'
when d.dept_name in ('Sales', 'Marketing') then 'Sales & Mark'
when d.dept_name in ('Production', 'Quality Management') then 'Prod & QM'
when d.dept_name in ('Finance', 'Human Resources') then 'Finance & HR'
when d.dept_name in ('Customer Service') then 'Customer Service' 
else d.dept_name 
end as dept_group,
avg(salary)
from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
where s.to_date > now() and de.to_date > now()
group by dept_group;





select * from departments;



create temporary table kalpana_1820.dept_avg_sal_hist as
select avg(salary), dept_name 
from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
group by d.dept_name;








