create table guestbook
(
	id int not null auto_increment,
	email varchar(100),
	title varchar(200),
	content text,
	primary key (id)
)engine = innodb;

insert into guestbook (email, title, content)
values 	('guest1@gmail.com', 'Hello', 'Hello'),
		('guest2@gmail.com', 'Hello', 'Hello'),
		('guest3@gmail.com', 'Hello', 'Hello'),
		('kelvin@gmail.com', 'Hello', 'Hello');
	
insert into guestbook (email, title, content)
values ('kelvin@gmail.com', 'Hello', 'Hello'), 
('kelvin@gmail.com', 'Hello', 'Hello');

# Set Operator, UNION
select distinct email from guestbook
union
select distinct email from customer;

# Set Operator, UNION ALL
select email from guestbook
union all
select email from customer;

# Subquery, Union ALL
select em.email, count(em.email)
from
(
	select email from customer
	union all
	select email from guestbook
) as em
group by em.email;

# Intersect tidak ada di MySQL, jadi pake Subquery
select distinct email from customer
where email in (select distinct email from guestbook);

# Intersect tidak ada di MySQL, jadi pake Join
select distinct customer.email from customer
join guestbook on (guestbook.email = customer.email)

# Minus tidak ada di MySQL, jadi pake Left Join, bisa juga Right Join
select distinct customer.email, guestbook.email 
from customer
left join guestbook on (guestbook.email = customer.email)
where guestbook.email is null;


# Proses Transaksi Commit

start transaction;

insert into guestbook (email, title, content)
values ('contoh@gmail.com', 'Contoh', 'Contoh'),
('contoh2@gmail.com', 'Contoh', 'Contoh'),
('contoh3@gmail.com', 'Contoh', 'Contoh');

select * from guestbook;

commit;

# Proses Transaction Rollback 

start transaction;

delete from guestbook;

select * from guestbook;

rollback;

























































