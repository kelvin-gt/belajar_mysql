# Membuat Table Product
create table product
(
	id 			varchar(10) not null,
	name 		varchar(100) not null,
	description text,
	price 		int unsigned not null,
	quantity 	int unsigned not null default 0,
	created_at 	timestamp not null default current_timestamp
)engine = innodb;

show tables;

describe product;

insert into product(id, name, price, quantity)
values ('P001','Mie Ayam Original',15000, 100);

insert into product (id, name, description, price, quantity)
values ('P002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100);

insert into product (id, name, price, quantity)
values ('P003', 'Mie Ayam Ceker', 20000, 100),
('P004', 'Mie Ayam Spesial', 25000, 100),
('P005', 'Mie Ayam Yamin', 15000, 100);

select * from product;

select id, name, price, quantity from product;

alter table product 
add primary key (id);

show create table product;

select id, name, price, quantity
from product
where quantity = 100;

select id, name, price, quantity
from product
where price = 15000;

select id, name, price, quantity
from product
where id = 'P001';

select id, name, price, quantity
from product
where name = 'Mie Ayam Bakso';

select * from product
where id = 'P001';

alter table product 
add column category enum ('makanan', 'minuman', 'lain-lain') after name;

# update 1 kolom
update product
set category = 'Makanan'
where id = 'P001';

# update beberapa kolom
update product
set category = 'makanan',
description = 'Mie Ayam Original + Ceker'
where id = 'P003';

# update dengan value di kolom
update product 
set price = price + 5000
where id = 'P005';

select * from product;

insert into product (id, name, category, price, quantity)
values ('P009', "Mie Ayama nd taulah", "makanan", 30000, 10);

# menghapus data di table
delete from product 
where id = 'P009';

# alias untuk kolom
select 	id as 'kode produk', 
		name as 'nama produk', 
		category as kategori, 
		price as harga, 
		quantity as jumlah
from product;

# alias untuk table
select 	p.id as 'kode produk', 
		p.name as 'nama produk', 
		p.category as kategori, 
		p.price as harga, 
		p.quantity as jumlah
from product as p;

insert into product(id, category, name, price, quantity)
values	('P006', 'makanan', 'Bakso Rusuk', 25000, 200),
		('P007', 'minuman', 'Es Jeruk', 10000, 300),
		('P008', 'minuman', 'Es Campur', 15000, 500),
		('P009', 'minuman', 'Es Teh Manis', 5000, 400),
		('P0010', 'lain-lain', 'Kerupuk', 2500, 1000),
		('P0011', 'lain-lain', 'Keripik Udang', 10000, 300),
		('P0012', 'lain-lain', 'Es Krim', 5000, 200),
		('P0013', 'makanan', 'Mie Ayam Jamur', 20000, 50),
		('P0014', 'makanan', 'Bakso Telor', 20000, 150),
		('P0015', 'makanan', 'Bakso Jando', 25000, 300);

# Where, Operator Perbandingan
select * from product
where quantity > 100;

select * from product
where quantity >= 100;

select * from product
where category != 'makanan';

select * from product
where category <> 'minuman';

# Where, Operator AND
select * from product
where quantity > 100 and price > 20000;

select * from product
where category = 'makanan' and price < 20000;

# Where, Operator OR 
select * from product
where quantity > 100 or price > 20000;

# Where, Operator Prioritas
select * from product
where category = 'makanan' or (quantity > 500 and price > 20000);

select * from product
where (category = 'makanan' or quantity > 500) and price > 20000;

# Where, Operator LIKE
select * from product 
where name like '%mie%';

select * from product 
where name like 'k%';

select * from product
where name not like '%es%';

# Where, Null Operator
select * from product p 
where description is null;

select * from product p 
where description is not null;

# Where, Between Operator
select * from product
where price not between 10000 and 20000;

# Where, Operator IN
select * from product
where category in ('makanan', 'minuman');

select * from product
where category not in ('makanan','minuman');

# ORDER BY Clause
select id, category, name from product
order by category;

select id, category, price, name from product
order by category asc, price desc;

# LIMIT Clause
select * from product order by id limit 5;

select * from product order by id limit 0,5;

select * from product order by id limit 5,5;

select * from product order by id limit 10,5;

select * from product
where price > 0
order by price desc
limit 5;

# DISCTINCT Data
select distinct category from product;

# Arimathic Function
select 10, 3 ,10 % 3 as Hasil;

select id, name, price, price div 1000 as "Price in K"
from product;

# Mathematical Function
select pi(); 

select power(10,2); 

select id, cos(price), sin(price), tan(price) from product;  

select id, name, price from product
where price div 1000 > 15;

# String Function
select 	id,
		lower(name) as 'Name Lower',
		upper(name) as 'Name Upper', 
		length(name) as 'Name Length'
from product;
		
select * from product;

# Data and Time function 
select 	id, created_at,
		extract(year  from created_at) as Year,
		extract(month from created_at) as month
from product;

select id, created_at, year(created_at), month(created_at) from product;

# Control Flow Case
select	id,
		category,
		case category
			when 'makanan' then 'enak'
			when 'minuman' then 'segar'
			else 'apa itu?'
			end as 'Category'
from product;

# Control Flow IF
select	id,
		price,
		if (price <= 15000, 'Murah', if (price <= 20000, 'Mahal', 'Mahal Banget')) as 'Murah?'
from product;

# Control Flow IFNULL
select 	id, 
		name, 
		description,
		ifnull(description, 'Kosong')
from product;

# Aggregate Function
select count(id) from product;

select max(price) as 'Harga Termahal Product' from product; 

select min(price) as 'Harga Termurah Product' from product; 

select sum(quantity) as 'Jumlah Semua Quantity Product' from product;


# Group By Clause
select count(id) as 'Total Product', category from product group by category;

select max(price) as 'Harga Termahal Product', category from product group by category; 

select min(price) as 'Harga Termurah Product', category from product group by category; 

select sum(quantity) as 'Jumlah Stock Product', category from product group by category;

# HAVING utk filter hasil dari grouping
select count(id) as Total, category 
from product 
group by category 
having Total > 5;

select * from product;

insert into product(id, name, category, price, quantity)
values	('P0016', 'Permen', 'lain-lain', 500, 1000);

update product 
set price = 1000
where id = 'P0016';

# Menambah Constraint Check dengan alter table
alter table product 
add constraint price_check check(price >= 1000);

# Menghapus Constraint Check dengan alter table
alter table product 
drop constraint price_check;

show create table product;

# Menambah Full Text Search
alter table product 
add fulltext product_fulltext (name, description);

select * from product
where name like '%ayam%' or description like '%ayam%';

# Select Full Text Search, mode Natural Language, diurutkan berdasarkan ranking byk kata 'ayam'
select * from product
where match (name, description)
		against ('ayam' in natural language mode);

# Select Full Text Search, mode Boolean
select * from product
where match (name, description)
		against ('+mie -bakso' in boolean mode);

# Select Full Text Search, mode Query Expansion, 2x pencarian data
select * from product
where match (name, description)
		against ('bakso' with query expansion);

insert into product (id, name, price, quantity) 
values ('X0001', 'X satu', 25000, 200),
('X0002', 'X dua', 10000, 300),
('X0003', 'X tiga', 15000, 500);

select * from product;

# Cara Select Satu-satu
select avg(price) from product;

select * from product
where price > 15184.2105;

# Bisa digabung jadi satu dengan 'Subquery Where'
select * from product
where price > (select avg(price) from product);


# Cari harga tertinggi dari product
select max(price) from product;

# Lihat list harga dari (relasi table product dan categories)
select price from product
join categories on (categories.id = product.id_categories);

# Cari harga tertinggi dari (relasi table product dan categories) menggunakan "Subquery From"
select max(cp.price) 
from 
(
	select price from categories
	join product on (product.id_categories = categories.id)
) as cp;














