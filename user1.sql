# Locking Record

select * from guestbook;

start transaction;

update guestbook
set title = 'Diubah oleh User 1'
where id = 12;

commit; #--------------------------------------------------------

# Locking Manual

start transaction;

select * from product;

# Select for Update User 1
select * from product where id = 'P0001' for update;

update product 
set quantity = quantity + 30
where id = "P0001";

commit; #--------------------------------------------------------

# Deadlock

start transaction;

select * from product where id = "P0001" for update;

select * from product where id = "P0002" for update;

#--------------------------------------------------------

# Lock Tables READ
lock tables product read;

# buka kunci tables
unlock tables;

# Lock Table WRITE
lock tables product write;

select * from product;

update product
set quantity = 100
where id = 'P0001';

unlock tables;

#--------------------------------------------------------

# Lock Instance
lock instance for backup;

unlock instance;

























