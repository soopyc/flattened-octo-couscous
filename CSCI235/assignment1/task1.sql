-- drop table if exists Tasks
-- drop table if exists People

create table if not exists People (
	id uuid primary key default uuidv4(),
	preferred_name varchar not null
);

create table if not exists Tasks (
	id uuid primary key default uuidv4(),
	name varchar not null,
	started_at timestamp with time zone default current_timestamp,
	due_at timestamp with time zone,
	assigned_to uuid,
	constraint "assigned_to_fk" foreign key (assigned_to) references People (id) on update cascade on delete set null
);

-- begin data section

insert into People (id, preferred_name) values
	('4fcf4719-7490-4f0c-93bb-b296466fed60', 'Alice'),
	('701214bd-e77a-4d71-bfd0-cf4ecab5c48a', 'Bob'),
	('ab98d95b-b7f9-4e55-982e-d0235a4d887c', 'Eve'),
	('bcaba475-78d9-4b6c-84dd-b074a2a9ad15', 'Mallory');
