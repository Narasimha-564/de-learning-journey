-- LeetCode #182 — Duplicate Emails
-- Date: Mar 13, 2026
-- Final Result: Beats 97.50% 🏆
-- All 2 Approaches Compared

-- ❌ DENSE_RANK Approach (Beats 76.50%)
select email as Email from (select *, dense_rank() over(partition by email order by id) as drk from Person) x where x.drk = 2;


-- ✅ GROUP BY + HAVING (Beats 97.50%) 🏆
select email as Email from Person group by email having count(*)>1;

-- 💡 Key Lesson:
-- Not every problem needs window functions
-- Simple GROUP BY + HAVING beats DENSE_RANK
-- for duplicate detection by 21%!