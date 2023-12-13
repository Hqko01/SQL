Create Database Universite
go
use Universite
go
CREATE TABLE Bireyler
(
id int constraint PK_id primary key identity(1,1),
tcNo varchar(11),
adi varchar(50),
soyadi varchar(50),
anneAdi varchar(50),
babaAdi varchar(50),
cinsiyeti varchar(5),
dogumYeri varchar(50),
dogumTarihi datetime
)
insert into Bireyler values
('12312312312','Can','G�L','Ay�e','Yusuf','Erkek','Elaz��','1988/02/10'),
('12312312312','Zeynep','AKSU','Fatma','Ali','Kad�n','�stanbul','1999/12/25'),
('55312352312','Kaya','SARI','Hayriye','Cihan','Erkek','Samsun','1999/06/12'),
('12312456312','Ali','YALIN','Ay�e','Mehmet','Van','Erkek','2004/07/25'),
('12662312312','Deniz','AR�IN','Neslihan','Cem','Kad�n','�stanbul','2003/12/14'),
('32317731231','�brahim','KAYA','Zeynep','Kaya','Erkek','Ankara','2003/12/18'),
('22345282312','ERKAN','��L','Enver','Kaya','Erkek','Ankara','1987/12/16'),
('72312312369','Narin','TOPRAK','Murat','Can','Kad�n','Samsun','2002/12/29'),
('82312312312','Sinan','BAYRAM','Perihan','Musa','Erkek','Mu�','2000/01/23'),
('52312312543','Nazl�','B�TL�S','Aynur','Yusuf','Kad�n','Samsun','1986/03/29'),
('62312312312','Nazl�','YA�','Aynur','Toprak','Kad�n','Mu�','1986/03/29'),
('82323312569','Raci','KU�','Ela','Sedat','Erkek','�stanbul','1986/03/19'),
('72310312312','Tuana','KURAK','Aynur','Sedat','Kad�n','Mardin','1980/05/29'),
('22300312318','Selim','KU�','Derya','Burak','Erkek','Mu�','1999/07/11'),
('12312022002','Belinay','KURAK','Aynur','�nder','Kad�n','Samsun','1996/03/12')
insert into Bireyler (tcNo,adi,soyadi,anneAdi,babaAdi,dogumYeri,dogumTarihi) values
('42318912318','Yusuf','KAYA','Aynur','Sedat','Ankara','1988/09/06'),
('62314512372','Can','SAYGI','Nesrin','Selim','Mersin','1987/07/07'),
('52312136231','Elif','YAZ','Selin','Sedat','Antalya','1986/03/29'),
('77312136285','Z�lal','KAR','Sinem','Sedat','Mersin','1980/05/15')
INSERT INTO Bireyler(tcNo,adi,soyadi,anneAdi,babaAdi,cinsiyeti)
VALUES
('12332112332','Ali','Demir','�zge','Emre','Erkek')

go
use Universite
go
CREATE TABLE Fakulteler(
fakulteId int constraint PK_fakulteId primary key identity(1,1),
ad varchar(50)
)
insert into Fakulteler values
('M�hendislik Fak�ltesi'),
('Di��ilik Fak�ltesi'),
('T�p Fak�ltesi'),
('A��k��retim Fak�ltesi'),
('Mimarl�k ve Tasar�m Fak�ltesi'),
('�ktisadi ve �dari Bilimler Fak�ltesi'),
('G�zel Sanatlar Fak�ltesi'),
('Meslek Y�ksekokulu Fak�ltesi'),
('Eczac�l�k Fak�ltesi'),
('Fen Fak�ltesi')


go
use Universite
go
CREATE TABLE Birimler(
id int constraint PK_idBirimler primary key identity(1,1),
fakulteId int constraint FK_fakulteId foreign key references Fakulteler(fakulteId),
ad varchar(50)
)
insert into Birimler values
(6,'Y�netim Bili�im Sistemleri'),
(6,'Ekonometri'),
(6,'Kamu Y�netimi'),
(10,'Fizik'),
(10,'Kimya'),
(10,'Biyoloji'),
(3,'T�p'),
(2,'Di�'),
(8,'Bili�im'),
(8,'Sa�l�k Meslek'),
(1,'Bilgisayar M�hendisli�i'),
(1,'End�stri M�hendisli�i')


go
use Universite
go
CREATE TABLE Dersler(
id int constraint PK_dersId primary key identity(1,1), 
birimId int constraint FK_birimId foreign key references Birimler(id), 
kod varchar(10),
adi varchar(100),
kredi int
)
insert into Dersler values
(7,'TIP100', 'Anatomi',5),
(7,'TIP101', 'Biyokimya',6),
(8,'DIS101', 'Doku',4),
(8,'DIS102', 'Metabolizma',5),
(11,'BIL200', 'Veri Taban�',6),
(11,'BIL201', 'Nesneye Y�nelim',6),
(11,'BIL202', 'Siber G�venlik',2),
(11,'BIL203', '��letim Sistemleri',3),
(6,'BIO203', 'Biyoloji ��rencileri ��in Kimyai',3),
(6,'BIO204', 'H�cre Biyolojisi',3),
(6,'BIO204', 'H�cre Biyolojisi Laboratuvar�',3),
(6,'BIO204', 'Genetik',9)

