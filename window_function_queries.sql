/* window function */

1. Aggregates function

(i) sum():-   /* perform sum of salary department wise */

select e.emp_id,e.emp_name,e.salary,d.dname,sum(e.salary)
over(partition by d.dname) as total_salary_by_dept
from emp e,dept d
where e.did=d.did;

(ii) avg():- /*perform average of the total salary department wise*/

select e.emp_id,e.emp_name,e.salary,d.dname,avg(e.salary)
over(partition by d.dname) as total_salary_by_dept
from emp e,dept d
where e.did=d.did;

(iii) count():- /* count the total no. of employees */

select distinct count(emp_id) 
over() as total_emp 
from emp;

/* count the total no. of employees department wise*/

select distinct d.dname,count(emp_id)
over(partition by d.dname) as total_emp_by_dept
from emp e,dept d
where e.did=d.did;

(iv) max() :- /* find maximum salary */

select distinct max(salary) over () as max_salary 
from emp;

/* find maximum salary dept wise */

select distinct d.dname,max(e.salary) over(partition by d.dname) as max_salary
from emp e,dept d
where e.did=d.did;

(v) min() :- /* find minimum salary*/

select distinct min(salary) over () as min_salary 
from emp;

/*find minimum salary gender wise */

select distinct gender,
min(salary) over(partition by gender) as min_salary_by_gender 
from emp;


2. Ranking function

(i) rank() :-  /* employees give the rank based on salary*/

select emp_id,emp_name,salary,
rank() over(order by salary desc) as salary_rank
from emp;

(ii) dense_rank() :- /* employees give the rank based on salary*/

select emp_id,emp_name,salary,
dense_rank() over(order by salary desc) as salary_rank
from emp;

(iii) row_number() :- /* give number to each row like 1,2,3...*/

select emp_id,emp_name,
row_number() over(order by emp_id) as row_number
from emp;

(iv) percent_rank() :- /* give number in percentage form first is always 0 and last one is always 1*/

select emp_id,emp_name,salary,
percent_rank() over(order by emp_id) as percent_rank
from emp;

3. Analytic/value function

(i) lead() :-  /*last value is null and first value is removed starting from second value */

select emp_id,
lead(emp_id) over(order by emp_id) as lead
from emp;

/* specify how many value we want as null */

select emp_id,
lead(emp_id,3) over(order by emp_id) as lead_3
from emp;

(ii) lag() :- /* opposite of the lead() */

select emp_id,
lag(emp_id) over(order by emp_id) as lag
from emp;

(iii) first_value() :- /* print first value*/

select emp_id,
first_value(emp_id) over(order by emp_id) as first_value
from emp;

(iv) last_value() :- /* print last value as it is the given column of emp_id*/

select emp_id,
last_value(emp_id) over(order by emp_id) as last_value
from emp;
