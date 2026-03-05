-- LeetCode #185 — Department Top 3 Salaries
-- Result: Beats 86.66% 🏆
-- Date: Feb 25, 2026

with x as (
    select d.name as Department,e.name as Employee,e.salary as Salary,
    dense_rank() over(partition by d.id order by e.salary desc) as dnk from Employee E join Department d on e.departmentId = d.id
) 
select Department,Employee,Salary from x where dnk<4;


-- Result: Beats 80.60% 🏆

with x as (
    select d.name as Department,e.name as Employee,e.salary as Salary,
    dense_rank() over(partition by d.id order by e.salary desc) as dnk from Employee E join Department d on e.departmentId = d.id
) 
select Department,Employee,Salary from x where dnk<=3;

-- Result: Beats 65.20% 🏆

select Department,Employee,Salary from(
    select d.name as Department,e.name as Employee,e.salary as Salary,
    dense_rank() over(partition by d.id order by e.salary desc) as dnk from Employee E join Department d on e.departmentId = d.id
) x where x.dnk<4;
