-- LeetCode #180 — Consecutive Numbers
-- Date: Mar 03, 2026
-- Result: Beats 96.73% 🏆

select distinct num as ConsecutiveNums from (
    select num, case when num = lead(num,1) over(order by id) and lag(num,1) over(order by id) = num then 'cns' end as cs from Logs) x
where x.cs='cns';

