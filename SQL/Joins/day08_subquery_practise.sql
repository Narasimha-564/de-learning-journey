-- Day 8 — Subquery Types Practice
-- Date: Mar 14, 2026
-- Source: techTFQ YouTube + DB Fiddle practice

-- ═══════════════════════════════════════
-- TYPE 1: SCALAR SUBQUERY
-- Returns exactly 1 row, 1 column
-- ═══════════════════════════════════════

-- Each employee salary vs company average
SELECT 
  emp_name,
  salary,
  (SELECT AVG(salary) FROM employees) AS company_avg,
  salary - (SELECT AVG(salary) FROM employees) AS diff
FROM employees;

-- ═══════════════════════════════════════
-- TYPE 2: MULTIPLE ROW SUBQUERY
-- Returns many rows, single column
-- ═══════════════════════════════════════

-- Employees in departments located in Mumbai
SELECT emp_name, salary
FROM employees
WHERE dept_id IN (
  SELECT dept_id 
  FROM departments
  WHERE location = 'Mumbai'
);

-- Using ANY — salary greater than ANY manager salary
SELECT emp_name, salary
FROM employees
WHERE salary > ANY (
  SELECT salary FROM employees
  WHERE designation = 'Manager'
);

-- Using ALL — salary greater than ALL manager salaries
SELECT emp_name, salary
FROM employees
WHERE salary > ALL (
  SELECT salary FROM employees
  WHERE designation = 'Manager'
);

-- ═══════════════════════════════════════
-- TYPE 3: MULTIPLE COLUMN SUBQUERY
-- Returns many rows AND many columns
-- ═══════════════════════════════════════

-- Using as derived table in FROM clause
SELECT d.dept_name, emp_stats.avg_salary, emp_stats.emp_count
FROM departments d
JOIN (
  SELECT 
    dept_id,
    AVG(salary) AS avg_salary,
    COUNT(*) AS emp_count
  FROM employees
  GROUP BY dept_id
) emp_stats ON d.dept_id = emp_stats.dept_id;

-- Row constructor comparison (multiple column WHERE)
SELECT emp_name, dept_id, salary
FROM employees
WHERE (dept_id, salary) IN (
  SELECT dept_id, MAX(salary)
  FROM employees
  GROUP BY dept_id
);

-- ═══════════════════════════════════════
-- TYPE 4: CORRELATED SUBQUERY
-- References outer query — runs per row
-- ═══════════════════════════════════════

-- Employees earning above their department average
SELECT emp_name, salary, dept_id
FROM employees e1
WHERE salary > (
  SELECT AVG(salary)
  FROM employees e2
  WHERE e2.dept_id = e1.dept_id  -- references outer query
);

-- My DB Fiddle practice code 

-- Subquery

-- subqueries 3 types
-- 1) scalar subquery one row one column
-- 2) multiple row subquery: multiple rows one column
-- 3) multiple rows and multiple columns

-- 1) scalar subquery: one row one column
-- Salary greater than avg salary of emp
select * from employees where salary > (select avg(salary) from employees);
-- another way 
select * from employees e join (select avg(salary) as sal from employees) avg_sal on e.salary>avg_sal.sal;

-- 3) multiple rows multiple columns
-- highest salary in each dept
select * from employees where (dept_name,salary) in (select dept_name, max(salary) from employees group by dept_name);
-- another method
select dept_name,salary from (select *,dense_rank() over(partition by dept_name order by salary desc) as drk from employees) x where drk = 1;

-- 2) single column, multiple rows
-- which dept has no employees
select dept_name from department where dept_name not in 
(select distinct dept_name from employees where dept_name IS NOT NULL); -- NULL TRAP

-- another method using left join + is null
select d.dept_name from department d left join employees e 
on d.dept_name = e.dept_name where e.dept_name IS NULL;

-- another method not exists
select dept_name from department d where NOT EXISTS
(select 1 from employess where d.dept_name = e.dept_name)

-- Corelated subquery
-- A subquery which is related to the outer query
-- employess having salary greater than the avg of the dept
select * from employees e1 where salary > 
(select avg(salary) from employees e2 where e1.dep_name = e2.dept_name);

-- using window
select * from 
(select *, avg(salary) over(partition by dept_name) as avg_salary from employees) x
where salary > avg_salary;

--- using joins + group by
select * from employees e join 
(select dept_name,avg(salary) as a_sal from employees) as d on e.dept_name=d.dept_name 
where e.salary>d.a_sal;

-- which dept has no employees
select dept_name from department d where NOT EXISTS
(select 1 from employess where d.dept_name = e.dept_name)

-- subquery inside subquery
-- total_sales of store greater than the avg sales of all stores

-- 1) total sales of each store
-- 2) avg sales of all stores
-- compare 1 and 2

select * from (select store_name,sum(price) as total_sales from sales group by store_name) sales join 
(select avg(total_sales) as a_sales from
(select store_name,sum(price) as total_sales from sales group by store_name) x) avg_sales 
on sales.total_sales > avg_sales.a_sales;

-- subquery
SELECT store_id, SUM(sales) AS total_sales
FROM sales
GROUP BY store_id
HAVING SUM(sales) > (
    SELECT AVG(store_total)
    FROM (
        SELECT SUM(sales) AS store_total
        FROM sales
        GROUP BY store_id
    ) t
);

-- with clause
WITH store_totals AS (
    SELECT store_id, SUM(sales) AS total_sales
    FROM sales
    GROUP BY store_id
),
avg_sales AS (
    SELECT AVG(total_sales) AS avg_total
    FROM store_totals
)
SELECT s.store_id, s.total_sales
FROM store_totals s
JOIN avg_sales a
WHERE s.total_sales > a.avg_total;

-- Clauses where we can you use subquery
select
from
where
having

-- make sure to insert no duplicate records use not exists
-- we can use exists and not exists to insert update and delete data from a table




