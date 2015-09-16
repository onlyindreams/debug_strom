--#
--#       Gpu Scan TestCases with Date/Time types.
--#   [TODO] Time/Interval type has not implemented yet.
--#          If their types will be able to sort by Gpu,
--#          then we need refactor this test cases.
--#

set enable_seqscan to off;
set enable_bitmapscan to off;
set enable_indexscan to off;
set random_page_cost=1000000;   --# force off index_scan.
set pg_strom.enable_gpuhashjoin to off;
set pg_strom.enable_gpupreagg to off;
set pg_strom.enable_gpusort to off;
set client_min_messages to warning;


--# Following date/time function cannot yet use on GPU device filter.
--# age,date_part,date_trunc,extract,isfinite,justify_days,make_date,make_interval,make_time,make_timestamp,make_timestamptz
--# But now() function can use on GPU device.
select * from strom_time_test where timestamp_x < timestamp 'epoch' and timestamp_x < now() order by timestamp_x asc limit 100;
select * from strom_time_test where timestamp_x < timestamp 'epoch' and timestamptz_x < now() order by timestamptz_x asc limit 100;

--# Operator test; (+,-,*,/) and overlaps. 
select  timestamp_x    from strom_time_test where timestamp_x::date + 1 = timestamp_x::date + 1 order by id limit 100;  
-- select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval = timestamp_x::date + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' = timestamp_x::date + time '01:00' order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x + interval_x = interval_x + interval_x order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' = timestamp_x + interval '1 year'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + '1 year'::interval = time_x + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where - interval_x = - interval_x order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x = timestamp_x - timestamp_x  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - 1 = timestamp_x::date - 1  order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval = timestamp_x::date - '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where time_x - time_x = time_x - time_x  order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + interval '1 hour' = time_x + interval '1 hour'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval = timestamp_x - '23 hours'::interval  order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval = interval_x - '23 hours'::interval  order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x * 12.35  = interval_x * 12.35  order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x / 12.35  = interval_x / 12.35  order by id limit 100;
--# overlaps
select  timestamp_x    from strom_time_test where (timestamp_x,now()) overlaps (timestamp_x,now()) order by id limit 100;
select  timestamp_x    from strom_time_test where (timestamp_x,now()) overlaps (timestamp with time zone 'epoch'::timestamp,now()) order by id limit 100;

--# Operator test; (<, <=, >, >=)
--# < 
select  timestamp_x    from strom_time_test where timestamp_x::date + 1 < timestamp with time zone 'epoch'::date + 1 order by id limit 100;  
-- select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval < timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' < timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x + interval_x < interval_x + interval_x + interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' < timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + '1 year'::interval < timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where - interval_x < - interval_x + interval '1 seconds' order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x < timestamp_x - timestamp 'epoch'  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - 1 < timestamp with time zone 'epoch'::date - 1  order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval < timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100; 
select  timestamp_x    from strom_time_test where time_x - time_x < time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + interval '1 hour' < timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval < timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval < interval_x - '23 hours'::interval + interval '1 seconds'  order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x * 12.35  < interval_x * 12.35 + interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x / 12.35  < interval_x / 12.35 + interval '1 seconds' order by id limit 100;

--# <= 
select  timestamp_x    from strom_time_test where timestamp_x::date + 1 <= timestamp with time zone 'epoch'::date + 1 order by id limit 100;  
-- select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval <= timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' <= timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x + interval_x <= interval_x + interval_x + interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' <= timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + '1 year'::interval <= timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where - interval_x <= - interval_x + interval '1 seconds' order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x <= timestamp_x - timestamp 'epoch'  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - 1 <= timestamp with time zone 'epoch'::date - 1  order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval <= timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where time_x - time_x <= time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + interval '1 hour' <= timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval <= timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval <= interval_x - '23 hours'::interval + interval '1 seconds'  order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x * 12.35  <= interval_x * 12.35 + interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x / 12.35  <= interval_x / 12.35 + interval '1 seconds' order by id limit 100;

