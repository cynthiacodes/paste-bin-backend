drop table if exists pastes;

create table pastes 
(id serial primary key,
 title varchar(55),
 description text not null,
 creation_date date
);
