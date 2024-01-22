
create database genelUygulama
go
use genelUygulama
go
Create table Gorevler
(
gorev int primary key identity(1,1),
ad varchar(50)
)

Create table Egitimler
(
Id int primary key identity(1,1),
egitimAdi varchar(50)
)

Create table Personeller
(
personelId int primary key identity(1,1),
ad varchar(50),
soyad varchar(50),
gorev int foreign key references Gorevler(gorev),
maas money,
yas int,
girisYili datetime,
egitimDerecesi int foreign key references Egitimler(Id)
)

insert Gorevler values 
('Genel M�d�r'),
('M�d�r'),
('�ef'),
('Finans'),
('Sat�� Uzman�'),
('A���'),
('Temizlik G�revlisi')


insert Egitimler values 
('Doktora'),
('Y�ksek Lisans'),
('Lisans'),
('�nlisans'),
('Lise'),
('Ortaokul'),
('�lkokul')

insert Personeller values 
('Ay�e','KAYA',1,70000,45,'1998/01/01',1),
('Kas�m','DORUK',2,50000,52,'1998/03/01',2),
('Fatih','AKSU',2,45500,44,'1999/01/01',3),
('Elif','SA�',3,43000,36,'2003/01/01',3),
('Y�cel','DEM�R',1,50000,37,'2023/01/01',1),
('R��t�','BAK',6,25000,44,'2023/01/01',5),
('Metin','K���',6,20000,25,'2024/01/01',5),
('Kemal','TOK',7,11500,42,'2000/06/21',6),
('Derya','YALI',7,11500,32,'2000/06/11',7),
('Zeynep','SAY',5,25000,29,'2018/12/10',4),
('Can','DEM�R',4,32000,30,'2019/08/10',4),
('�a�r�','PALAZ',4,35000,32,'2018/11/25',2)

insert Personeller (ad,soyad,gorev,maas,yas,egitimDerecesi) values 
('�i�dem','KARA',4,35000,33,2),
('Salih','YARALI',7,12000,31,6)

insert Personeller (ad,soyad,gorev,maas,yas,girisYili) values 
('Ali','SARA',7,35000,52,'2000/07/25'),
('Fatma','AKKAYA',7,12000,55,'1999/02/20')



--UYGULAMA-2: Personeller tablosundaki b�t�n kay�tlar� listeleyiniz.

select * from Personeller

select * from Egitimler

--UYGULAMA-3: Personeller tablosundaki b�t�n kay�tlar�n, Personeller ad soyad alanlar�n� listeleyiniz.

select ad, soyad from Personeller

--UYGULAMA-4: Personeller tablosundaki b�t�n kay�tlar�n personelId, Personeller ad soyad  ve ya��, y�ll�k maa�lar�n� listeleyiniz. Y�ll�k maa� hesaplanan s�tuna yeni bir isim (�YILLIKMAAS�) veriniz.

select personelId, ad, soyad, yas, (maas * 12) as YILLIKMAAS FROM Personeller

--UYGULAMA-5: Personeller tablosundaki b�t�n kay�tlar�n PersonellerID, ad ve soyad alanlar�n� listeleyiniz. Fakat, ad ve soyad alanlar�n� aralar�nda bir bo�luk olmak �zere beraber listeleyiniz.

select (ad + ' ' + soyad) as adSoyad, personelId from Personeller

--UYGULAMA-6: Personeller tablosundaki b�t�n kay�tlar�n personelId, Personeller ad soyad  alanlar�n� ve hangi e�itimleri ald���n� listeleyiniz. 

select personelId, ad ,soyad , Egitimler.egitimAdi from Personeller inner join Egitimler on egitimDerecesi = Id

--UYGULAMA-7: Personeller tablosundaki b�t�n kay�tlar�n ad soyad ve g�revlerini listeleyiniz. Fakat g�rev numaras�ndan sonra da �numaral� g�revde �al���yor� ibaresini ekleyiniz.

select ad, soyad, CONVERT(varchar, gorev) + ' numaral� g�revde �al���yor' as gorev from Personeller

--UYGULAMA-8: Personeller tablosundaki b�t�n kay�tlar�n g�rev numaras� alan�n� listeleyiniz.

select gorev from Personeller

--UYGULAMA-9: Yukar�daki UYGULAMA-8 de g�r�lece�i gibi baz� g�rev numaralar� birden fazla geldi. Bunun sebebi, ayn� g�revde �al��an birden fazla insan olmas�d�r. E�er her g�rev numaras�ndan bir tane gelmesini isteseydik; soru ve cevap ne �ekilde olacakt�:
--Personeller tablosundaki b�t�n kay�tlar�n g�rev numaras� alan�n� listeleyiniz fakat her departman numaras�ndan bir tane (tekil, unique) olsun.

select DISTINCT(gorev) from Personeller

--UYGULAMA-10: Personeller tablosundaki b�t�n kay�tlar�n ad soyad ve maas alanlar�n�, maas alan� b�y�kten k����e do�ru s�ral� olmak �zere listeleyiniz.

