# Implementasi One To Many
# Dari Product join Categories untuk references id_categories

select * from product;

alter table product 
drop column category;

# Membuat Category setelah drop column Category di Product
create table categories
(
	id varchar(10) not null,
	name varchar(100) not null, 
	primary key (id)
)engine = innodb;

desc product;
describe categories;

# Tambah kolom di Product
alter table product 
add column id_categories varchar(10);

# Tambah Foreign Key di Product
alter table product
add constraint fk_product_categories foreign key(id_categories) references categories(id);

insert into categories (id, name)
values ('C0001', 'Makanan'),
('C0002', 'Minuman'),
('C0003', 'Lain-lain');

# Update data Product untuk id_categories 
update product
set id_categories = 'C0001'
where id in ('P0001', 'P0002', 'P0003', 'P0004', 'P0005', 'P0006', 'P0013', 'P0014', 'P0015');

update product 
set id_categories = 'C0002'
where id between 'P0007' and 'P0009';

update product
set id_categories = 'C0003'
where id_categories is null;

select * from categories;

# Melihat hasil relasi One Category to Many Product
select product.id, product.name, categories.name
from product
join categories on (categories.id = product.id_categories);

insert into categories (id, name)
values ('C0004', 'Oleh-oleh'),
('C0005', 'Gadget');

# Inner Join / Join
select * from categories
join product on (product.id_categories  = categories.id);

# Left Join
# Table Pertama/Kiri Categories, Table Kedua/Kanan Product
select * from categories
left join product on (product.id_categories = categories.id);

# Right Join
select * from categories
right join product on (product.id_categories = categories.id);




