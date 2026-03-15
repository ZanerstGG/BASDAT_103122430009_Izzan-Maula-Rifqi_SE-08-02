create table Film (
    id_film VARCHAR2(10) PRIMARY KEY,
    judul VARCHAR2(100),
    sinopsis VARCHAR2(255),
    tahun NUMBER(4),
    durasi NUMBER(3)
);

create table Theater (
    id_theater VARCHAR2(10) PRIMARY KEY,
    harga NUMBER(10),
    kapasitas NUMBER(3),
    kelas VARCHAR2(20)
);

create table Member (
    id_member VARCHAR2(10) PRIMARY KEY,
    nama VARCHAR2(100),
    no_hp VARCHAR2(15),
    tgl_lahir DATE,
    email VARCHAR2(50)
);

create table Inventaris (
    id_inventaris VARCHAR2(10) PRIMARY KEY,
    id_theater VARCHAR2(10),
    nomor_kursi VARCHAR2(5),
    CONSTRAINT fk_inv_theater FOREIGN KEY (id_theater) REFERENCES Theater(id_theater)
);

create table Jadwal (
    id_jadwal VARCHAR2(10) PRIMARY KEY,
    id_film VARCHAR2(10),
    id_theater VARCHAR2(10),
    periode_start DATE,
    periode_end DATE,
    CONSTRAINT fk_jdw_film foreign key (id_film) references Film(id_film),
    CONSTRAINT fk_jdw_theater foreign key (id_theater) references Theater(id_theater)
);

create table Transaksi (
    kode_pemesanan VARCHAR2(20) PRIMARY KEY,
    id_jadwal VARCHAR2(10),
    id_member VARCHAR2(10),
    status VARCHAR2(20),
    tanggal DATE,
    total_harga NUMBER(10),
    CONSTRAINT fk_trx_jadwal FOREIGN KEY (id_jadwal) REFERENCES Jadwal(id_jadwal),
    CONSTRAINT fk_trx_member FOREIGN KEY (id_member) REFERENCES Member(id_member)
);

insert into film VALUES ('F001', 'BangDream!', 'Sekelompok Band gadis yang sudah lama hancur dan ingin berkumpul kembali seperti dulu', 2023, 162);
insert into film VALUES ('F002', 'Stand by me Doraemon', 'Seorang laki-laki yang tidak bisa apa-apa bertemu dengan robot dari masa depan', 2014, 098);
insert into film VALUES ('F003', 'Kimi no Nawa', 'Bintang jatuh yang merubah mimpi 2 orang', 2016, 103);
insert into film VALUES ('F004', 'Shiboyugi de Meshi wo Kuu.', 'Hidup ini punya banyak tujuan, tinggal kamu berniat memilih yang mana', 2026,262);

insert into Theater VALUES ('T001', 30000, 100, 'Reguler');
insert into Theater VALUES ('T002', 45000, 50, 'VIP');

insert into Member VALUES ('M001', 'Yuki', '090619231712', TO_DATE('2009-06-29', 'YYYY-MM-DD'), 'YukiSorimachi@yahoo.co.jp');
insert into Member VALUES ('M002', 'Itsuki', '09081923712', TO_DATE('2009-03-15', 'YYYY-MM-DD'), 'Itsukinakano@yahoo.co.jp');
insert into Member VALUES ('M003', 'Bat', '062918273123', TO_DATE('2001-10-31', 'YYYY-MM-DD'), 'OwlandCo@yahoo.co.fr');

insert into Inventaris VALUES ('INV01', 'T001', 'A1');
insert into Inventaris VALUES ('INV02', 'T002', 'V1');

insert into Jadwal VALUES ('J001', 'F001', 'T001', TO_DATE('2023-11-01 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-11-01 13:00', 'YYYY-MM-DD HH24:MI'));
insert into Jadwal VALUES ('J002', 'F002', 'T002', TO_DATE('2023-11-02 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-11-02 17:00', 'YYYY-MM-DD HH24:MI')); 

insert into Transaksi VALUES ('TRX-001', 'J001', 'M001', 'Lunas', TO_DATE('2023-10-31', 'YYYY-MM-DD'), 50000);
insert into Transaksi VALUES ('TRX-002', 'J002', 'M002', 'Menunggu', TO_DATE('2023-11-01', 'YYYY-MM-DD'), 100000);

SELECT * from Film;
SELECT * from Member;
SELECT * from Inventaris;
SELECT * from Jadwal;
SELECT * from Transaksi;

update Theater set harga = 60000 where id_theater = 'T001';
update Transaksi set status = 'Dibatalkan' where kode_pemesanan = 'TRX-002';
update Film set durasi = 185 where id_film = 'F001';
update Member set email = 'Furinafocalors@yahoo.co.en' where id_member = 'M001';
update Inventaris set nomor_kursi = 'A2' where id_inventaris = 'INV01';

delete from Transaksi where kode_pemesanan = 'TRX-002';
delete from Inventaris where id_inventaris = 'INV02';

commit;

