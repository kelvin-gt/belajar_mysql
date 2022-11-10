# Membuat Table Order
create table orders
(
	id int not null auto_increment,
	total int not null,
	order_data datetime default current_timestamp,
	primary key (id)
)engine =innodb;

desc orders;

# Membuat table penengah dari Product dan Order untuk Many to Many
create table order_detail
(
	id_product varchar(10) not null,
	id_order int not null,
	price int not null,
	quantity int not null,
	primary key (id_product, id_order)
)engine = innodb;

desc order_detail;

show create table order_detail;

# Menambah FK
alter table order_detail 
add constraint fk_order_detail_product foreign key (id_product) references product (id);

# Menambah FK
alter table order_detail
add constraint fk_order_detail_orders foreign key (id_order) references orders (id);

insert into orders (total)
values (50000);

select * from orders;

select * from order_detail;

insert into order_detail (id_product, id_order, price, quantity)
values ('P0001', 1, 25000, 1),
('P0002', 1, 25000, 1);

insert into order_detail (id_product, id_order, price, quantity)
values ('P0003', 2, 25000, 1),
('P0004', 3, 25000, 1);

insert into order_detail (id_product, id_order, price, quantity)
values ('P0001', 2, 25000, 1), 
('P0003', 3, 25000, 1);

# Melihat Data Order, Detail, dan Product dari relasi Many to Many
select *
from orders
join order_detail on (order_detail.id_order = orders.id)
join product on (product.id = order_detail.id_product);

# Melihat Data Order, Detail, dan Product dari relasi Many to Many
select 	orders.id as 'Order ID', 
		product.id as 'Product ID', 
		product.name as 'Product Name', 
		order_detail.quantity, 
		order_detail.price
from order_detail
join orders on (orders.id = order_detail.id_order)
join product on (product.id = order_detail.id_product);
























