go
use Universite
go
CREATE TABLE OgretmenDers(
id int constraint PK_OgretmenDersId primary key identity(1,1), 
bireyId int constraint FK_bireyIdOgretmenDers foreign key references Bireyler(id), 
dersId int constraint FK_dersIdOgretmenDers foreign key references Dersler(id)
)

select * from Bireyler
insert into OgretmenDers values
(5,12),(5,11),(5,10),(4,9),(4,8),(4,7),(4,6),
(3,1),(3,2),(2,3),(2,4),(6,2),(6,1),(6,3)
go
use Universite
go
CREATE TABLE OgrenciDers(
id int constraint PK_OgrenciDersId primary key identity(1,1), 
bireyId int constraint FK_bireyIdOgrenciDers foreign key references Bireyler(id), 
dersId int constraint FK_dersIdOgrenciDers foreign key references Dersler(id),
harfNotu varchar(2)
)
insert into OgrenciDers values
(11,12,'AA') ,(12,12,'BB'),(13,8,'BC'),(14,2,'FF')
go
use Universite
go
CREATE TABLE OgrenciBolum(
id int constraint PK_idOgrenciBolum primary key identity(1,1), 
bireyId int constraint FK_bireyIdOgrenciBolum foreign key references Bireyler(id),
birimId int constraint FK_birimIdOgrenciBolum foreign key references Birimler(id), 
ogrenciNo int,
kayitTarihi datetime,
ogretimYili varchar(10)
)
insert into OgrenciBolum values
(11,3,123658,'2022/09/14','2022-2023'),
(12,3,696891,'2023/09/12','2023-2024'),
(13,3,126984,'2023/09/15','2023-2024'),
(14,3,365984,'2023/09/16','2023-2024')
go
use Universite
go
CREATE TABLE Iletisim(
iletisimId int constraint PK_idIletisim primary key identity(1,1), 
bireyId int constraint FK_bireyIdIletisim foreign key references Bireyler (id),
birimId int constraint FK_birimIdIletisim foreign key references Birimler(id), 
iletisimTipi varchar(20),
ulkeKodu varchar(5),
Numara varchar(10)
)
insert into Iletisim values
(11,3,'GSM','90','5371112211'),
(10,3,'GSM','90','5371112244'),
(5,3,'GSM','90','5371112255'),
(6,3,'GSM','90','5372222266'),
(7,3,'GSM','90','5373332263')
go
use Universite
go

CREATE TABLE Sinavlar(
id int constraint PK_idSinav primary key identity(1,1), 
dersId int constraint FK_sinavDersId foreign key references Dersler(id), 
tarihSaat datetime
)
insert into Sinavlar values
(3,'2023/12/01 13:00:00'),
(2,'2023/12/02 13:00:00'),
(5,'2023/12/03 13:00:00'),
(6,'2023/12/03 15:00:00'),
(1,'2023/12/04 13:00:00')
use Universite
go
CREATE TABLE SinavOgrenci(
Id int constraint PK_idSinavOgrenci primary key identity(1,1), 
sinavId int constraint FK_sinavIdSinavOgrenci foreign key references Sinavlar(id), 
dersId int constraint FK_sinavOgrenciDersId foreign key references Dersler(id), 
ogrenciId int constraint FK_OgrenciBolumId foreign key references OgrenciBolum(id), 
vize int constraint CK_vize check(vize>=0 and vize<=100),
final int constraint CK_final check(final>=0 and final<=100)
)
insert into SinavOgrenci values
(3,1,1,10,40),
(2,6,3,56,60),
(4,3,4,50,60),
(1,1,1,78,80),
(1,4,5,50,70),
(5,1,6,50,85),
(3,2,6,50,60)
go
use Universite
go

CREATE TABLE AkademikYil
(
ID INT IDENTITY(1,1),
BaslangicYili INT NOT NULL,
BitisYili AS BaslangicYili + 1,
AkademikYilAdi AS CAST(BaslangicYili AS VARCHAR(4))
+ ' - '
+ CAST(BaslangicYili + 1 AS VARCHAR(4))
+ ' Akademik Y�l�',
BaslangicTarihi DATE NULL,
BitisTarihi DATE NULL
)

INSERT INTO AkademikYil
(
BaslangicYili,
BaslangicTarihi,
BitisTarihi
)
SELECT
2023,
'2023-09-23',
'2024-09-21'

select * from AkademikYil

CREATE TABLE Kullanici
(
id INT IDENTITY(1,1),
bireyId INT,
kullaniciAdi VARCHAR(50),
sifre VARCHAR(50)
)
INSERT INTO Kullanici
SELECT
id,
tcNo,
adi + '.' + soyadi
FROM Bireyler
SELECT * FROM Kullanici





