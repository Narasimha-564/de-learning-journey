# Day 3 — Feb 26, 2026

## ✅ Completed
### Videos Watched
- Video: techTFQ — NTH_VALUE, NTILE, CUME_DIST, PERCENT_RANK

## 💡 Key Learnings

### NTH_VALUE
- Returns value of nth row in the window frame
- Syntax: NTH_VALUE(col, n) OVER (PARTITION BY col ORDER BY col
  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
- ⚠️ Always add frame clause — same trap as LAST_VALUE

### NTILE
- Divides rows into n equal buckets and assigns bucket number
- Syntax: NTILE(4) OVER (PARTITION BY col ORDER BY col)
- Use case: Top 25% customers → where ntile_val = 1
- If rows dont divide equally → extra rows go to first buckets

### CUME_DIST
- Cumulative distribution → what % of rows are <= current row
- Always between 0 and 1 (never 0, always ends at 1)
- Formula: rows with value <= current / total rows in partition

### PERCENT_RANK
- Relative rank as percentage
- Always between 0 and 1
- First row is ALWAYS 0
- Formula: (rank - 1) / (total rows - 1)

## 🔑 CUME_DIST vs PERCENT_RANK
| Function     | First Row | Last Row | Includes Current? |
|--------------|-----------|----------|-------------------|
| CUME_DIST    | > 0       | = 1      | Yes               |
| PERCENT_RANK | = 0       | = 1      | No                |

## ❌ Struggled With
- Got confused about cume_dist and percent_rank rewatched the video again and got clear understanding

## 🎯 Tomorrow
- LeetCode practice using all window function concepts
- #177, #178, #180