--# >  
select  timestamp_x    from strom_time_test where timestamp_x::date + 1 >  timestamp with time zone 'epoch'::date + 1 order by id limit 100;  
-- select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval >  timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' >  timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x + interval_x >  interval_x + interval_x - interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' >  timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + '1 year'::interval >  timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where - interval_x >  - interval_x - interval '1 seconds' order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x >  timestamp_x - timestamp 'epoch'  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - 1 >  timestamp with time zone 'epoch'::date - 1  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval >  timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where time_x - time_x >  time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + interval '1 hour' >  timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval >  timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval >  interval_x - '23 hours'::interval - interval '1 seconds'  order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x * 12.35  >  interval_x * 12.35 - interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x / 12.35  >  interval_x / 12.35 - interval '1 seconds' order by id limit 100;

--# >=  
select  timestamp_x    from strom_time_test where timestamp_x::date + 1 >=  timestamp with time zone 'epoch'::date + 1 order by id limit 100;  
-- select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval >=  timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' >=  timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x + interval_x >=  interval_x + interval_x - interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' >=  timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + '1 year'::interval >=  timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where - interval_x >=  - interval_x - interval '1 seconds' order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x >=  timestamp_x - timestamp 'epoch'  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - 1 >=  timestamp with time zone 'epoch'::date - 1  order by id limit 100;
select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval >=  timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
select  timestamp_x    from strom_time_test where time_x - time_x >=  time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- select  timestamp_x    from strom_time_test where time_x + interval '1 hour' >=  timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval >=  timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval >=  interval_x - '23 hours'::interval - interval '1 seconds'  order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x * 12.35  >=  interval_x * 12.35 - interval '1 seconds' order by id limit 100;
-- select  timestamp_x    from strom_time_test where interval_x / 12.35  >=  interval_x / 12.35 - interval '1 seconds' order by id limit 100;

--# implicit cast test
--# List of supported cast by PostgreSQL can display following query
--# -----------------------------------------------------------------------------------
--# SELECT castsource::regtype,casttarget::regtype,castfunc::regproc,castmethod from pg_cast 
--# WHERE castsource in 
--# ('timestamp'::regtype,'timestamptz'::regtype,'date'::regtype,'time'::regtype,'timetz'::regtype,'interval'::regtype) 
--# AND casttarget not in ('abstime'::regtype,'reltime'::regtype);
--# -----------------------------------------------------------------------------------
select  *    from strom_time_test where date_x=timestamp_x order by id limit 100;
select  *    from strom_time_test where date_x=timestamptz_x order by id limit 100;
-- select  *    from strom_time_test where time_x=interval_x order by id limit 100;
select  *    from strom_time_test where time_x=timetz_x order by id limit 100;
select  *    from strom_time_test where timestamp_x=timestamptz_x order by id limit 100;

select  *    from strom_time_test where date_x!=timestamp_x order by id limit 100;
select  *    from strom_time_test where date_x!=timestamptz_x order by id limit 100;
-- select  *    from strom_time_test where time_x!=interval_x order by id limit 100;
select  *    from strom_time_test where time_x!=timetz_x order by id limit 100;
select  *    from strom_time_test where timestamp_x!=timestamptz_x order by id limit 100;

--# AT TIME ZONE
--# Not yet implemented on pg_strom
-- select  timestamp_x  from strom_time_test where timestamp_x AT TIME ZONE 'JST' = timestamp_x AT TIME ZONE 'JST' order by id limit 100;
-- select  timestamp_x  from strom_time_test where timestamptz_x AT TIME ZONE 'JST' = timestamptz_x AT TIME ZONE 'JST' order by id limit 100;
-- select  timestamp_x  from strom_time_test where timetz_x AT TIME ZONE 'JST' = timetz_x AT TIME ZONE 'JST' order by id limit 100;

--# SUMMER TIME TEST
set timezone='America/New_York';
SELECT * FROM strom_time_test WHERE key=1000 and '2015-03-08 3:00:00'::timestamp with time zone - interval '1 seconds' = timestamptz_x limit 10;

set timezone to default;
SELECT * FROM strom_time_test WHERE key=1000 and '2015-03-08 3:00:00'::timestamp with time zone - interval '1 seconds' = timestamptz_x limit 10;
