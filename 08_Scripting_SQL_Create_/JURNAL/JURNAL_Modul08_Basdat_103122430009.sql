SET LINESIZE 200;
SET FEEDBACK OFF;
BEGIN EXECUTE IMMEDIATE 'DROP VIEW empvu80'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE persediaan_barang CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE pemasok CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employee CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE department CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

SET FEEDBACK ON;

CREATE TABLE department (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    manager_id NUMBER,
    location_id NUMBER
);

CREATE TABLE employee (
    employee_id NUMBER PRIMARY KEY,
    last_nama VARCHAR2(50) NOT NULL,
    email VARCHAR2(50),
    salary NUMBER,
    commission_pct NUMBER,
    hire_date DATE NOT NULL,
    department_id NUMBER,
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE pemasok (
    pemasok_id NUMBER PRIMARY KEY,
    nama_pemasok VARCHAR2(100),
    kota VARCHAR2(50)
);

CREATE TABLE persediaan_barang (
    barang_id NUMBER PRIMARY KEY,
    nama_barang VARCHAR2(100),
    stok NUMBER,
    pemasok_id NUMBER,
    CONSTRAINT fk_brg_pemasok FOREIGN KEY (pemasok_id) REFERENCES pemasok(pemasok_id)
);

ANALYZE TABLE department COMPUTE STATISTICS;
ANALYZE TABLE employee COMPUTE STATISTICS;
ANALYZE TABLE pemasok COMPUTE STATISTICS;
ANALYZE TABLE persediaan_barang COMPUTE STATISTICS;

SET FEEDBACK OFF;

INSERT INTO department VALUES (10, 'IT', 101, 1000);
INSERT INTO department VALUES (20, 'HR', 102, 1000);
INSERT INTO department VALUES (30, 'Finance', 103, 1001);
INSERT INTO department VALUES (40, 'Marketing', 104, 1001);
INSERT INTO department VALUES (50, 'Shipping', 105, 1002);
INSERT INTO department VALUES (60, 'Purchasing', 106, 1002);
INSERT INTO department VALUES (70, 'Public Relations', 107, 1003);
INSERT INTO department VALUES (80, 'Sales', 108, 1003);
INSERT INTO department VALUES (90, 'Executive', 109, 1004);
INSERT INTO department VALUES (100, 'Accounting', 110, 1004);

INSERT INTO employee VALUES (1, 'Smith', 'smith@mail.com', 5000, 0.1, SYSDATE, 10);
INSERT INTO employee VALUES (2, 'Allen', 'allen@mail.com', 4500, NULL, SYSDATE, 20);
INSERT INTO employee VALUES (3, 'Ward', 'ward@mail.com', 6000, 0.15, SYSDATE, 30);
INSERT INTO employee VALUES (4, 'Jones', 'jones@mail.com', 7000, NULL, SYSDATE, 40);
INSERT INTO employee VALUES (5, 'Martin', 'martin@mail.com', 4000, 0.2, SYSDATE, 50);
INSERT INTO employee VALUES (6, 'Blake', 'blake@mail.com', 8500, NULL, SYSDATE, 60);
INSERT INTO employee VALUES (7, 'Clark', 'clark@mail.com', 7500, NULL, SYSDATE, 70);
INSERT INTO employee VALUES (8, 'Scott', 'scott@mail.com', 9000, 0.25, SYSDATE, 80);
INSERT INTO employee VALUES (9, 'King', 'king@mail.com', 10000, NULL, SYSDATE, 80);
INSERT INTO employee VALUES (10, 'Turner', 'turner@mail.com', 6500, 0.1, SYSDATE, 90);

INSERT INTO pemasok VALUES (1, 'PT Maju Jaya', 'Jakarta');
INSERT INTO pemasok VALUES (2, 'CV Elektronik Bersama', 'Bandung');
INSERT INTO pemasok VALUES (3, 'PT Kertas Nasional', 'Surabaya');
INSERT INTO pemasok VALUES (4, 'Toko Alat Tulis', 'Semarang');
INSERT INTO pemasok VALUES (5, 'PT Tech Indo', 'Jakarta');
INSERT INTO pemasok VALUES (6, 'Distributor Kayu', 'Yogyakarta');
INSERT INTO pemasok VALUES (7, 'PT Plastik Berkah', 'Bekasi');
INSERT INTO pemasok VALUES (8, 'Grosir Komputer', 'Tangerang');
INSERT INTO pemasok VALUES (9, 'Pabrik Kaca', 'Bogor');
INSERT INTO pemasok VALUES (10, 'CV Besi Baja', 'Depok');

INSERT INTO persediaan_barang VALUES (1, 'Laptop', 50, 5);
INSERT INTO persediaan_barang VALUES (2, 'Kertas HVS', 200, 3);
INSERT INTO persediaan_barang VALUES (3, 'Meja Kantor', 20, 6);
INSERT INTO persediaan_barang VALUES (4, 'Kursi Kantor', 40, 7);
INSERT INTO persediaan_barang VALUES (5, 'Printer', 15, 2);
INSERT INTO persediaan_barang VALUES (6, 'Spidol', 100, 4);
INSERT INTO persediaan_barang VALUES (7, 'Monitor', 30, 8);
INSERT INTO persediaan_barang VALUES (8, 'Papan Tulis', 10, 9);
INSERT INTO persediaan_barang VALUES (9, 'Lemari Arsip', 25, 10);
INSERT INTO persediaan_barang VALUES (10, 'Mouse', 80, 5);

COMMIT;
SET FEEDBACK ON;
ANALYZE TABLE department COMPUTE STATISTICS;
ANALYZE TABLE employee COMPUTE STATISTICS;
ANALYZE TABLE pemasok COMPUTE STATISTICS;
ANALYZE TABLE persediaan_barang COMPUTE STATISTICS;

CREATE VIEW empvu80 AS
SELECT 
    employee_id AS id_number, 
    last_nama AS name, 
    salary, 
    department_id
FROM employee
WHERE department_id = 80;

DESCRIBE empvu80;

CREATE INDEX idx_emp_dept_id ON employee(department_id);

SELECT * from department;
SELECT * from employee;
SELECT * from pemasok;
SELECT * from persediaan_barang;