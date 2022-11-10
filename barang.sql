# membuat table
create table barang
(
	id int,
	nama varchar(100),
	harga int,
	jumlah int
)engine = InnoDB;

# menampilkan list table
show tables;

# menampilkan code buat table
show create table barang;

# menampilkan struktur table
desc barang;

# melihat isi table
select * from barang;

# menambah kolom
alter table barang
add column deskripsi text;

# menambah kolom
alter table barang 
add column salah text;

# menghapus kolom
alter table barang 
drop column salah;

# modifikasi kolom nama lalu taruh di kolom akhir
alter table barang 
modify nama varchar(200) after deskripsi;

# modfikasi kolom ke paling awal
alter table barang 
modify nama varchar(200) first;

# modifikasi kolom dengan not null
alter table barang 
modify nama varchar(200) not null,
modify id int not null,
modify harga int not null;

# modifikasi table dengan default
alter table barang 
modify harga int not null default 0;

# modifikasi table dengan default
alter table barang
modify jumlah int not null default 0;

# modifikasi table dengan default
alter table barang 
add column waktu_dibuat timestamp not null default current_timestamp;

# memasukan data ke table
insert into barang (id, nama) values (1, 'Apel');

select * from barang;

# mengosongkan isi table
truncate barang; 

# menghapus table
drop table barang;



 