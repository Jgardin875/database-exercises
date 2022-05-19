use employees;

#2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. 
select * from employees
where first_name IN ('Irena', 'Vidya', 'Maya');

select count(first_name) from employees
where (first_name IN ('Irena', 'Vidya', 'Maya')); #returns 709

#3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? 
select * from employees
where first_name = ('Irena' or 'Vidya' or 'Maya');

select count(first_name) from employees
where first_name = ('Irena' or 'Vidya' or 'Maya'); #It returns 300,0024 because all the names that are Vidya are not Irene and all the names that are Irena are not Vidya, therefore every entry fits this description
#Proof:
select count(first_name) from employees; #300,024

#Using OR a different way
select * from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';

select count(first_name) from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'; #709 This method works accurately for what we were aiming for and it matches #2

#4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
select * from employees
where gender = 'M' and (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya');

#5Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. 
select * from employees
where last_name like 'e%';

select count(last_name) from employees
where last_name like 'e%'; #7330

#6 Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E? 
select * from employees
where last_name like 'e%' or last_name like '%e';

select count(*) from employees
where last_name like 'e%' or last_name like '%e'; #30723

select 30723 - 7330; #23393

#7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E? 
select * from employees
where last_name like 'e%' and last_name like '%e';

select count(*) from employees
where last_name like 'e%' and last_name like '%e'; #899

select * from employees
where last_name like '%e';

select count(*) from employees
where last_name like '%e'; #24,292

#8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned. 
#Method 1
select * from employees
where hire_date between '1990-01-01' and '1999-12-31';

#Method2
select * from employees
where hire_date like '199%';

select count(*) from employees
where hire_date like '199%'; #135,214

#9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. 
select * from employees
where birth_date like '____-12-25';

select count(*) from employees
where birth_date like '____-12-25'; #842

#10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. 
select * from employees
where birth_date like '%12-25' and hire_date like '199%';

select count(*) from employees
where birth_date like '%12-25' and hire_date like '199%'; #362

#11 Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. 
select * from employees
where last_name like '%q%';

select count(*) from employees
where last_name like '%q%'; #1873

#12 Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? 
select * from employees
where last_name like '%q%' and last_name not like '%qu%';

select count(*) from employees
where last_name like '%q%' and last_name not like '%qu%'; #547

select * from employees;





