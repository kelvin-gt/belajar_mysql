# Membuat user dengan batasan host
create user 'kelvin'@'localhost';

# Membuat user tanpa batasan, bisa dari mana saja
create user 'gilbert'@'%';

# Menghapus user
drop user 'kelvin'@'localhost';
drop user 'gilbert'@'%';

# Menambah Hak Akses User
grant select on belajar_mysql.* to 'kelvin'@'localhost';

grant select on belajar_mysql.* to 'gilbert'@'%';
grant insert, update, delete on belajar_mysql.* to 'gilbert'@'%';

# Menampilkan Hak Akses User
show grants for 'kelvin'@'localhost';
show grants for 'gilbert'@'%';

# Menghapus Hak Akses User
revoke select on belajar_mysql.* to 'kelvin'@'localhost';
revoke select, insert update, delete on belajar_mysql.* to 'kelvin'@'localhost';

# Membuat Password User
set password for 'kelvin'@'localhost' = 'rahasia';
set password for 'gilbert'@'%' = 'rahasia';

insert into guestbook (email, title, content)
values ('contoh123@gmail.com', 'Contoh', 'Contoh');



show tables;




















