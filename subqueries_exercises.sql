use employees;

#1 Find all the current employees with the same hire date as employee 101010 using a sub-query.
select first_name, last_name
from employees
where hire_date = (select hire_date from employees where emp_no = '101010');

#2 Find all the titles ever held by all current employees with the first name Aamod.
select title from (select * from employees where first_name = 'Aamod') as mini
join titles using (emp_no);


#3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select count(*) from (select * from salaries where salaries.to_date < now())as mini
join employees using (emp_no);
#2,603,923

select count(*) from salaries where to_date < now();
# need a subquery for this one #2,603,923

#4Find all the current department managers that are female. List their names in a comment in your code.
select first_name, last_name from (select * from employees where gender = 'F') as mini 
join dept_manager using (emp_no) where to_date > now();

#5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select concat(first_name, ' ', last_name)
from employees join salaries using (emp_no)
where salary > (select avg(salary) from salaries)
and to_date > now()
group by concat(first_name, ' ', last_name);

/*6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

    Hint You will likely use multiple subqueries in a variety of ways
    Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
*/

#First part: How many current salaries are within 1 standard deviation of the current highest salary?
select count(*) from salaries
where to_date > now()
and salary > (select max(salary) from salaries where to_date > now()) - (select stddev(salary) from salaries where to_date>now());

#second part What percentage of all salaries is this?

select count(*) from salaries 
where to_date > now();


select
(select count(*) from salaries
where to_date > now()
and salary > (select max(salary) from salaries where to_date > now()) - (select stddev(salary) from salaries where to_date>now()))
/ 
(select count(*) from salaries 
where to_date > now()) * 100;








select * from salaries;
select avg(salary) from salaries;







