# Membuat table auto increment
create table admin 
(
	id int not null auto_increment,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	primary key(id)
)engine = innodb;

desc admin;

# Memasukan data tanpa id
insert into admin (first_name, last_name)
values	('Kelvin','Gilbert'),
		('Eden','Hazard'),
		('Eduardo','Mendy');
		
select * from admin order by id;

delete from admin where id = 3;

insert into admin (first_name, last_name) values ('Hakim','Ziyech');
	
# Melihat id terakhir
select last_insert_id(); 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	