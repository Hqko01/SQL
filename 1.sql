Create Database OgrenciIsleri
go
use OgrenciIsleri
go
create table Ogrenciler(
ogrNo int constraint PK_ogrNo primary key,
ad varchar(50),
soyad varchar(50),
telefon char(11),
adres varchar(100)
)
go
use OgrenciIsleri
go
create table Hocalar(
hocaNo int constraint PK_hocaNo primary key, 
ad varchar(50),
soyad varchar(50), 
unvan varchar(100)
)
go
use OgrenciIsleri
go
create table Dersler(
dersKodu varchar(10) constraint PK_dersKodu primary key, 
dersAdi varchar(100),
dersKredisi int,
hocasi int constraint FK_hocaNo foreign key references Hocalar(hocaNo)
)
go
use OgrenciIsleri
go
create table Notlar(
ogrenci int constraint FK_ogrNo foreign key references Ogrenciler(ogrNo),
ders varchar(10) constraint FK_dersKodu foreign key references Dersler(dersKodu),
dersYili varchar(10),
vize int constraint CH_vize check (vize>=0 and vize<=100),
final int constraint CH_final check (final>=0 and final<=100)
)
go

insert Ogrenciler values
(1,'Can','GÜL','05371112244','Ýstanbul'),
(2,'Zeynep','AKSU','05371112266','Ýzmir'),
(3,'Kaya','SARI','05371112277','Artvin'),
(4,'Ali','YALIN','05371112288','Balýkkesir'),
(5,'Deniz','ARÞIN','05371112299','Ankara'),
(6,'Ýbrahim','KAYA','05371112200','Þýrnak'),
(7,'Mahir','ÝPEK','05371113333','Mardin'),
(8,'Bilal','ARIK','05371112233','Mardin'),
(9,'Ayþe','KAR','05371112255','Diyarbakýr'),
(10,'Aslý','GÜL','05371112244','Þýrnak'),
(11,'Ýrfan','SAY','05372222244','Ankara'),
(12,'Cemil','GÜL','05373332244','Ýstanbul'),
(13,'Mehmet','KAYA','05373342244','Ýstanbul'),
(14,'Mehmet','GÜL','05371112244','Ankara'),
(15,'Can','GÜL','05371112244','Ankara'),
(16,'Zeynep','AKSU','05371112266','Ýzmir'),
(17,'Zeynep','KARSU','05371112266','Ýzmir')
insert Ogrenciler(ogrNo,ad,soyad) values
(18,'Dilan','SEVGÝ'),
(19,'Kaya','AÞKIN'),
(20,'Seval','AÞIN'),
(21,'Bilal','AÞIN'),
(22,'Ziya','KAÞ')
insert Hocalar values
(1,'Elif','AK','Prof. Dr.'),
(2,'Perihan','SALIK','Prof. Dr.'),
(3,'Fatma','AYDIN','Doç. Dr.'),
(4,'Þeyma','ARSLAN','Doç. Dr.'),
(5,'Musa','CAN','Prof. Dr.'),
(6,'Ali','KARA','Doç. Dr.'),
(7,'Melisa','SARI','Prof. Dr.'),
(8,'Cem','VUR','Öðr. Göv.')
insert Hocalar(hocaNo, ad, soyad) values
(9,'Metin','VUR'),
(10,'Ahsen','ÖVER'),
(11,'brahim','ÖVER')
insert Dersler values
('BIL203','Veri Tabaný',3,2),
('BIL204','Nesne Tabanlý Programlama',5,6),
('BIL205','Web Tabanlý Uygulama',6,5),
('BIL206','Mobil Programlama',3,4),
('BIL207','Oyun Geliþtirme',2,3),
('BIL208','Sosyal Medya',2,2),
('BIL209','Açýk Kaynak Ýþletim Sistemi',3,2),
('BIL210','Siber Güvenlik',4,1)
insert Notlar values
(10,'BIL203','2021-2022',75,66),
(1,'BIL203','2021-2022',25,46),
(1,'BIL207','2022-2023',50,68),
(2,'BIL203','2022-2023',50,60),
(3,'BIL205','2022-2023',50,70),
(4,'BIL205','2022-2023',70,80),
(2,'BIL206','2022-2023',78,70),
(4,'BIL207','2022-2023',50,65),
(5,'BIL208','2022-2023',57,90),
(6,'BIL210','2022-2023',58,67),
(11,'BIL207','2022-2023',50,69),
(12,'BIL203','2021-2022',75,60),
(3,'BIL205','2021-2022',50,85),
(4,'BIL205','2021-2022',50,60),
(12,'BIL206','2021-2022',55,65),
(4,'BIL207','2021-2022',50,36),
(5,'BIL208','2021-2022',23,48),
(6,'BIL208','2021-2022',85,90)
insert Notlar(ogrenci, ders,dersYili) values
(12,'BIL210','2020-2021'),
(10,'BIL206','2022-2023'),
(11,'BIL204','2021-2022'),
(9,'BIL203','2022-2023'),
(5,'BIL208','2020-2021')



