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

CREATE TABLE pembeli(
	id_pembeli VARCHAR(10),
	nama_pembeli VARCHAR(20),
	no_hp VARCHAR(13),
	id_line VARCHAR(20)
);

ALTER TABLE pembeli ADD CONSTRAINT pk_pembeli PRIMARY KEY(id_pembeli);

CREATE TABLE membeli(
	id_pembeli VARCHAR(10),
	waktu_beli TIMESTAMP,
	id_menu VARCHAR(10),
	jumlah INT,
	total_bayar INT
);

ALTER TABLE membeli ADD CONSTRAINT fk_waktu
	FOREIGN KEY(id_menu)
	REFERENCES menu(id_menu)
	ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE membeli ADD CONSTRAINT fk_waktu2
	FOREIGN KEY(id_pembeli)
	REFERENCES pembeli(id_pembeli)
	ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE membeli ADD CONSTRAINT pk_membeli1 PRIMARY KEY(waktu_beli);
ALTER TABLE membeli ADD CONSTRAINT pk_membeli2 PRIMARY KEY(id_menu);
ALTER TABLE membeli ADD CONSTRAINT pk_membeli3 PRIMARY KEY(id_pembeli);
