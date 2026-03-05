select emp_name,dept_name,salary from employees e  where salary = (select max(salary) from employees ei WHERE ei.dept_name = e.dept_name);

select e.*,max(salary) over(partition by dept_name) as max_salary from employees e;

--first 2 employees from each department

select emp_id,emp_name,dept_name from(select e.*, row_number() over(partition by dept_name order by emp_id) as rn from employees e) x where rn < 3;

-- top 3 employess with max salary in each department

select emp_name,dept_name,salary from (select e.*, dense_rank() over(partition by dept_name order by salary desc) as dnk from employees e) x where dnk <4;

-- lead, lag

select e.*, lag(salary) over(partition by dept_name order by emp_id) as prev_salary,lead(salary) over(partition by dept_name order by emp_id) as next_salary, 
case when salary > lag(salary) over(partition by dept_name order by emp_id) then 'higher than previous' 
when salary < lag(salary) over(partition by dept_name order by emp_id) then 'less than previous'
when salary = lag(salary) over(partition by dept_name order by emp_id) then 'same previous' 
when lag(salary) over(partition by dept_name order by emp_id) is null then 'no previous record' end salary_range_lag,
case when salary > lead(salary) over(partition by dept_name order by emp_id) then 'higher than next'
when salary < lead(salary) over(partition by dept_name order by emp_id) then 'less than next'
when salary = lead(salary) over(partition by dept_name order by emp_id) then 'same previous' 
when lead(salary) over(partition by dept_name order by emp_id) is null then 'no next record'
end salary_range_lead from employees e;


-- find the highest paid employee in each dept

select e.*, first_value(emp_name) over(partition by dept_name order by salary desc) as max_sal_emp from employees e;

--find the least paid employee in each dept

select e.*,
first_value(emp_name) over(partition by dept_name order by salary desc) as max_sal_emp,
last_value(emp_name) over(partition by dept_name order by salary desc range between unbounded preceding and current row) as min_sal_emp 
from employees e;

-- the above query will have only access to the frame in a window that is all the above rows and current row so it can't correctly calculate last_value correctly

select e.*,
first_value(emp_name) over(partition by dept_name order by salary desc) as max_sal_emp,
last_value(emp_name) over(partition by dept_name order by salary desc range between unbounded preceding and unbounded following) as min_sal_emp 
from employees e;

-- the above query solves the frame accessing issue and now at each record level it can access the whole window