create database Sirket
go
use Sirket
go
create table Bolumler
(
bolumNo int constraint PK_bolumNo primary key,
bolumAdi varchar(100)
)
go
use Sirket
go
create table Personeller
(
personelNo int constraint PK_personelNo primary key,
ad varchar(50),
soyad varchar(50),
bolum int constraint FK_bolumNo foreign key references Bolumler(bolumNo),
maas money,
gorev varchar(50),
girisTarihi datetime
)
insert Bolumler values
(1,'Yönetim'),
(2,'Satýþ'),
(3,'Teknik'),
(4,'Biliþim'),
(5,'Finans'),
(6,'Ýnsan Kaynaklarý'),
(7,'Pazarlama'),
(8,'Üretim'),
(9,'Temizlik')
insert Personeller values 
(1,'Can','GÜL',1,50000,'Müdür','1998/02/10'),
(2,'Zeynep','AKSU',1,48000,'Müdür Yardýmcýsý','1999/12/25'),
(3,'Kaya','SARI',1,48000,'Memur Yardýmcýsý','1999/06/12'),
(4,'Ali','YALIN',2,39000,'Memur','2004/07/25'),
(5,'Deniz','ARÞIN',3,39000,'Memur','2003/12/14'),
(6,'Ýbrahim','KAYA',4,36000,'Memur','2023/12/29'),
(7,'Mahir','ÝPEK',5,36000,'Memur','2000/04/01'),
(8,'Bilal','ARIK',9,15000,'Ýþçi','2022/02/25'),
(9,'Ayþe','KAR',9,15000,'Ýþçi','2023/03/25'),
(10,'Ýbrahim','KAYA',4,25000,'Memur','2023/12/29'),
(11,'Mahir','SAKÝN',5,25000,'Memur','2000/04/01'),
(12,'Bilal','ARIK',9,18000,'Ýþçi','2022/02/25'),
(13,'Ayþe','KARLI',9,18000,'Ýþçi','2023/03/25'),
(14,'Ýbrahim','KARLI',9,19000,'Ýþçi','2023/06/25')
go
create database Sinema
go
use Sinema
go
create table Turler
(
turId int constraint PK_turId primary key,
ad varchar(100)
)
go
use Sinema
go
create table Filmler
(
filmId int constraint PK_filmId primary key,
ad varchar(100),
tarih varchar(4),
imdbPuan varchar(4),
turId int constraint FK_turId foreign key references Turler(turId)
)

insert Turler values 
(1,'Romantik'),
(2,'Macera'),
(3,'Suç'),
(4,'Gerilim'),
(5,'Bilim Kurgu'),
(6,'Dram'),
(7,'Aksiyon')
insert Turler(turId) values
(8),(9),(10),(11),(12)

insert Filmler values
(1,'Ucuz Roman','1994','8.9',1),
(2,'Esaretin Bedeli','1994','9.5',6),
(3,'Kara Þövalye','2008','9.3',7),
(4,'Baba','1972','9.2',6),
(5,'Yüzüklerin Efendisi: Kralýn Dönüþü','2003','8.9',6),
(6,'Ýyi, Kötü ve Çirkin','1966','8.9',7),
(7,'Forrest Gump','1994','8.8',1),
(8,'Prestij','2006','8.8',5),
(9,'Akýl Defteri','2000','8.8',4),
(10,'Köstebek','2006','8.8',3),
(11,'Yeþil Yol','1999','8.8',3)
insert Filmler(filmId,ad,turId) values
(12,'Pi''nin Yaþamý',5),
(13,'Yýldýzlararasý',5),
(14,'Gladyatör',4),
(15,'Geleceðe Dönüþ',3)


use Sirket
go
select sum(maas) from Personeller /*Toplam maaþý veriyor*/

select sum(maas) as ToplamMaas from Personeller /* as ile sütuna isim veriyor */
select ToplamMaas=sum(maas) from Personeller

select Max(maas) EnYuksekMaas from Personeller /* en yüksek maaþý veriyor ve sütun ismini EnYuksekMaas yapýyor */
select Min(maas) EnDusukMaas from Personeller /* en düþük maaþý veriyor ve sütun imsini EnDusukMaas yapýyor */

select Personeller.ad from Personeller /* personeller.ad ile baþka tablolarda ad sütunu var ise karýþýklýðý önlemek için bunu kullanýrýz. */
select p.ad from Personeller p /* ayný iþlemi yapýyor fakat Personeller adýný p olarak kýsaltýyor yani takma ad ekliyor ve bu sayede p diyebiliyoruz personeller yerine*/

