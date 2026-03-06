-- LeetCode #175 — Combine Two Tables
-- Date: Mar 05, 2026
-- Final Result: Beats 98.64% 🏆
-- Journey: LEFT JOIN (41.07%) → RIGHT JOIN (98.64%)

-- ❌ Attempt 1 — LEFT JOIN (Beats 41.07%)
select p.firstName,p.lastName,a.city,a.state from Person p left join Address a on p.personId = a.personId;


-- ✅ Final Solution — RIGHT JOIN (Beats 98.64%)
select p.firstName,p.lastName,a.city,a.state from Address a right join Person p  on p.personId = a.personId;


-- 💡 Why RIGHT JOIN beat LEFT JOIN here:
-- RIGHT JOIN kept Persons as the driving table
-- More efficient for this specific table structure
-- Avoided unnecessary NULL filtering overhead