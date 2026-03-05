-- LeetCode #177 — Nth Highest Salary
-- Date: Feb 27, 2026
-- Final Result: Beats 90.99% 🏆
-- Journey: Started 5% → Optimized → 90.99%

-- ❌ First Attempt (Beats ~5%)
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      with dte as (SELECT salary,DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DNK FROM Employee)
      select salary as getNthHighestSalary from dte where DNK=N limit 1
  );
END

-- ❌ Second Attempt (Beats ~27%) 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N-1;
  RETURN (
      # Write your MySQL query statement below.
      select distinct(salary) as getNthHighestSalary from Employee order by salary desc limit 1 offset N
  );
END

-- ✅ Final Solution (Beats 90.99%)
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary from
      (select distinct(salary),
           DENSE_RANK() OVER (ORDER BY salary DESC) AS dnk
    FROM Employee) x
    where dnk = N
  );
END