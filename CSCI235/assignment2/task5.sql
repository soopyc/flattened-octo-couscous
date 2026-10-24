-- \set ECHO all

-- couldn't we just use a count() statement..?
-- wouldn't make much sense irl imo

begin;

create table if not exists app_count (
	pnumber decimal(8) not null primary key,
	count integer not null,

	constraint app_count_fk1 foreign key (pnumber)
		references position (pnumber) on delete cascade
);

do language plpgsql $$
	declare
		i record;
	begin
		for i in
			select pnumber, count(*) as count from applies group by pnumber
		loop
			-- update app_count set count
			insert into app_count (pnumber, count) values (i.pnumber, i.count);
		end loop;
	end
$$;

end;

-- rollback;
-- end;
