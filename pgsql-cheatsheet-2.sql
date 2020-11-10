--reset before
SELECT pg_stat_statements_reset();

--query yg paling sering dijalankan & total waktu
SELECT 
  (total_time / 1000 / 60) as total, 
  (total_time/calls) as avg, 
  query 
FROM pg_stat_statements 
ORDER BY 1 DESC 
LIMIT 100;

--Slow query
select round(( 100 * total_time / sum(total_time) over ())::numeric, 2) percent,
             round(total_time::numeric, 2) as total,
             calls,
             round(mean_time::numeric, 2) as mean,
             stddev_time,
             substring(query, 1, 40) as query
from pg_stat_statements
order by total_time DESC
limit 10;

