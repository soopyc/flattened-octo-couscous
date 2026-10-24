\set ECHO all

create or replace procedure process_app(
	applicant_id decimal,
	position_id decimal,
	application_date date
) language plpgsql as $$
	<<body>>
	declare
		needs_skills_cur cursor (pos_id decimal) for
			select sname, slevel from sneeded where pnumber = pos_id;
		accepted boolean := false;
	begin
		perform from applies where anumber = applicant_id and pnumber = position_id;
		if FOUND then
			-- could use exception but that kills the transaction.
			-- could also handle the exception in a transaction.
			raise warning 'applicant % already has an application for position %', applicant_id, position_id;
			exit body;
		end if;

		for skill in needs_skills_cur(position_id) loop
			perform from spossessed
				where
					anumber = applicant_id and
					sname = skill.sname and
					slevel >= skill.slevel;
			if FOUND then
				accepted := true;
				exit;
			end if;
		end loop;

		if accepted = false then
			raise warning 'applicant id % has no skills matching position id %', applicant_id, position_id;
		else
			insert into applies (anumber, pnumber, appdate) values (applicant_id, position_id, application_date);
			raise notice 'accepted applicant id % for position id %.', applicant_id, position_id;
		end if;
	end
$$;

begin;
	call process_app(1, 1, '2026-01-01');
	call process_app(1, 2, '2026-01-01');
	call process_app(1, 3, '2026-01-01');
	call process_app(4, 5, '2026-01-01');
	call process_app(4, 7, '2026-01-01');
	call process_app(4, 9, '2026-01-01');
rollback; -- for testing purposes
