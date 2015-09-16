--#
--#       Gpu Scan Explain TestCases. 
--#

set enable_seqscan to off;
set enable_bitmapscan to off;
set enable_indexscan to off;
set random_page_cost=1000000;   --# force off index_scan.
set pg_strom.enable_gpuhashjoin to off;
set pg_strom.enable_gpupreagg to off;
set pg_strom.enable_gpusort to off;
set client_min_messages to warning;

--# #####  pg_strom = off #####
set pg_strom.enabled=off;
-- normal
explain (verbose, costs off, timing off) select  smlint_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  integer_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  bigint_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  real_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  float_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  nume_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  smlsrl_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  serial_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  bigsrl_x    from strom_test order by id limit 100;

-- where
explain (verbose, costs off, timing off) select  smlint_x    from strom_test where abs(smlint_x) between 1 and 1000 order by id limit 100;
explain (verbose, costs off, timing off) select  integer_x    from strom_test where abs(integer_x) between 100000 and 1000000 order by id limit 100;
explain (verbose, costs off, timing off) select  bigint_x    from strom_test where abs(bigint_x) between 1000000000000 and 10000000000000 order by id limit 100;
explain (verbose, costs off, timing off) select  real_x    from strom_test where abs(real_x) between 0.001 and 0.01 order by id limit 100;
explain (verbose, costs off, timing off) select  float_x    from strom_test where abs(float_x) between 0.001 and 0.01 order by id limit 100;
explain (verbose, costs off, timing off) select  nume_x    from strom_test where abs(nume_x) between 0.001 and 0.01 order by id limit 100;
explain (verbose, costs off, timing off) select  smlsrl_x    from strom_test where abs(smlsrl_x) between 1 and 1000 order by id limit 100;
explain (verbose, costs off, timing off) select  serial_x    from strom_test where abs(serial_x) between 100000 and 1000000 order by id limit 100;
explain (verbose, costs off, timing off) select  bigsrl_x    from strom_test where abs(bigsrl_x) between 1000000000000 and 10000000000000 order by id limit 100;

