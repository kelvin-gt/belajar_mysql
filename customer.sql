# Membuat Table Customer dengan unique key
create table customer 
(
	id			int				not null auto_increment,
	email		varchar(100) 	not null,
	first_name 	varchar(100)	not null,
	last_name 	varchar(100)	not null,
	primary key	(id),
	unique key 	email_unique (email)
)engine = innodb;

describe customer;

# Hapus Constraint Unique
alter table customer 
drop constraint email_unique;

# Nambah Constraint Unique
alter table customer 
add constraint email_unique unique(email);

insert into customer(email, first_name, last_name)
values ('kelvin@gmail.com', 'kelvin','gilbert');

select * from customer;

insert into customer(email, first_name, last_name)
values ('gilbert@gmail.com', 'kelvin','gilbert');