SELECT TOP 10 
*
FROM
Bireyler
ORDER BY
id
INSERT INTO OgrenciBolum
(bireyID,
birimID,
ogrenciNo,
kayitTarihi,
ogretimYili)
VALUES
(20, -- Ali Demir'in Birey_ID�si
5, -- Kamu Y�netimi'nin Birim_ID�si
'130303555', -- ��renci No
'2023/09/08', -- Kay�t Tarihi
1)

INSERT INTO Bireyler
SELECT
'47852147852',
'Yusuf',
'Yerli',
'Emine',
'Mehmet',
'Erkek',
'�stanbul',
'2000/08/14'
UNION ALL
SELECT
'12365478963',
'Yeliz',
'Yerli',
'Emine',
'Mehmet',
'Kad�n',
'Ankara',
'1999/01/14'

INSERT INTO OgrenciBolum
(
bireyId,
birimId,
ogrenciNo,
kayitTarihi,
ogretimYili
)
SELECT
20, -- Ali Demir'in Birey_IDsi
5, -- Kamu Y�netimi'nin Birim_ID�si
'130303555', -- ��renci No
NULL, -- Kay�t Tarihi
'2023-2024'

select * from OgrenciBolum


CREATE TABLE KullaniciYedek
(
id INT,
bireyId INT,
kullaniciAdi VARCHAR(50),
sifre VARCHAR(50)
)
INSERT INTO KullaniciYedek
SELECT
*
FROM
Kullanici



SELECT
*
INTO
KullaniciYedek1
FROM
Kullanici


/* �rnek veri taban�ndaki bireyler tablosundaki ilk 10 kayd�na bakal�m */
use Universite
go
SELECT TOP 10 * FROM Bireyler ORDER BY id

/*----------------------*/

INSERT INTO Bireyler (tcNo, adi, soyadi, anneAdi, babaAdi) VALUES('1221221', 'Hakan', 'Y�lmaz', 'sAAAOO', 'BAOOOOO')

/*----------------------*/

INSERT INTO OgrenciBolum (bireyId, birimId, ogrenciNo, kayitTarihi, ogretimYili) SELECT 20, 5, '130303555', '2023/09/08', '2023-2024'

SElECT * FROM OgrenciBolum

/*----------------------*/

INSERT INTO Bireyler
SELECT
'111',
'hakan',
'naber',
'eminem',
'memo',
'eko',
'isto',
'2000/33/22'
UNION ALL
SELECT 
'12121',
'yeliz',
'naber',
'yerli mal�',
'haftas�',
'memoli'
'kado',
'99/12/22'

/*----------------------*/

CREATE TABLE Akademik (
akademikNO int constraint PK_akademikNO primary key not null identity(10,2),
baslangicYili int,
bitisYili as baslangicYili+1,
akademikYil as CAST(baslangicYili as varchar(4)) + '-' + CAST(baslangicYili+1 as varchar(4)) + 'E�itim ��retim Y�l�'
)

insert into Akademik(baslangicYili) select '2024' union all select '2025'

select * from Akademik

/*----------------------*/

CREATE TABLE Kullanicilar (
id int identity(1,1),
brID int,
kullaniciAdi VARCHAR(20),
sifre varchar(100)
)

/*Bireyler tablosundan buraya �ifre olu�tur*/

SELECT * FROM Bireyler

insert into Kullanicilar (brID, kullaniciAdi, sifre)
select id, tcNo, adi+'.'+soyadi from Bireyler

select * from Kullanicilar

/*----------------------*/

select id, brID, kullaniciadi, sifre INTO kullanicilarYedek FROM Kullanicilar

select * from kullanicilarYedek


-- identity olarak tan�mlanan bir s�tun da veri ekleme yapmak i�in "set identity_insert tabloADI on" a��yoruz ekliyoruz ve daha sonras�nda otomatik art�k ger�ekle�mesi i�in bunu tekrar dan kapat�yoruz "set indetity_insert off"
-- diyelim ki set identity_insert tabloadi on diyip bir veri ekledim eklemeden �nceki son veri 4 ken ekledi�im veri 50 tekrar kapat�p otomatik atama devam etti�inde 50 den devam ediyor bunu d�zeltmek i�in yani tekrardan 4 den eklemeye devam etmesi i�in "dbcc checkident (tabloadi, reseed, 4)"

-----------------------------------------

select * from Kullanicilar

-- update Kullanicilar set kullaniciAdi = 'Hakan' - E�er bu kodu �al��t�r�rsam kullaniciAdi na kay�tl� t�m veriler Hakan olarak de�i�ir
-- Bu sebepten �t�r� where ile ko�ul vermeliyiz.

select * from Bireyler

update Bireyler set adi = 'Erkan' where id = 7

---------------------------------

ALTER TABLE Bireyler ADD AdSoyad varchar(50)

update Bireyler set AdSoyad = adi + '-' + soyadi

---------------------------------

ALTER TABLE Bireyler ADD OgrenciNo int

select * from Bireyler
select * from OgrenciBolum

UPDATE Bireyler set OgrenciNo = OgrenciBolum.ogrenciNo
FROM Bireyler inner join OgrenciBolum on Bireyler.id = OgrenciBolum.bireyId
