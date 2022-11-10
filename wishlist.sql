# Membuat table foreign key
create table wishlist
(
	id int not null auto_increment,
	id_product varchar(10) not null, 
	description text,
	primary key(id),
	constraint fk_wishlist_product foreign key (id_product) references product (id)
) engine = innodb;

desc wishlist; 

show create table wishlist;

# Menghapus foreign key
alter table wishlist 
drop constraint fk_wishlist_product;

# Menambah foreign key
alter table wishlist 
add constraint fk_wishlist_product foreign key (id_product) references product(id);

insert into wishlist (id_product, description)
values ('P0001', 'Makanan Kesukaan');

select * from wishlist;

# mengubah mode foreign key ke cascade
# hapus di product, maka di wishlist hilang semua yang references dari product
alter table wishlist 
add constraint fk_wishlist_product foreign key(id_product) references product(id)
on delete cascade on update cascade;

insert into product(id, name, category, price, quantity)
values ('Pxxxx', 'Coba-coba FK', 'lain-lain', 1000, 1000);

insert into wishlist(id_product, description)
values ('Pxxxx', 'makanan kesukaan');

delete from product 
where id = 'Pxxxx';

select * from wishlist;

# select all, lalu join
select * from wishlist
join product on (wishlist.id_product = product.id);

# select beberapa, lalu join
select product.id, product.name, wishlist.description 
from wishlist
join product on (wishlist.id_product = product.id);

# select beberapa, lalu join (menggunakan alias table)
select 	w.id as id_wishlist, 
		p.id as id_product, 
		p.name as product_name, 
		w.description as wishlist_description 
from wishlist as w
join product as p on (w.id_product = p.id);

desc wishlist;

# tambah kolom di table wishlist
alter table wishlist 
modify column id_customer int after id_product;

# tambah foreign key di wishlist
alter table wishlist 
add constraint fk_wishlist_customer foreign key(id_customer) references customer(id);

update wishlist
set id_customer = 1
where id = 1;

# melakukan join ke beberapa table
select customer.email, product.id, product.name, wishlist.description 
from wishlist
join product on (product.id = wishlist.id_product)
join customer on (customer.id = wishlist.id_customer);






















