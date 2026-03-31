-- LeetCode #181 — Employees Earning More Than Managers
-- Date: Mar 13, 2026
-- Final Result: Beats 99.83% 🏆
-- Approaches: Corelated Subquery (slow) vs Self JOIN (fast)

-- ❌ Corelated Subquery Approach (slower)
select name as Employee from Employee e where salary > (select salary from Employee e1 where e.managerId =e1.id);

-- ✅ Self JOIN Approach (Beats 99.83%)
select e.name as Employee from Employee e join Employee m where e.ManagerId = m.id and e.salary > m.salary

-- 💡 Why Self JOIN won:
-- Single table scan joining with itself
-- Optimizer handles joins better than subqueries
-- Subquery runs once per outer row = slow at scale