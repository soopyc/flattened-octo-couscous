\set ECHO all

create or replace function applicant_skills (anumber decimal) returns text
language plpgsql as $$
<<body>>
declare
	n decimal := anumber;
begin
	-- for skill in skills_cur loop
	-- 	null;
	-- end loop;
	return array_to_string(array(
		select sname from spossessed t where t.anumber = n order by sname asc
	), ', ');
end
$$;

begin;
	select * from applicant_skills(1);
	select * from applicant_skills(2);
	select * from applicant_skills(3);
	select * from applicant_skills(4);
rollback;
