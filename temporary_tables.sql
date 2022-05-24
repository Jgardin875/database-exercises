use employees;

drop table if exists kalpana_1820.employees_with_departments;

#Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. 

create temporary table kalpana_1820.employees_with_departments as
select first_name, last_name, dept_name 
from
employees e
join dept_emp de using (emp_no)
join departments d using (dept_no)
where de.to_date > now();

select * from kalpana_1820.employees_with_departments;

#a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
Alter table kalpana_1820.employees_with_departments  add full_name varchar(50);

update kalpana_1820.employees_with_departments set full_name = concat(first_name, ' ', last_name);

select * from kalpana_1820.employees_with_departments;

#c Remove the first_name and last_name columns from the table.
alter table kalpana_1820.employees_with_departments drop column first_name, drop column last_name;

select * from kalpana_1820.employees_with_departments;

#d another way
create temporary table kalpana_1820.employees_with_departments as
select concat(first_name, ' ', last_name) as full_name, dept_name 
from
employees e
join dept_emp de using (emp_no)
join departments d using (dept_no)
where de.to_date > now();

select * from kalpana_1820.employees_with_departments;

#2 Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
use sakila;

drop table if exists kalpana_1820.sakila_payment;

select * from payment;
create temporary table kalpana_1820.sakila_payment as
select * from payment;

select * from kalpana_1820.sakila_payment;

#Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
alter table kalpana_1820.sakila_payment modify amount decimal(8,2);
update kalpana_1820.sakila_payment set amount = (amount * 100);
alter table kalpana_1820.sakila_payment modify amount int;

describe kalpana_1820.sakila_payment;
select * from kalpana_1820.sakila_payment;

#alter table kalpana_1820.sakila_payment modify amount float;

#3 Find out how the current average pay in each department compares to the overall current pay for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst? 
use employees;

drop table if exists kalpana_1820.dept_avg_sal;

create temporary table kalpana_1820.dept_avg_sal as
select avg(salary), dept_name 
from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
where s.to_date > now() and de.to_date >now()
group by d.dept_name;

#same but with different naming
create temporary table kalpana_1820.dept_avg_sal as
select avg(salary) as salary, dept_name 
from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
where s.to_date > now() and de.to_date >now()
group by d.dept_name;

select * from kalpana_1820.dept_avg_sal;

drop table if exists kalpana_1820.comp_avg_sal;


create temporary table kalpana_1820.comp_avg_sal as
select avg(salary) as comp_avg
from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
where s.to_date > now() and de.to_date >now();

select * from kalpana_1820.comp_avg_sal;

SELECT *,
    (salary - (SELECT avg(salary) FROM salaries where to_date > now()))
    /
    (SELECT stddev(salary) FROM salaries  where to_date > now()) AS zscore
FROM kalpana_1820.dept_avg_sal;
