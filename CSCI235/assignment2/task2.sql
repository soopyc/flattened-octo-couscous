\set ECHO all

begin;
do language plpgsql $$
	declare
		applicants_cur cursor for select anumber, fname, lname from applicant;
		skills_cur cursor (aid decimal) for select sname, slevel from spossessed where anumber = aid;
	begin
		<<main_l>>
		for applicant in applicants_cur loop
			raise notice '% %', applicant.fname, applicant.lname;
			<<applic_l>>
			for skill in skills_cur(aid := applicant.anumber) loop
				raise notice '% %', skill.sname, skill.slevel;
			end loop applic_l;

			raise notice '--------------------------';
		end loop main_l;
	end
$$;

commit;
