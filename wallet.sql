# Membuat table dengan relasi one to one
create table wallet
(
	id int not null auto_increment,
	id_customer int not null,
	balance int not null default 0,
	primary key(id),
	unique key unique_id_customer (id_customer),
	constraint fk_wallet_customer foreign key (id_customer) references customer(id)
)engine = innodb;

describe wallet;

select * from wallet;

insert into wallet (id_customer) 
values (1), (3);

# Melihat hasil One wallet to One customer
select customer.email, wallet.balance
from wallet
join customer on (customer.id = wallet.id_customer);


























