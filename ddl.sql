
create table delivery(
	id_delivery varchar(10),
	nama_delivery varchar(20),
	jenis_delivery varchar(20),
	alamat_delivery varchar(30),
	keterangan varchar(50)
);

alter table delivery add constraint pk_delivery primary key (id_delivery);

create table menu(
	id_menu varchar(10),
	nama_menu varchar(20),
	harga int,
	id_delivery varchar(10)
);

alter table menu add constraint pk_menu primary key (id_menu);

alter table menu add constraint fk_menu FOREIGN key(id_delivery) references
delivery (id_delivery) on delete cascade on update cascade;

create table pembeli(
	id_pembeli varchar(10),
	nama_pembeli varchar(20),
	no_hp varchar(13),
	id_line varchar(20)
);

alter table pembeli add constraint pk_pembeli primary key (id_pembeli);

create table membeli(
	id_pembeli varchar(10),
	waktu_beli timestamp,
	id_menu varchar(10),
	jumlah int,
	total_bayar int
);

alter table membeli add constraint fk_waktu foreign key (id_menu) references
menu (id_menu) on delete restrict on update cascade;

alter table membeli add constraint fk_waktu2 foreign key (id_pembeli) references
pembeli (id_pembeli) on delete restrict on update cascade;

alter table membeli add constraint pk_membeli1 primary key (waktu_beli);
alter table membeli add constraint pk_membeli2 primary key (id_menu);
alter table membeli add constraint pk_membeli3 primary key (id_pembeli);


