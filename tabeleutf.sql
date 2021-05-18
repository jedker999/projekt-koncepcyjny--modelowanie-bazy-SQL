USE master;
DROP DATABASE IF EXISTS tabele;
GO

CREATE DATABASE tabele;
GO

USE tabele;
GO

------------ USUWANIE TABEL ------------

DROP TABLE IF EXISTS uczestnik;
DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS pytanie;
DROP TABLE IF EXISTS odpowiedź;
DROP TABLE IF EXISTS udział;
DROP TABLE IF EXISTS udzial_w_teście;   
GO

SET LANGUAGE polski
GO

------------ CREATE - UTWÓRZENIE TABEL I POWIĄZAŃ ------------

CREATE TABLE uczestnik
(
    login_                      VARCHAR(15),
    imię                        VARCHAR(20) NOT NULL,
    nazwisko                    VARCHAR(20) NOT NULL,
    data_urodzenia              DATE,
    data_dodania_do_systemu     DATE,
    CONSTRAINT PK_uczestnik PRIMARY KEY (login_),
    CONSTRAINT spr_dat_ucz CHECK (data_urodzenia<data_dodania_do_systemu)
);

CREATE TABLE test
(
    numer                       INT, --PRIMARY KEY,
    kategoria                   VARCHAR(15) NOT NULL,
    data_utworzenia             DATE NOT NULL,
    data_wygaśnięcia            DATE,
    opis                        VARCHAR(20) NOT NULL,
    CONSTRAINT PK_test PRIMARY KEY (numer),
    CONSTRAINT spr_dat CHECK (data_utworzenia<data_wygaśnięcia)
);

CREATE TABLE pytanie
(
    numer_porządkowy           INT,
    treść                      VARCHAR(30) NOT NULL,
    liczba_punktów             INT NOT NULL,
    test_numer                 INT REFERENCES test(numer),
    CONSTRAINT FK_pytanie FOREIGN KEY (test_numer) REFERENCES test(numer),
    CONSTRAINT PK_pytanie PRIMARY KEY (numer_porządkowy,test_numer)
);

CREATE TABLE odpowiedź
(
    kod                        INT,
    treść                      VARCHAR(30) NOT NULL,
    typ                        VARCHAR(15) NOT NULL,
    test_numer                 INT,
    pytanie_numer_porządkowy   INT,
    CONSTRAINT FK_odpowiedź FOREIGN KEY (pytanie_numer_porządkowy,test_numer) REFERENCES pytanie(numer_porządkowy,test_numer),
    CONSTRAINT PK_odpowiedź PRIMARY KEY (kod),
    CONSTRAINT ck_odpowiedź_typ CHECK (typ IN ('poprawna','niepoprawna'))
);

CREATE TABLE udział
(
    id                          INT,
    punkty                      INT NOT NULL,
    data_przystąpienia          DATE NOT NULL,
    uczestnik_login_            VARCHAR(15),
    test_numer                  INT,
    CONSTRAINT FK1_udział FOREIGN KEY (uczestnik_login_) REFERENCES uczestnik(login_),
    CONSTRAINT FK2_udział FOREIGN KEY (test_numer) REFERENCES test(numer),
    CONSTRAINT PK_udział PRIMARY KEY (id)
);

CREATE TABLE udział_w_teście
(
    udział_id                   INT REFERENCES udział(id),
    odpowiedź_kod               INT REFERENCES odpowiedź(kod),
    CONSTRAINT PK_udz_w_tescie PRIMARY KEY (udział_id,odpowiedź_kod)

);

GO



------------ INSERT - WSTAWIENIE DANYCH ------------
INSERT INTO uczestnik(login_,imię,nazwisko,data_urodzenia,data_dodania_do_systemu) VALUES
('jkow','Jan','Kowalski','1996-05-30','2012-03-21'),
('know','Katarzyna','Nowak',NULL,'2012-03-23'),
('rl9','Robert','Lewandowski','1986-05-23',NULL);

INSERT INTO test(numer,kategoria,data_utworzenia,data_wygaśnięcia,opis) VALUES
(1,'biologia','2019-03-21','2020-09-21','test z genetyki'),
(2,'fizyka','2019-02-24',NULL,'test z dynamiki'),
(3,'chemia','2019-03-21',NULL,'test z równań redoks');

INSERT INTO pytanie(numer_porządkowy,treść,liczba_punktów,test_numer) VALUES
(11,'pytanie...1',10,1),
(21,'pytanie...2',5,2),
(31,'pytanie...3',15,3);

INSERT INTO odpowiedź(kod,treść,typ,test_numer,pytanie_numer_porządkowy) VALUES
(1,'a,b','niepoprawna',1,11),
(11,'a,b,c','poprawna',1,11),
(2,'a,c','niepoprawna',2,21),
(3,'c,d','poprawna',3,31);

INSERT INTO udział(id,punkty,data_przystąpienia,uczestnik_login_,test_numer) VALUES
(100,5,'2020-04-20','jkow',1),
(101,8,'2020-04-21','jkow',1),
(200,8,'2020-04-21','know',2),
(300,7,'2020-04-20','rl9',3);

INSERT INTO udział_w_teście(udział_id,odpowiedź_kod) VALUES
(100,1),
(101,11),
(200,2),
(300,3);


------------ SELECT ------------

SELECT * FROM uczestnik;
SELECT * FROM test;
SELECT * FROM pytanie;
SELECT * FROM odpowiedź;
SELECT * FROM udział;
SELECT * FROM udział_w_teście;  