# Day 4 — Feb 27, 2026

## ✅ Completed
### LeetCode Solved
- #177 — Nth Highest Salary ✅ Final: Beats 90.99% 🏆

## 🔥 Journey on #177 (Most Important Part)
- Attempt 1 → Beats 5%   — brute force approach, nested query
- Optimized  → kept improving logic step by step
- Final      → Beats 90.99% 🏆 — clean optimized solution

## 💡 What Made the Difference
- what changed between 5% and 90.99% — 
  is avoiding OFFSET and only using DENSE_RANK
  using distinct and DENSE_RANK optimized the solution

## 🧠 Key Learnings from #177
- Nth Highest Salary is a classic DENSE_RANK problem
- DENSE_RANK handles duplicates correctly vs LIMIT OFFSET
- Always think: "what happens with duplicate salaries?"

## 🔑 Approach That Worked
- Used distinct(salary)
- Used DENSE_RANK() OVER (ORDER BY salary DESC)
- Filtered WHERE dense_rank_val = N
- Handles NULLs and duplicates correctly

## ❌ What Didnt Work (5% approach)
- with dense_rank and limit only it is 5%
- with limit and offset it is 27%
- with distinct,dense_rank and limit it is 90%

## 🎯 Tomorrow
- LeetCode #178 — Rank Scores
- LeetCode #180 — Consecutive Numbers