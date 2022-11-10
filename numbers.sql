# Cross Join
create table numbers
(
	id int not null,
	primary key(id)
)engine = innodb;

insert into numbers (id)
values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

select * from numbers;

select numbers1.id as numbers1, numbers2.id as numbers2, (numbers1.id * numbers2.id)
from numbers as numbers1
cross join numbers as numbers2
order by numbers1.id, numbers2.id;
