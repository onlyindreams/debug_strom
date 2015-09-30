--#
--#       Gpu Nest Loop Explain TestCases
--#
--#  [TODO] Gpu Nest Loop with Cross Join has not yet supported.
--#  [TODO] In depth larger than 1, Gpu Nest Loop has never been selected.
--#

set pg_strom.gpu_setup_cost=0;
set enable_nestloop to off;


--###
--### disabled pg_strom
--###
set pg_strom.enabled=off;
-- ## SMALLINT ##
-- Inner join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x < s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x >= s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x <= s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x between s2.smlint_x and s2.smlint_x+100) as t where t.rowid%10000=0;

--Left outer join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x < s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x >= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x <= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x between s2.smlint_x and s2.smlint_x+100) as t where t.rowid%1000 = 0 and t.id2 is NULL;

--Right Outer Join ( REVERSE inner and outer )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x < s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x >= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x <= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x between s2.smlint_x and s2.smlint_x+100) as t where t.rowid%1000 = 0 and t.id is NULL;

--Full Join ( NOT supported error )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 FULL join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;

-- ## FLOAT ##
-- Inner join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x < s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x >= s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x <= s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x between s2.float_x and s2.float_x+0.05) as t where t.rowid%1000=0;

--Left outer join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x < s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x >= s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x <= s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x between s2.float_x and s2.float_x+0.05) as t where t.rowid%1000 = 0 and t.id2 is NULL;

--Right Outer Join ( REVERSE inner and outer )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x < s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x >= s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x <= s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x between s2.float_x and s2.float_x+0.05) as t where t.rowid%1000 = 0 and t.id is NULL;

--Full Join ( NOT supported error )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 FULL join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;


--###
--### enabled pg_strom
--###
set pg_strom.enabled=off;
-- ## SMALLINT ##
-- Inner join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x < s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x >= s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x <= s2.smlint_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x between s2.smlint_x and s2.smlint_x+100) as t where t.rowid%10000=0;

--Left outer join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x < s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x >= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x <= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x between s2.smlint_x and s2.smlint_x+100) as t where t.rowid%1000 = 0 and t.id2 is NULL;

--Right Outer Join ( REVERSE inner and outer )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x < s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x >= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x <= s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x between s2.smlint_x and s2.smlint_x+100) as t where t.rowid%1000 = 0 and t.id is NULL;

--Full Join ( NOT supported error )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.smlint_x,s2.id as id2,s2.smlint_x from strom_test s1 FULL join strom_test s2 on s1.key=1 and s2.key=2 and s1.smlint_x > s2.smlint_x) as t where t.rowid%1000 = 0 and t.id is NULL;

-- ## FLOAT ##
-- Inner join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x < s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x >= s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x <= s2.float_x) as t where t.rowid%10000=0;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 inner join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x between s2.float_x and s2.float_x+0.05) as t where t.rowid%1000=0;

--Left outer join
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x < s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x >= s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x <= s2.float_x) as t where t.rowid%1000 = 0 and t.id2 is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 left outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x between s2.float_x and s2.float_x+0.05) as t where t.rowid%1000 = 0 and t.id2 is NULL;

--Right Outer Join ( REVERSE inner and outer )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x < s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x >= s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x <= s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 right outer join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x between s2.float_x and s2.float_x+0.05) as t where t.rowid%1000 = 0 and t.id is NULL;

--Full Join ( NOT supported error )
explain (verbose, costs off, timing off) select * from (select row_number() over(order by s1.id,s2.id) as rowid,s1.id,s1.float_x,s2.id as id2,s2.float_x from strom_test s1 FULL join strom_test s2 on s1.key=1 and s2.key=2 and s1.float_x > s2.float_x) as t where t.rowid%1000 = 0 and t.id is NULL;
