BEGIN EXECUTE IMMEDIATE 'DROP TABLE KURSI CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE TEATER CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

create table TEATER (
    nomor_teater VARCHAR2(20) PRIMARY KEY
);

create table KURSI (
    id_kursi VARCHAR2(20) PRIMARY KEY,
    nomor_teater VARCHAR2(20),
    nomor_kursi VARCHAR2(5)
);

BEGIN
  for t in 1..5 loop
    insert into TEATER VALUES ('Teater ' || t);
    
    for k in 1..40 loop
      insert into KURSI VALUES (
        'K_' || t || '_' || k, 
        'Teater ' || t, 
        CHR(64+t) || k
      );
    end loop;
  end loop;
  commit;
end;
/

select 
    TEATER.nomor_teater AS NOMOR_TEATER, 
    KURSI.nomor_kursi AS NO_K
from 
    TEATER
JOIN 
    KURSI on TEATER.nomor_teater = KURSI.nomor_teater
ORDER by 
    TEATER.nomor_teater, 
    KURSI.nomor_kursi;