select ad ,soyad ,maas from Personeller order by maas desc

--UYGULAMA-11: Personeller tablosundaki b�t�n kay�tlar�n personelId, Personeller ad soyad alanlar�n�, personelId alan� b�y�kten k����e do�ru s�ral� olmak �zere listeleyiniz.

select personelId, ad, soyad from Personeller order by personelId desc

--UYGULAMA-12: Personeller tablosundaki g�revi ��ef� olan b�t�n kay�tlar�n ad soyad ve gorev alanlar�n� listeleyiniz.

select Personeller.ad, soyad, Personeller.gorev from Personeller where gorev = (select  gorev from Gorevler where ad = '�ef')

--UYGULAMA-13: 4 numaral� departmanda �al��an Personellerin g�rev, ad soyad alanlar�n� listeleyiniz ve kay�tlar� ad alan�na g�re k���kten b�y��e do�ru s�ralay�n�z.

select gorev, ad, soyad from Personeller where gorev = 4 order by ad asc

--UYGULAMA-14: 1 ve 2 numaral� departmanlarda �al��an Personellerin g�rev, ad soyad alanlar�n� listeleyiniz ve kay�tlar� g�rev ve ad alanlar�na g�re k���kten b�y��e do�ru s�ralay�n�z.

select gorev, ad ,soyad from Personeller where gorev in (1,2) order by gorev asc, ad asc

--UYGULAMA-15: Personeller tablosundaki g�revi ��ef� ve �Sat�� Uzman�� olan b�t�n kay�tlar�n ad soyad ve g�rev alanlar�n� listeleyiniz ve kay�tlar� g�rev ve ad alanlar�na g�re k���kten b�y��e do�ru s�ralay�n�z.

select ad, soyad, gorev from Personeller where gorev in(select gorev from Gorevler where ad in ('�ef', 'Sat�� Uzman�')) order by gorev asc, ad asc

--UYGULAMA-16: Maa�� 20000 liradan fazla olan Personellerin ad soyad, ya� ve maas alanlar�n� listeleyiniz ve kay�tlar� maas alan�na g�re k���kten b�y��e do�ru s�ralay�n�z.

select ad, soyad, maas from Personeller where maas > 20000

--Yine, sorudaki 20000 den b�y�k c�mlesi, maa�� 20000 ile 30000 aras�nda olanlar �eklinde de�i�tirilirse, SQL ve sorgu sonucu d�nen kay�tlar ne �ekilde olur:

select ad, soyad, maas from Personeller where maas between 20000 and 30000

--UYGULAMA-17: Personeller kay�tlar�ndan giri� y�l� alan� bo� olan kay�tlar�n PersonellerID, Personeller ad soyad ve g�rev alanlar�n� listeleyiniz.

select personelId, ad ,soyad ,gorev from Personeller where girisYili is null

--UYGULAMA-18: Personeller kay�tlar�ndan giri� y�l� alan� bo� olmayan kay�tlar�n PersonellerID, Personeller ad soyad, e�itim ve g�rev alanlar�n� listeleyiniz.

select personelId, ad ,soyad ,gorev from Personeller where girisYili is not null

--UYGULAMA-19: Personeller kay�tlar�ndan ad� �A-B-C-�-D� ile ba�layan kay�tlar�n PersonellerID, Personeller ad soyad alanlar�n� listeleyiniz.

select personelId, ad ,soyad from Personeller where ad like '[A-D]%'

--UYGULAMA-20: Personeller kay�tlar�ndan maa�� 30000 ile 50000 aras�nda olan ve g�revi ��ef� olan kay�tlar�n ad soyad, maas ve gorev alanlar�n� listeleyiniz ve kay�tlar� ad ve soyad alanlar�na g�re s�ralay�n�z.

select ad, soyad, maas, gorev from Personeller where maas between 30000 and 50000 and gorev = (select Gorevler.gorev from Gorevler where Gorevler.ad = '�ef') order by ad, soyad

--UYGULAMA-21: Personeller kay�tlar�ndan maa�� 15000 ile 25000 aras�nda olan veya g�revi ��ef� olan kay�tlar�n ad, soyad, maas ve gorev alanlar�n� listeleyiniz ve kay�tlar� ad ve soyad alanlar�na g�re s�ralay�n�z.

select ad, soyad, maas, gorev from Personeller where maas between 15000 and 25000 and gorev = (select Gorevler.gorev from Gorevler where Gorevler.ad = '�ef') order by ad, soyad

--UYGULAMA-22: Personeller tablosundaki b�t�n kay�tlar�n ad ve gorev alanlar�n� ve g�revi �SATI� UZMANI� olanlar �M�D�R� olanlar ,��ef� olanlar� listeleyiniz.

select ad, soyad, maas, gorev from Personeller where gorev in (select Gorevler.gorev from Gorevler where Gorevler.ad in ('�ef','M�d�r', 'Sat�� Uzman�'))

--UYGULAMA-23: Personeller tablosundaki b�t�n kay�tlar�n ortalama maa� ve ortalama ya�lar�n� hesaplay�n�z.

