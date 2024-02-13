Create database kutuphane
go
Use kutuphane
go
Create table ogrenci(ogrNo int primary key,ograd varchar(30),ogrsoyad varchar(30),cinsiyet varchar(5),dtarihi date,sinif varchar(10),puan int)
go
Use kutuphane
go
insert into ogrenci values(101,'Ali','KARA','Erkek','2000/12/24','ATP11A',10),(102,'Ay�e','KAR','Kad�n','2000/05/24','ATP11A',5),(103,'Ali','SARI','Erkek','2000/12/15','ATP11A',8),(104,'Fatma','YE��L','Kad�n','2000/11/18','ATP11A',6),
(105,'Elif','AK','Kad�n','2001/01/18','ATP11A',10),(106,'Fatma','YE��L','Kad�n','2000/06/12','ATP11A',3),(107,'Kaya','ASIM','Erkek','2001/10/23','ATP11A',2),(108,'Nesrin','AS�L','Kad�n','2000/06/27','ATP11A',8),(109,'Salih','YA�','Erkek','2000/03/16','ATP11A',4)
go
Use kutuphane
go
Create table tur(turno int primary key,turadi varchar(50) )
go
Use kutuphane
go
insert into tur values (1,'Korku'),(2,'Komedi'),(3,'Dram'),(4,'Polisiye'),(5,'Tarihi'),(6,'Spor'),(7,'A�k')
go
Use kutuphane
go
Create table yazar(yazarno int primary key,yazarad varchar(30),yazarsoyad varchar(30))
go
Use kutuphane
go
insert into yazar values (1,'Orhan','PAMUK'),(2,'Elif','�AFAK'),(3,'Ay�e','KUL�N'),(4,'H�fz�','TOPUZ'),(5,'Turgut','�ZAKMAN'),(6,'�lber','ORTAYLI'),(7,'Ayhan','DEVER')
go
Use kutuphane
go
Create table kitap(kitapno int primary key,isbnno int,kitapadi varchar(100),yazarno int foreign key references yazar(yazarNo),turno int foreign key references tur(turno),sayfasayisi int,puan int)
Use kutuphane
go
insert into kitap values (1,25695,'A�k',2,3,356,10),(2,12395,'Romantika',5,7,180,3),(3,15695,'K�rd���m',4,7,452,5),(5,98395,'Sevdalinka',3,7,520,6),(6,36987,'Veda',3,5,369,5),(7,19895,'T�rklerin Tarihi',6,5,690,8),(8,15987,'Spor Sosyolojisi',7,6,185,2),(9,89695,'Hatice Sultan',4,5,850,6)
go
Use kutuphane
go
Create table islem(islemno int primary key,Ogrno int foreign key references ogrenci(ogrNo),kitapNo int foreign key references kitap(kitapNo),atarih date,vtarih date)
Use kutuphane
go
insert into islem values (1,101,2,'2017/12/10','2017/12/25'),(2,102,6,'2018/01/16','2018/01/26'),(3,103,1,'2018/01/10','2018/01/25'),(4,104,8,'2018/02/10','2018/02/15'),(5,105,7,'2017/12/25','2018/01/12'),(6,106,7,'2018/02/25','2018/03/25'),(7,107,9,'2018/03/03','2018/03/25'),(8,101,5,'2018/01/10','2018/01/25')
go



/*Sorular ve cevaplar�*/

/*1 - ��renci tablosundaki t�m bilgileri getiriniz*/

SELECT * FROM ogrenci

/*2 - Sayfa say�s� ortalama sayfa say�s�ndan k���k olan kitaplar� listeleyen Sorgu yap�n�z*/

SELECT * FROM kitap where sayfasayisi < (SELECT AVG(sayfasayisi) FROM kitap)

SELECT AVG(sayfasayisi) from kitap

/*3 - T�r� tarih olan kitaplar� listeleyen i� i�e select sorgusu yap�n�z*/

SELECT * FROM kitap

SELECT * FROM tur

SELECT * FROM kitap where turno = (SELECT turno FROM tur WHERE turadi = 'Tarihi')

/*4 - Ad� A harfi ile ba�layan Yazarlara ait Kitaplar�n Listesini ve hangi t�rde oldu�unu ve yazar ad�n�ve soyad�n� yap�n�z*/

SELECT * FROM yazar

SELECT * FROM kitap

SELECT * FROM tur

SELECT * FROM yazar WHERE yazar.yazarad LIKE '[a]%'

SELECT kitap.*, tur.turadi, yazar.yazarad, yazar.yazarsoyad FROM kitap inner join yazar on kitap.yazarno = yazar.yazarno inner join tur on tur.turno = kitap.turno where yazar.yazarad LIKE '[a]%'


/*5 - �� i�e select ile okunmayan kitaplar� listeleyen sorgu yap�n�z*/

SELECT * FROM kitap
SELECT * FROM islem

SELECT * FROM kitap WHERE kitapno not in (SELECT kitapno FROM islem)

/*6 - Ocak ay�nda okunmayan kitaplar�n listesi yap�n�z*/

SELECT MONTH(atarih), MONTH(vtarih) FROM islem
SELECT * FROM kitap
SELECT * FROM islem

SELECT kitap.* FROM kitap WHERE kitapno not in (SELECT islem.kitapNo FROM islem WHERE MONTH(atarih) = 1 AND MONTH(vtarih) = 1)

/*7 - Her t�rde kitap okuyan ka� ��renci vard�r ve bu t�rlerin adlar�n� a��k yazacakbir �ekilde artan s�rada listeleyiniz*/

SELECT * FROM ogrenci
SELECT * FROM kitap
SELECT * FROM islem

/*8 - T�r� A�k olan kitaplardan her hangi birinden daha d���k sayfa say�s� olan kitaplar� listeleyiniz*/

SELECT * FROM kitap

SELECT * FROM tur

SELECT * FROM kitap WHERE kitap.sayfasayisi not in (SELECT kitap.sayfasayisi FROM kitap WHERE kitap.turno in (SELECT tur.turno FROM tur WHERE tur.turadi = 'A�k'))