/* count() ile içerisindeki veri adedini verir. Fakat null veya not deðerlerini saymaz o yüzden bu özelliði kullanýrken buna dikkat etmeliyiz. */
/* count() as [kayýt sayýsý] sütun ismini  kayýt sayýsý yapar. */

select LOWER(ad) from Personeller /* verileri küçültür */
select UPPER(ad) from Personeller /* verileri büyütür */
select LEN(ad) from Personeller /* verilerin uzunluðunu verir */ 

select AVG(maas) from Personeller /* maaþ ortalamasýný verir */

select CONVERT(varchar(3), Personeller.ad) from Personeller /* sorgu çýktýsýndaki veri tipini deðiþtirir. */
select CAST(Personeller.maas as varchar(3)) as vizeOndalikli from Personeller

select GETDATE() as simdikiZaman
select GETUTCDATE() as dünyaSaati

select DATENAME(MONTH, CURRENT_TIMESTAMP) as Ay
select DATENAME(YEAR, CURRENT_TIMESTAMP) as Yýl
select DATENAME(DAY, CURRENT_TIMESTAMP) as Gün

select DATEDIFF(YEAR, Personeller.girisTarihi, GETDATE()) from Personeller /* personellerin giriþ tarihi ile günümüzün arasýndaki farký veriyor. Year dediðimiz için yýl cinsinden */

select DATENAME(MONTH, Personeller.girisTarihi) from Personeller /* Personellerin giriþ yaptýðý ay ý verir*/

select DATEADD(YY, 3, Personeller.girisTarihi) from	 Personeller /* Personellerin giriþ tarihi yýlýna 3 yýl ekledi. YY, MM, DD */

select bolum, MAX(maas), Count(*) BolumKisiSayisi from Personeller GROUP BY bolum /* bolum grubundaki kiþileri gruplarda kaç kiþi olduðunu verir. */
/* max(maas) dersekde bölümdeki en yüksek maaþý verir */

/* Derslere göre vize(%40) ve final(60%) derslere göre ortalama */

use OgrenciIsleri
go

select * from Notlar

select (Notlar.vize*0.4 + Notlar.final*0.6) ortalamaNot from Notlar  /* parantez içinde iþlem yapabiliriz.*/

select bolum, MAX(maas) as EnYuksekMaas from Personeller GROUP BY bolum having max(maas) > 20000 /* max maaþý verir ama 20000 den büyük olanlarý verir.*/

/* görevlerine göre maaþý 15 bin den büyük olan kiþilerin maaþ ortalamasý da 35 binden büyük olan*/

select * from Personeller

select gorev, AVG(maas) as maasOrt from Personeller WHERE maas > 15000 GROUP BY gorev having avg(maas) > 35000

/* Çoklu tablo çalýþmasý */

use Sirket
go

select * from Personeller
select * from Bolumler

select b.*, p.* from Bolumler b, Personeller p where b.bolumNo=p.bolum
/* inner join versiyonu */
select ... from tabloadi1 inner join tabloadi2 on tabloadi1.alan=tabloadi2.alan


select b.*, p.* from Bolumler b, Personeller p where b.bolumNo=p.bolum and ad like ('%i%')

select b.*, p.* from Bolumler b, Personeller p where b.bolumNo=p.bolum and ad not like ('%i%') order by soyad

select ... from tabloadi1 inner join tabloadi2 on tabloadi1.alan=tabloadi2.alan where ...
/* iki den fazla tabloyu iliþkilendirme */
select ... from tabloadi1 inner join tabloadi2 on tabloadi1.alan=tabloadi2.alan inner join tabloadi3 on tabload1.alan=tabloadi3.alan


select b.*, p.ad, p.gorev, p.maas from Bolumler b inner join Personeller p on b.bolumNo = p.bolum

/*----------*/

use Sinema
go	

select * from Filmler
select * from Turler

select t.ad, f.filmId, f.ad, f.imdbPuan from Filmler f, Turler t where t.turId = f.turId
select t.ad, f.filmId, f.ad, f.imdbPuan from Filmler f inner join Turler t on t.turId = f.turId


/* left join - solda belirtilen tabloyu olduðu gibi getirir saðda belirtilen tablodan sadece eþleþenleri getirir*/
select f.filmId, f.ad, f.imdbPuan, t.ad turAD from Filmler f left join Turler t on f.turId = f.turId

/* right join - saðda belirtilen tabloyu olduðu gibi getirir solda belirtilen tablodan sadece eþleþenleri getirir*/

select f.filmId, f.ad, f.imdbPuan, t.ad turAD from Filmler f right join Turler t on f.turId = f.turId

/* full outer join iki tabloyuda birleþtirir herhangi bir koþul olmadan */

select f.filmId, f.ad, f.imdbPuan, t.ad turAD from Filmler f full outer join Turler t on f.turId = f.imdbPuan