-- NULL
explain (verbose, costs off, timing off) select  id,smlint_x    from strom_test where abs(smlint_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,integer_x    from strom_test where abs(integer_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigint_x    from strom_test where abs(bigint_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,real_x    from strom_test where abs(real_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,float_x    from strom_test where abs(float_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,nume_x    from strom_test where abs(nume_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,smlsrl_x    from strom_test where abs(smlsrl_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,serial_x    from strom_test where abs(serial_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigsrl_x    from strom_test where abs(bigsrl_x) IS NULL order by id limit 100;


-- NOT NULL
explain (verbose, costs off, timing off) select  id,smlint_x    from strom_test where abs(smlint_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,integer_x    from strom_test where abs(integer_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigint_x    from strom_test where abs(bigint_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,real_x    from strom_test where abs(real_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,float_x    from strom_test where abs(float_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,nume_x    from strom_test where abs(nume_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,smlsrl_x    from strom_test where abs(smlsrl_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,serial_x    from strom_test where abs(serial_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigsrl_x    from strom_test where abs(bigsrl_x) IS NOT NULL order by id limit 100;

--# #####  pg_strom = on #####
set pg_strom.enabled=on;
set pg_strom.enable_gpusort to off;
-- normal
explain (verbose, costs off, timing off) select  smlint_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  integer_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  bigint_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  real_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  float_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  nume_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  smlsrl_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  serial_x    from strom_test order by id limit 100;
explain (verbose, costs off, timing off) select  bigsrl_x    from strom_test order by id limit 100;

-- where
explain (verbose, costs off, timing off) select  smlint_x    from strom_test where abs(smlint_x) between 1 and 1000 order by id limit 100;
explain (verbose, costs off, timing off) select  integer_x    from strom_test where abs(integer_x) between 100000 and 1000000 order by id limit 100;
explain (verbose, costs off, timing off) select  bigint_x    from strom_test where abs(bigint_x) between 1000000000000 and 10000000000000 order by id limit 100;
explain (verbose, costs off, timing off) select  real_x    from strom_test where abs(real_x) between 0.001 and 0.01 order by id limit 100;
explain (verbose, costs off, timing off) select  float_x    from strom_test where abs(float_x) between 0.001 and 0.01 order by id limit 100;
explain (verbose, costs off, timing off) select  nume_x    from strom_test where abs(nume_x) between 0.001 and 0.01 order by id limit 100;
explain (verbose, costs off, timing off) select  smlsrl_x    from strom_test where abs(smlsrl_x) between 1 and 1000 order by id limit 100;
explain (verbose, costs off, timing off) select  serial_x    from strom_test where abs(serial_x) between 100000 and 1000000 order by id limit 100;
explain (verbose, costs off, timing off) select  bigsrl_x    from strom_test where abs(bigsrl_x) between 1000000000000 and 10000000000000 order by id limit 100;

-- NULL
explain (verbose, costs off, timing off) select  id,smlint_x    from strom_test where abs(smlint_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,integer_x    from strom_test where abs(integer_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigint_x    from strom_test where abs(bigint_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,real_x    from strom_test where abs(real_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,float_x    from strom_test where abs(float_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,nume_x    from strom_test where abs(nume_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,smlsrl_x    from strom_test where abs(smlsrl_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,serial_x    from strom_test where abs(serial_x) IS NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigsrl_x    from strom_test where abs(bigsrl_x) IS NULL order by id limit 100;


-- NOT NULL
explain (verbose, costs off, timing off) select  id,smlint_x    from strom_test where abs(smlint_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,integer_x    from strom_test where abs(integer_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigint_x    from strom_test where abs(bigint_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,real_x    from strom_test where abs(real_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,float_x    from strom_test where abs(float_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,nume_x    from strom_test where abs(nume_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,smlsrl_x    from strom_test where abs(smlsrl_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,serial_x    from strom_test where abs(serial_x) IS NOT NULL order by id limit 100;
explain (verbose, costs off, timing off) select  id,bigsrl_x    from strom_test where abs(bigsrl_x) IS NOT NULL order by id limit 100;


-- division by zero with GpuScan
--# #####  pg_strom = on #####
set pg_strom.enabled=on;
explain (verbose on, costs off) select * from strom_test where smlint_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where integer_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where bigint_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where real_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where float_x/(id%1000) = 1;

--# #####  pg_strom = off #####
set pg_strom.enabled=off;
explain (verbose on, costs off) select * from strom_test where smlint_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where integer_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where bigint_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where real_x/(id%1000) = 1;
explain (verbose on, costs off) select * from strom_test where float_x/(id%1000) = 1;


--#
--#  *********************** DATE/TIME types test cases on PG-Strom ***********************
--#  NOTICE : filter of timetz and interval data types is not yet impletemnted on pg_strom.
--#           if their function added, then we need to rework this test cases.
--#  **************************************************************************************
--#
--# #####  pg_strom = on #####
set pg_strom.enabled=on;

--# Following date/time function cannot yet use on GPU device filter.
--# age,date_part,date_trunc,extract,isfinite,justify_days,make_date,make_interval,make_time,make_timestamp,make_timestamptz
--# But now() function can use on GPU device.
explain (verbose, costs off, timing off) select * from strom_time_test where timestamp_x < timestamp 'epoch' and timestamp_x < now() order by timestamp_x asc limit 100;
explain (verbose, costs off, timing off) select * from strom_time_test where timestamp_x < timestamp 'epoch' and timestamptz_x < now() order by timestamptz_x asc limit 100;

--# Operator test; (+,-,*,/) and overlaps. 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 = timestamp_x::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval = timestamp_x::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' = timestamp_x::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x = interval_x + interval_x order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' = timestamp_x + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval = time_x + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x = - interval_x order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x = timestamp_x - timestamp_x  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 = timestamp_x::date - 1  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval = timestamp_x::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x = time_x - time_x  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' = time_x + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval = timestamp_x - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval = interval_x - '23 hours'::interval  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  = interval_x * 12.35  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  = interval_x / 12.35  order by id limit 100;
--# overlaps
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where (timestamp_x,now()) overlaps (timestamp_x,now()) order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where (timestamp_x,now()) overlaps (timestamp with time zone 'epoch'::timestamp,now()) order by id limit 100;

--# Operator test; (<, <=, >, >=)
--# < 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 < timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval < timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' < timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x < interval_x + interval_x + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' < timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval < timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x < - interval_x + interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x < timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 < timestamp with time zone 'epoch'::date - 1  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval < timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100; 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x < time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' < timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval < timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval < interval_x - '23 hours'::interval + interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  < interval_x * 12.35 + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  < interval_x / 12.35 + interval '1 seconds' order by id limit 100;

--# <= 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 <= timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval <= timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' <= timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x <= interval_x + interval_x + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' <= timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval <= timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x <= - interval_x + interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x <= timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 <= timestamp with time zone 'epoch'::date - 1  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval <= timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x <= time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' <= timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval <= timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval <= interval_x - '23 hours'::interval + interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  <= interval_x * 12.35 + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  <= interval_x / 12.35 + interval '1 seconds' order by id limit 100;

--# >  
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 >  timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval >  timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' >  timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x >  interval_x + interval_x - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' >  timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval >  timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x >  - interval_x - interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x >  timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 >  timestamp with time zone 'epoch'::date - 1  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval >  timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x >  time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' >  timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval >  timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval >  interval_x - '23 hours'::interval - interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  >  interval_x * 12.35 - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  >  interval_x / 12.35 - interval '1 seconds' order by id limit 100;

--# >=  
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 >=  timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval >=  timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' >=  timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x >=  interval_x + interval_x - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' >=  timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval >=  timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x >=  - interval_x - interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x >=  timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 >=  timestamp with time zone 'epoch'::date - 1  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval >=  timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x >=  time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' >=  timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval >=  timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval >=  interval_x - '23 hours'::interval - interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  >=  interval_x * 12.35 - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  >=  interval_x / 12.35 - interval '1 seconds' order by id limit 100;

--# implicit cast test
--# List of supported cast by PostgreSQL can display following query
--# -----------------------------------------------------------------------------------
--# SELECT castsource::regtype,casttarget::regtype,castfunc::regproc,castmethod from pg_cast 
--# WHERE castsource in 
--# ('timestamp'::regtype,'timestamptz'::regtype,'date'::regtype,'time'::regtype,'timetz'::regtype,'interval'::regtype) 
--# AND casttarget not in ('abstime'::regtype,'reltime'::regtype);
--# -----------------------------------------------------------------------------------
explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x=timestamp_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x=timestamptz_x order by id limit 100;
-- explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x=interval_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x=timetz_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where timestamp_x=timestamptz_x order by id limit 100;

explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x!=timestamp_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x!=timestamptz_x order by id limit 100;
-- explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x!=interval_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x!=timetz_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where timestamp_x!=timestamptz_x order by id limit 100;

--# AT TIME ZONE
--# Not yet implemented on pg_strom
-- explain (verbose, costs off, timing off) select  timestamp_x  from strom_time_test where timestamp_x AT TIME ZONE 'JST' = timestamp_x AT TIME ZONE 'JST' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x  from strom_time_test where timestamptz_x AT TIME ZONE 'JST' = timestamptz_x AT TIME ZONE 'JST' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x  from strom_time_test where timetz_x AT TIME ZONE 'JST' = timetz_x AT TIME ZONE 'JST' order by id limit 100;

--# SUMMER TIME TEST
set timezone='America/New_York';
explain (verbose, costs off, timing off) SELECT * FROM strom_time_test WHERE key=1000 and '2015-03-08 3:00:00'::timestamp with time zone - interval '1 seconds' = timestamptz_x limit 10;

set timezone to default;
explain (verbose, costs off, timing off) SELECT * FROM strom_time_test WHERE key=1000 and '2015-03-08 3:00:00'::timestamp with time zone - interval '1 seconds' = timestamptz_x limit 10;

--# #####  pg_strom = off #####
set pg_strom.enabled=off;
--# Following date/time function cannot yet use on GPU device filter.
--# age,date_part,date_trunc,extract,isfinite,justify_days,make_date,make_interval,make_time,make_timestamp,make_timestamptz
--# But now() function can use on GPU device.
explain (verbose, costs off, timing off) select * from strom_time_test where timestamp_x < timestamp 'epoch' and timestamp_x < now() order by timestamp_x asc limit 100;
explain (verbose, costs off, timing off) select * from strom_time_test where timestamp_x < timestamp 'epoch' and timestamptz_x < now() order by timestamptz_x asc limit 100;

--# Operator test; (+,-,*,/) and overlaps. 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 = timestamp_x::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval = timestamp_x::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' = timestamp_x::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x = interval_x + interval_x order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' = timestamp_x + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval = time_x + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x = - interval_x order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x = timestamp_x - timestamp_x  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 = timestamp_x::date - 1  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval = timestamp_x::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x = time_x - time_x  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' = time_x + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval = timestamp_x - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval = interval_x - '23 hours'::interval  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  = interval_x * 12.35  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  = interval_x / 12.35  order by id limit 100;
--# overlaps
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where (timestamp_x,now()) overlaps (timestamp_x,now()) order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where (timestamp_x,now()) overlaps (timestamp with time zone 'epoch'::timestamp,now()) order by id limit 100;

--# Operator test; (<, <=, >, >=)
--# < 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 < timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval < timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' < timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x < interval_x + interval_x + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' < timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval < timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x < - interval_x + interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x < timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 < timestamp with time zone 'epoch'::date - 1  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval < timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100; 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x < time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' < timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval < timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval < interval_x - '23 hours'::interval + interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  < interval_x * 12.35 + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  < interval_x / 12.35 + interval '1 seconds' order by id limit 100;

--# <= 
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 <= timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval <= timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' <= timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x <= interval_x + interval_x + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' <= timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval <= timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x <= - interval_x + interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x <= timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 <= timestamp with time zone 'epoch'::date - 1  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval <= timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x <= time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' <= timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval <= timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval <= interval_x - '23 hours'::interval + interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  <= interval_x * 12.35 + interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  <= interval_x / 12.35 + interval '1 seconds' order by id limit 100;

--# >  
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 >  timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval >  timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' >  timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x >  interval_x + interval_x - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' >  timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval >  timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x >  - interval_x - interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x >  timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 >  timestamp with time zone 'epoch'::date - 1  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval >  timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x >  time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' >  timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval >  timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval >  interval_x - '23 hours'::interval - interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  >  interval_x * 12.35 - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  >  interval_x / 12.35 - interval '1 seconds' order by id limit 100;

--# >=  
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + 1 >=  timestamp with time zone 'epoch'::date + 1 order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + '1 year'::interval >=  timestamp with time zone 'epoch'::date + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date + time '01:00' >=  timestamp with time zone 'epoch'::date + time '01:00' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x + interval_x >=  interval_x + interval_x - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x + interval '1 year' >=  timestamp with time zone 'epoch' + interval '1 year'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + '1 year'::interval >=  timestamp with time zone 'epoch'::time + '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where - interval_x >=  - interval_x - interval '1 seconds' order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - timestamp_x >=  timestamp_x - timestamp 'epoch'  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - 1 >=  timestamp with time zone 'epoch'::date - 1  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x::date - '1 year'::interval >=  timestamp with time zone 'epoch'::date - '1 year'::interval order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x - time_x >=  time_x - timestamp with time zone 'epoch'::time  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where time_x + interval '1 hour' >=  timestamp with time zone 'epoch'::time + interval '1 hour'::interval order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where timestamp_x - '23 hours'::interval >=  timestamp with time zone 'epoch'::timestamp - '23 hours'::interval  order by id limit 100;
explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x - '23 hours'::interval >=  interval_x - '23 hours'::interval - interval '1 seconds'  order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x * 12.35  >=  interval_x * 12.35 - interval '1 seconds' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x    from strom_time_test where interval_x / 12.35  >=  interval_x / 12.35 - interval '1 seconds' order by id limit 100;

--# implicit cast test
--# List of supported cast by PostgreSQL can display following query
--# -----------------------------------------------------------------------------------
--# SELECT castsource::regtype,casttarget::regtype,castfunc::regproc,castmethod from pg_cast 
--# WHERE castsource in 
--# ('timestamp'::regtype,'timestamptz'::regtype,'date'::regtype,'time'::regtype,'timetz'::regtype,'interval'::regtype) 
--# AND casttarget not in ('abstime'::regtype,'reltime'::regtype);
--# -----------------------------------------------------------------------------------
explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x=timestamp_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x=timestamptz_x order by id limit 100;
-- explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x=interval_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x=timetz_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where timestamp_x=timestamptz_x order by id limit 100;

explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x!=timestamp_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where date_x!=timestamptz_x order by id limit 100;
-- explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x!=interval_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where time_x!=timetz_x order by id limit 100;
explain (verbose, costs off, timing off) select  *    from strom_time_test where timestamp_x!=timestamptz_x order by id limit 100;

--# AT TIME ZONE
--# Not yet implemented on pg_strom
-- explain (verbose, costs off, timing off) select  timestamp_x  from strom_time_test where timestamp_x AT TIME ZONE 'JST' = timestamp_x AT TIME ZONE 'JST' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x  from strom_time_test where timestamptz_x AT TIME ZONE 'JST' = timestamptz_x AT TIME ZONE 'JST' order by id limit 100;
-- explain (verbose, costs off, timing off) select  timestamp_x  from strom_time_test where timetz_x AT TIME ZONE 'JST' = timetz_x AT TIME ZONE 'JST' order by id limit 100;

--# SUMMER TIME TEST
set timezone='America/New_York';
explain (verbose, costs off, timing off) SELECT * FROM strom_time_test WHERE key=1000 and '2015-03-08 3:00:00'::timestamp with time zone - interval '1 seconds' = timestamptz_x limit 10;

set timezone to default;
explain (verbose, costs off, timing off) SELECT * FROM strom_time_test WHERE key=1000 and '2015-03-08 3:00:00'::timestamp with time zone - interval '1 seconds' = timestamptz_x limit 10;


