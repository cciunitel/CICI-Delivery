CREATE TABLE delivery(
	id_delivery VARCHAR(10),
	nama_delivery VARCHAR(20),
	jenis_delivery VARCHAR(20),
	alamat_delivery VARCHAR(30),
	keterangan VARCHAR(50)
);

ALTER TABLE delivery ADD CONSTRAINT pk_delivery PRIMARY KEY(id_delivery);

CREATE TABLE menu(
	id_menu VARCHAR(10),
	nama_menu VARCHAR(20),
	harga INT,
	id_delivery VARCHAR(10)
);

ALTER TABLE menu ADD CONSTRAINT pk_menu PRIMARY KEY(id_menu);

ALTER TABLE menu ADD CONSTRAINT fk_menu
	FOREIGN KEY(id_delivery)
	REFERENCES delivery (id_delivery)
	ON DELETE CASCADE ON UPDATE CASCADE;

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


