# Locking Record

start transaction;

select * from guestbook;

update guestbook
set title = 'Diubah oleh User 2'
where id = 12;

commit; #-------------------------------------------------------

# Locking Manual

start transaction;

select * from product;

# Select for Update User2 akan di pause sampai User 1 commit
select * from product where id = 'P0001' for update;

update product
set quantity = quantity - 10
where id = "P0001";

commit; #--------------------------------------------------------

# Deadlock

start transaction;

select * from product where id = "P0002" for update;

select * from product where id = "P0001" for update;

#--------------------------------------------------------

# Lock Tables READ
select * from product;

update product
set quantity = 80
where id = 'P0001';

# Lock Table WRITE
select * from product;

alter table product
add column sample text;



































