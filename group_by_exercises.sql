use employees;

#1 How many unique titles have there ever been?
select count(distinct title) from titles; #7

select * from titles;

#2find a list of all unique last names of all employees that start and end with 'E' using GROUP BY
#Distinct
select distinct(last_name) from employees
where last_name like 'e%e';

#group by
select last_name from employees
where last_name like 'e%e'
group by last_name;

#5 find the unique last names with a 'q' but not 'qu'. Include those names in a comment 
select last_name from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name; #Chleq, Lindqvist, Qiwen

#6 Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
select count(last_name) from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name; #189/190/168

#7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. 
select gender, count(first_name) from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by gender; #M 441/F 268


#8 Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
select sum(name_count) - count(name_count)
from
(SELECT 
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) as user_name, count(*) as name_count
FROM
    employees
    Group by user_name
    Having name_count > 1) as mini;
    
    
    


#Test by doing a smaller group by hand, make sure it's acutally giving me what I want
sELECT 
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) as user_name, count(*) as name_count
FROM
    employees
    Group by user_name
    Having name_count > 1 limit 3; #it worked!
    
#9 BONUS:
    
    
    
    