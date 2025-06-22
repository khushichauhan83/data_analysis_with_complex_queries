
/* below some queries example using CTE*/
/* consider create_table.sql for tables */ 

1. Use a CTE to find the average salary of all employees, and then print the employees who earn more than this average.

with cte_1 as(
select avg(salary) as avg_sal from emp
)
select * from emp e,cte_1 c where e.salary > c.avg_sal;

2. Create a CTE to calculate total salary department-wise, and print only those departments whose total salary is greater than 40,000.

with cte_2 as(
select did,sum(salary) as sum_salary from emp group by did
)
select d.did,d.dname,c.sum_salary
from dept d,cte_2 c
where  c.sum_salary>40000 and d.did=c.did;

3. Use a CTE to join the emp and dept tables, and then print emp_name, dname, and salary.

with cte_3 as(
select e.emp_name,e.salary,d.dname
from emp e,dept d
where e.did=d.did
)
select * from cte_3;

4. Use a CTE to calculate the number of employees in each department. Then print departments with more than 2 employees.

with cte_4 as(
select did,count(emp_id) as count_emp
from emp
group by did
)
select * from cte_4 where count_emp>2 order by did;

5. Use a CTE to find employees whose salary is equal to the maximum salary in the emp table.

with cte_5 as(
select max(salary) as max_sal
from emp
)
select e.emp_id,e.emp_name,e.salary,c.max_sal
from emp e, cte_5 c
where e.salary=c.max_sal;

