-- LeetCode #178 — Rank Scores
-- Date: Mar 03, 2026
-- Result: Beats 95.67% 🏆

select * from (
    select score,dense_rank() over(order by score desc) as `rank` from Scores
) x;