
1. single row subquery :-  /* only one row as output : =,<,>...*/

select emp_id,emp_name,salary
from emp
where salary = (select max(salary) from emp);

2. multiple row subquery :- /* more than one row as output : IN,ANY,ALL */

select e.emp_id,e.emp_name,d.dname
from emp e,dept d
where e.did in(select d.did from dept where d.dname='IT');

3. multiple column subquery :- /* more than one column as output */

select emp_id,emp_name,did
from emp
where did in(select did from dept);   /*All 10 employees are included, because all did values (1 to 5) are present in the DEPT table. */

4. correlated subquery :- /* Depends on the outer query for its value. */

select emp_id,emp_name,salary
from emp 
where salary > (select avg(salary) from emp);

5. Nested subquery :- /* subquery inside another subquery.*/

select emp_id,emp_name,salary
from emp
where did = (select did from dept where dname='IT') and salary > (select avg(salary) from emp where did = (select did from dept where dname='IT'));

/* here use AND for satisfied the condition that employee from IT dept and with grater salary than average.*/


6. subquery in from clause(inline view):-  /* subquery that is used in the from clause*/

select did,max_salary_tbl.max_salary
from(select did,max(salary) as max_salary from emp group by did) max_salary_tbl order by did;

7. subquery in select clause :- /* write select query insted of column name*/

select emp_id,emp_name,salary,(select max(salary) from emp) as max_salary from emp;
/* subquery must return only one value*/

8. subquery in where clause :- /* subquery used in the WHERE condition to filter rows.*/

select emp_id,emp_name
from emp
where did = (select did from dept where dname='IT');

9. subquery in having clause :- /* filter group data */

select did,max(salary) as max_sal
from emp
group by did
having max(salary) = (select max(salary) from emp);

10. subquery with exists/not exists :- /* Checks whether rows exist in the result of a subquery.*/

(i) exists :

select emp_id,emp_name
from emp e
where exists (select * from dept d where e.did=d.did and dname='IT');
/* if we write dname that is not exists in dept table then it retuns false*/

(ii) not exists :

select d.did,d.dname
from dept d
where not exists(select * from emp e where e.gender='male' and e.did=d.did);
/* here in did 2 not exists male employee */







