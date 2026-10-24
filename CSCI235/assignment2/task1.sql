\set ECHO all
SET enable_seqscan=OFF;

-- q1
create index city_state_employer_idx on employer(city, state);
explain select ename from employer where city = 'Wollongong' and state = 'NSW';
drop index city_state_employer_idx;

-- q2
-- technically postgres already has an index for this (applies_pkey)
create index applies_anumber_idx on applies(anumber);
explain select anumber, count(*) from applies group by anumber;
drop index applies_anumber_idx;

-- q3
create index sneeded_idx on sneeded(sname, slevel);
explain select distinct sname, slevel from sneeded;
drop index sneeded_idx;

-- q4
create index salary_position_idx on position(salary);
explain select title, salary from position order by salary;
drop index salary_position_idx;

-- q5
create index emplby_name_todate_idx on emplby(ename, todate);
explain select max(todate) from emplby where ename like 'Jam%';
drop index emplby_name_todate_idx;
