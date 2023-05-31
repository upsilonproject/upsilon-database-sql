create table service_metrics (
	id int primary key auto_increment,
	service varchar(255) not null,
	name varchar(255) not null,
	value float not null
);
