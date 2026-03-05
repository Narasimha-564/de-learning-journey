-- LeetCode #184 — Department Highest Salary
-- Result: Beats 91.99% 🏆
-- Date: Feb 25, 2026

select Department,Employee,Salary from 
(select d.name as Department,e.name as Employee,e.salary as Salary,
dense_rank() over(partition by d.id order by e.salary desc) as dnk 
from Employee e join Department d on e.departmentId = d.id) x 
where x.dnk = 1;