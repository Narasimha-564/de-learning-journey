-- LeetCode #183 — Customers Who Never Order
-- Date: Mar 13, 2026
-- Result: Beats 95.36% 🏆
-- Approach: LEFT JOIN + IS NULL

-- NOT IN(Beats 24.13%)
select name as Customers from Customers where id not in(select customerId from Orders);

-- ✅ Final Solution (Beats 95.36%)
select c.name as Customers from Customers c left join Orders o on o. customerId=c.id where o.id is null

-- 💡 Why LEFT JOIN + IS NULL over NOT IN:
-- NOT IN breaks silently when NULLs exist
-- LEFT JOIN + IS NULL is NULL safe always
-- More reliable in production pipelines
