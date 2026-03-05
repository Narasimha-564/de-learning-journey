# Day 1 — Feb 24, 2026

## ✅ Completed
### Videos Watched (Channel: techTFQ)
- Video 1: SQL Window Functions — RANK, DENSE_RANK, ROW_NUMBER, LEAD, LAG
- Video 2: SQL Window Functions — Frame Clause, FIRST_VALUE, LAST_VALUE

### Practice
- Practiced all above concepts hands-on in DB Fiddle

## 💡 Key Learnings
- RANK()        → 1,1,3 skips numbers after tie
- DENSE_RANK()  → 1,1,2 never skips
- ROW_NUMBER()  → 1,2,3 always unique regardless of tie
- LAG(col,1)    → fetch previous row value
- LEAD(col,1)   → fetch next row value
- FIRST_VALUE(col) → first value in window partition
- LAST_VALUE(col)  → needs frame clause to work correctly!
- Frame Clause  → controls which rows are in the window

## ⚠️ Important Gotcha Found
- LAST_VALUE without frame clause gives wrong result
- Always add: ROWS BETWEEN UNBOUNDED PRECEDING 
  AND UNBOUNDED FOLLOWING

## 🛠️ Tools Used
- DB Fiddle → practiced all examples hands-on

## ❌ Struggled With
- Need to check again on Frame clause to understand it better

## 🎯 Tomorrow
- NTILE, CUME_DIST, PERCENT_RANK videos
- LeetCode #184, #185