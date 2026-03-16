create table mahasiswa (
    id VARCHAR2(10) primary key,
    nama VARCHAR2(100),
    tempat_lahir VARCHAR2(50),
    tanggal_lahir DATE,
    nomor_hp VARCHAR2(15),
    email VARCHAR2(50),
    tinggi_badan NUMBER(5,2),
    berat_badan NUMBER(5,2)
);

insert into mahasiswa VALUES ('M001', 'Andi Saputra', 'Jakarta', TO_DATE('2001-05-14', 'YYYY-MM-DD'), '081234567890', 'andisp@Gmail.com', 170.50, 65.00);
insert into mahasiswa VALUES ('M002', 'Bina supriyanto', 'Bandung', TO_DATE('2002-08-21', 'YYYY-MM-DD'), '081298765432', 'binadin@Gmail.com', 160.00, 55.20);
insert into mahasiswa VALUES ('M003', 'Cipto Mangunkusumo', 'Surabaya', TO_DATE('2000-11-02', 'YYYY-MM-DD'), '085612345678', 'ciptomgs@Gmail.com', 175.25, 72.50);
insert into mahasiswa VALUES ('M004', 'Dina Mariana', 'Yogyakarta', TO_DATE('2001-02-15', 'YYYY-MM-DD'), '081345678901', 'dinana@Gmail.com', 158.00, 48.00);
insert into mahasiswa VALUES ('M005', 'Eko Prasetyo', 'Semarang', TO_DATE('1999-12-30', 'YYYY-MM-DD'), '089912345678', 'eko16@Gmail.com', 168.50, 68.30);
insert into mahasiswa VALUES ('M006', 'Fani Rahmawati', 'Malang', TO_DATE('2002-04-10', 'YYYY-MM-DD'), '087812345678', 'fannyml@Gmail.com', 155.50, 50.10);
insert into mahasiswa VALUES ('M007', 'Gilang Ramadhan', 'Medan', TO_DATE('2001-07-07', 'YYYY-MM-DD'), '081112345678', 'rmdgilang@Gmail.com', 178.00, 80.00);
insert into mahasiswa VALUES ('M008', 'Hana Saraswati', 'Denpasar', TO_DATE('2003-01-25', 'YYYY-MM-DD'), '082212345678', 'hanasara@Gmail.com', 162.00, 54.50);
insert into mahasiswa VALUES ('M009', 'Irfan Hakim', 'Makassar', TO_DATE('2000-09-18', 'YYYY-MM-DD'), '085212345678', 'irfanhakim@Gmail.com', 172.00, 75.00);
insert into mahasiswa VALUES ('M010', 'Jihan Fahira', 'Palembang', TO_DATE('2001-10-10', 'YYYY-MM-DD'), '081512345678', 'jhnr@Gmail.com', 164.50, 58.20);
insert into mahasiswa VALUES ('M011', 'Kevin Sanjaya', 'Banyuwangi', TO_DATE('1998-08-02', 'YYYY-MM-DD'), '081612345678', 'kevinjaya@Gmail.com', 170.00, 64.00);
insert into mahasiswa VALUES ('M012', 'Lina Marlina', 'Solo', TO_DATE('2002-03-12', 'YYYY-MM-DD'), '089612345678', 'linalina@Gmail.com', 159.50, 52.00);
insert into mahasiswa VALUES ('M013', 'Muhammad Iqbal', 'Padang', TO_DATE('2001-06-20', 'YYYY-MM-DD'), '081912345678', 'muhammdaiqbal@Gmail.com', 169.00, 66.50);
insert into mahasiswa VALUES ('M014', 'Nadia Saphira', 'Balikpapan', TO_DATE('2003-05-05', 'YYYY-MM-DD'), '085312345678', 'nadia192@Gmail.com', 166.00, 59.00);
insert into mahasiswa VALUES ('M015', 'Alya Mutiara', 'Ambon', TO_DATE('1999-11-11', 'YYYY-MM-DD'), '081812345678', 'alisaruby@Gmail.com', 174.50, 71.80);

select * from mahasiswa;

select nama, LOWER(nama) AS huruf_kecil, UPPER(nama) AS huruf_besar, INITCAP(email) AS huruf_kapital_awal 
from mahasiswa where ROWNUM <= 5;

select CONCAT(nama, CONCAT(' - ', nomor_hp)) AS info_kontak, LENGTH(nama) AS jumlah_huruf 
from mahasiswa where ROWNUM <= 5;

select nama, 
       SUBSTR(nama, 1, 5) AS potong_5_huruf, 
       LPAD(id, 8, '*') AS tambah_bintang_kiri, 
       RPAD(id, 8, '-') AS tambah_strip_kanan 
from mahasiswa where ROWNUM <= 5;

select nama, 
       LTRIM(nama, 'A') AS hapus_A_kiri, 
       RTRIM(nama, 'a') AS hapus_a_kanan, 
       INSTR(email, '@') AS posisi_simbol_at, 
       REPLACE(nama, 'a', 'o') AS ganti_a_jadi_o 
from mahasiswa where ROWNUM <= 5;

select SYSDATE AS waktu_sekarang, 
       TO_CHAR(SYSDATE, 'DD/MON/YYYY HH24:MI:SS') AS format_lengkap 
from DUAL;

select nama, tanggal_lahir, 
       ADD_MONTHS(tanggal_lahir, 6) AS tambah_6_bulan, 
       LAST_DAY(tanggal_lahir) AS akhir_bulan_lahir 
from mahasiswa where ROWNUM <= 5;

select nama, tanggal_lahir, 
       ROUND(MONTHS_BETWEEN(SYSDATE, tanggal_lahir)) AS umur_dalam_bulan,
       ROUND(tanggal_lahir, 'YEAR') AS bulatkan_ke_tahun,
       ROUND(tanggal_lahir, 'MONTH') AS bulatkan_ke_bulan
from mahasiswa where ROWNUM <= 5;

select TO_CHAR(tinggi_badan, '999.99') AS tinggi_jadi_teks,
       TO_NUMBER('1000') + 500 AS teks_jadi_angka_ditambah,
       TO_DATE('17-08-1945', 'DD-MM-YYYY') AS teks_jadi_tanggal
from mahasiswa where ROWNUM <= 5;

select tanggal_lahir,
       TO_CHAR(tanggal_lahir, 'DD/MM/YYYY') AS format_angka,
       TO_CHAR(tanggal_lahir, 'DAY, DD MONTH YYYY') AS format_huruf
from mahasiswa where ROWNUM <= 5;

select berat_badan,
       ABS(-150) AS nilai_absolut,
       MOD(berat_badan, 10) AS sisa_bagi_10,
       POWER(berat_badan, 2) AS berat_pangkat_dua
from mahasiswa where ROWNUM <= 5;

select tinggi_badan,
       FLOOR(tinggi_badan) AS bulatkan_ke_bawah,
       CEIL(tinggi_badan) AS bulatkan_ke_atas,
       ROUND(tinggi_badan) AS bulatkan_terdekat
from mahasiswa where ROWNUM <= 5;