select AVG(maas) as ortalamaMaas, AVG(yas) as ortalamaYas from Personeller

--UYGULAMA-24: Personeller tablosundaki kay�t say�s�n� hesaplay�n�z.

select COUNT(*) from Personeller

--UYGULAMA-25: Personeller tablosundaki her g�rev grubunun ortalama maa��n� hesaplay�n�z ve g�rev kay�tlar�n� b�y�kten k����e do�ru s�ralay�n�z.

select gorev, AVG(maas) ortMaas from Personeller group by gorev order by gorev desc

--UYGULAMA-26: Personeller tablosundaki en y�ksek maa�� g�steriniz.

select max(maas) as maksimumMaas from Personeller

--UYGULAMA-27: Her g�revdeki en y�ksek maa�lar� listeleyiniz.

select gorev, max(maas) from Personeller group by gorev

--UYGULAMA-28: Ortalama maa�� 20000�den b�y�k olan g�revlerini listeleyiniz.

select gorev, avg(maas) from Personeller group by gorev having avg(maas) > 20000

--UYGULAMA-29: B�t�n Personellerin ad soyad ve g�rev ad� bilgilerini listeleyiniz.

select p.ad, p.soyad, g.ad from Personeller p, Gorevler g

--UYGULAMA-30:  B�t�n Personellerin PersonellerID, Personeller ad soyad  ve g�rev ad� bilgilerini listeleyiniz ve her alan�n ba��na ilgili tablonun ismini takma isimle yaz�n�z.

select p.ad as PersonelAd�, p.soyad as PersonelSoyad�, g.ad as GorevAd� from Personeller p, Gorevler g

--UYGULAMA-31:  Her g�rev ad�ndaki ortalama maa�lar� �Genel M�d�r� hari� olmak �zere listeleyiniz ve kay�tlar� en y�ksek ortalamadan en d���k ortalamaya do�ru s�ralay�n�z.

select gorev, avg(maas) from Personeller group by gorev having gorev not in(select gorev from Gorevler where ad = 'Genel M�d�r') order by avg(maas) desc

--UYGULAMA-32: B�t�n Personellerin ad soyad , g�rev adlar�n� ve ald�klar� e�itim adlar�n� alanlar�n� listeleyiniz.

select p.ad, p.soyad, g.ad, e.egitimAdi from Personeller p 
inner join Gorevler g on  g.gorev = p.gorev 
inner join Egitimler e on p.egitimDerecesi = e.Id

--UYGULAMA-33: Maa�� en fazla olan Personellerin personelId, Personeller ad soyad  ve maa� alanlar�n� listeleyiniz.

select personelId, ad, soyad, maas from Personeller where maas = (select max(maas) from Personeller)

--UYGULAMA-34: Her g�revde en az maa� alan Personellerin PersonellerID, Personeller ad soyad  ve maas alanlar�n� listeleyiniz.

select personelId, ad, soyad, maas from Personeller where maas in (select MIN(maas) from Personeller group by gorev)

--UYGULAMA-35: Ya�� en k���k olan Personellerin PersonellerID, Personeller ad soyad  ve ya� alanlar�n� listeleyiniz.

select personelId, ad, soyad, yas from Personeller where yas in (select MIN(yas) from Personeller)

--UYGULAMA-36: Hi� e�itim alamayan Personelleri listeleyiniz.

select * from Personeller where egitimDerecesi is null

--UYGULAMA-37: Her g�revde �al��an toplam Personeller say�s�n� veren sql komutlar�n� yaz�n�z.

select gorev, COUNT(*) from Personeller group by gorev

--UYGULAMA-38: Ya�� 40�dan b�y�k olan Personellerleri listeleyiniz.

select * from Personeller where yas > 40

--UYGULAMA-39: Ya�� 40�dan b�y�k olan Personellerlerin maa��na %10 zam yap�n�z.

update Personeller set maas = maas * 1.10 where yas > 40
select * from Personeller

--UYGULAMA-40: Her g�revde en �ok maa� alan herhangi bir personelden daha �ok maa� alan personellerin PersonellerID, Personeller ad soyad, g�rev adlar�n�  ve maas alanlar�n� listeleyiniz.

SELECT g.ad, personelId, p.ad, soyad, maas FROM Personeller p inner join Gorevler g on g.gorev=p.gorev WHERE maas >any (SELECT Max(maas) FROM Personeller GROUP BY gorev)

--UYGULAMA-41: Her g�revdeki maa�lar�n hepsinden daha az ama ortalamas� 25000'den b�y�k olan personellerin g�rev e�itimlerini de adlar� ile g�rebilece�imiz sorguyu yaz�n�z.

SELECT personelId, p.ad, soyad, maas,g.ad, e.egitimAdi FROM Personeller p inner join Gorevler g on g.gorev=p.gorev inner join Egitimler e on e.Id=p.egitimDerecesi where maas < all (SELECT avg(maas) FROM Personeller GROUP BY gorev having avg(maas)>25000)

