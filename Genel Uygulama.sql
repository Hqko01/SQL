
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
('Genel Müdür'),
('Müdür'),
('Þef'),
('Finans'),
('Satýþ Uzmaný'),
('Aþçý'),
('Temizlik Görevlisi')


insert Egitimler values 
('Doktora'),
('Yüksek Lisans'),
('Lisans'),
('Önlisans'),
('Lise'),
('Ortaokul'),
('Ýlkokul')

insert Personeller values 
('Ayþe','KAYA',1,70000,45,'1998/01/01',1),
('Kasým','DORUK',2,50000,52,'1998/03/01',2),
('Fatih','AKSU',2,45500,44,'1999/01/01',3),
('Elif','SAÐ',3,43000,36,'2003/01/01',3),
('Yücel','DEMÝR',1,50000,37,'2023/01/01',1),
('Rüþtü','BAK',6,25000,44,'2023/01/01',5),
('Metin','KÝÞÝ',6,20000,25,'2024/01/01',5),
('Kemal','TOK',7,11500,42,'2000/06/21',6),
('Derya','YALI',7,11500,32,'2000/06/11',7),
('Zeynep','SAY',5,25000,29,'2018/12/10',4),
('Can','DEMÝR',4,32000,30,'2019/08/10',4),
('Çaðrý','PALAZ',4,35000,32,'2018/11/25',2)

insert Personeller (ad,soyad,gorev,maas,yas,egitimDerecesi) values 
('Çiðdem','KARA',4,35000,33,2),
('Salih','YARALI',7,12000,31,6)

insert Personeller (ad,soyad,gorev,maas,yas,girisYili) values 
('Ali','SARA',7,35000,52,'2000/07/25'),
('Fatma','AKKAYA',7,12000,55,'1999/02/20')



--UYGULAMA-2: Personeller tablosundaki bütün kayýtlarý listeleyiniz.

select * from Personeller

select * from Egitimler

--UYGULAMA-3: Personeller tablosundaki bütün kayýtlarýn, Personeller ad soyad alanlarýný listeleyiniz.

select ad, soyad from Personeller

--UYGULAMA-4: Personeller tablosundaki bütün kayýtlarýn personelId, Personeller ad soyad  ve yaþý, yýllýk maaþlarýný listeleyiniz. Yýllýk maaþ hesaplanan sütuna yeni bir isim (“YILLIKMAAS”) veriniz.

select personelId, ad, soyad, yas, (maas * 12) as YILLIKMAAS FROM Personeller

--UYGULAMA-5: Personeller tablosundaki bütün kayýtlarýn PersonellerID, ad ve soyad alanlarýný listeleyiniz. Fakat, ad ve soyad alanlarýný aralarýnda bir boþluk olmak üzere beraber listeleyiniz.

select (ad + ' ' + soyad) as adSoyad, personelId from Personeller

--UYGULAMA-6: Personeller tablosundaki bütün kayýtlarýn personelId, Personeller ad soyad  alanlarýný ve hangi eðitimleri aldýðýný listeleyiniz. 

select personelId, ad ,soyad , Egitimler.egitimAdi from Personeller inner join Egitimler on egitimDerecesi = Id

--UYGULAMA-7: Personeller tablosundaki bütün kayýtlarýn ad soyad ve görevlerini listeleyiniz. Fakat görev numarasýndan sonra da “numaralý görevde çalýþýyor” ibaresini ekleyiniz.

select ad, soyad, CONVERT(varchar, gorev) + ' numaralý görevde çalýþýyor' as gorev from Personeller

--UYGULAMA-8: Personeller tablosundaki bütün kayýtlarýn görev numarasý alanýný listeleyiniz.

select gorev from Personeller

--UYGULAMA-9: Yukarýdaki UYGULAMA-8 de görüleceði gibi bazý görev numaralarý birden fazla geldi. Bunun sebebi, ayný görevde çalýþan birden fazla insan olmasýdýr. Eðer her görev numarasýndan bir tane gelmesini isteseydik; soru ve cevap ne þekilde olacaktý:
--Personeller tablosundaki bütün kayýtlarýn görev numarasý alanýný listeleyiniz fakat her departman numarasýndan bir tane (tekil, unique) olsun.

select DISTINCT(gorev) from Personeller

--UYGULAMA-10: Personeller tablosundaki bütün kayýtlarýn ad soyad ve maas alanlarýný, maas alaný büyükten küçüðe doðru sýralý olmak üzere listeleyiniz.

select ad ,soyad ,maas from Personeller order by maas desc

--UYGULAMA-11: Personeller tablosundaki bütün kayýtlarýn personelId, Personeller ad soyad alanlarýný, personelId alaný büyükten küçüðe doðru sýralý olmak üzere listeleyiniz.

select personelId, ad, soyad from Personeller order by personelId desc

--UYGULAMA-12: Personeller tablosundaki görevi “Þef” olan bütün kayýtlarýn ad soyad ve gorev alanlarýný listeleyiniz.

select Personeller.ad, soyad, Personeller.gorev from Personeller where gorev = (select  gorev from Gorevler where ad = 'Þef')

--UYGULAMA-13: 4 numaralý departmanda çalýþan Personellerin görev, ad soyad alanlarýný listeleyiniz ve kayýtlarý ad alanýna göre küçükten büyüðe doðru sýralayýnýz.

select gorev, ad, soyad from Personeller where gorev = 4 order by ad asc

--UYGULAMA-14: 1 ve 2 numaralý departmanlarda çalýþan Personellerin görev, ad soyad alanlarýný listeleyiniz ve kayýtlarý görev ve ad alanlarýna göre küçükten büyüðe doðru sýralayýnýz.

select gorev, ad ,soyad from Personeller where gorev in (1,2) order by gorev asc, ad asc

--UYGULAMA-15: Personeller tablosundaki görevi “Þef” ve “Satýþ Uzmaný” olan bütün kayýtlarýn ad soyad ve görev alanlarýný listeleyiniz ve kayýtlarý görev ve ad alanlarýna göre küçükten büyüðe doðru sýralayýnýz.

select ad, soyad, gorev from Personeller where gorev in(select gorev from Gorevler where ad in ('Þef', 'Satýþ Uzmaný')) order by gorev asc, ad asc

--UYGULAMA-16: Maaþý 20000 liradan fazla olan Personellerin ad soyad, yaþ ve maas alanlarýný listeleyiniz ve kayýtlarý maas alanýna göre küçükten büyüðe doðru sýralayýnýz.

select ad, soyad, maas from Personeller where maas > 20000

--Yine, sorudaki 20000 den büyük cümlesi, maaþý 20000 ile 30000 arasýnda olanlar þeklinde deðiþtirilirse, SQL ve sorgu sonucu dönen kayýtlar ne þekilde olur:

select ad, soyad, maas from Personeller where maas between 20000 and 30000

--UYGULAMA-17: Personeller kayýtlarýndan giriþ yýlý alaný boþ olan kayýtlarýn PersonellerID, Personeller ad soyad ve görev alanlarýný listeleyiniz.

select personelId, ad ,soyad ,gorev from Personeller where girisYili is null

--UYGULAMA-18: Personeller kayýtlarýndan giriþ yýlý alaný boþ olmayan kayýtlarýn PersonellerID, Personeller ad soyad, eðitim ve görev alanlarýný listeleyiniz.

select personelId, ad ,soyad ,gorev from Personeller where girisYili is not null

--UYGULAMA-19: Personeller kayýtlarýndan adý “A-B-C-Ç-D” ile baþlayan kayýtlarýn PersonellerID, Personeller ad soyad alanlarýný listeleyiniz.

select personelId, ad ,soyad from Personeller where ad like '[A-D]%'

--UYGULAMA-20: Personeller kayýtlarýndan maaþý 30000 ile 50000 arasýnda olan ve görevi “Þef” olan kayýtlarýn ad soyad, maas ve gorev alanlarýný listeleyiniz ve kayýtlarý ad ve soyad alanlarýna göre sýralayýnýz.

select ad, soyad, maas, gorev from Personeller where maas between 30000 and 50000 and gorev = (select Gorevler.gorev from Gorevler where Gorevler.ad = 'Þef') order by ad, soyad

--UYGULAMA-21: Personeller kayýtlarýndan maaþý 15000 ile 25000 arasýnda olan veya görevi “Þef” olan kayýtlarýn ad, soyad, maas ve gorev alanlarýný listeleyiniz ve kayýtlarý ad ve soyad alanlarýna göre sýralayýnýz.

select ad, soyad, maas, gorev from Personeller where maas between 15000 and 25000 and gorev = (select Gorevler.gorev from Gorevler where Gorevler.ad = 'Þef') order by ad, soyad

--UYGULAMA-22: Personeller tablosundaki bütün kayýtlarýn ad ve gorev alanlarýný ve görevi “SATIÞ UZMANI” olanlar “MÜDÜR” olanlar ,“Þef” olanlarý listeleyiniz.

select ad, soyad, maas, gorev from Personeller where gorev in (select Gorevler.gorev from Gorevler where Gorevler.ad in ('Þef','Müdür', 'Satýþ Uzmaný'))

--UYGULAMA-23: Personeller tablosundaki bütün kayýtlarýn ortalama maaþ ve ortalama yaþlarýný hesaplayýnýz.

select AVG(maas) as ortalamaMaas, AVG(yas) as ortalamaYas from Personeller

--UYGULAMA-24: Personeller tablosundaki kayýt sayýsýný hesaplayýnýz.

select COUNT(*) from Personeller

--UYGULAMA-25: Personeller tablosundaki her görev grubunun ortalama maaþýný hesaplayýnýz ve görev kayýtlarýný büyükten küçüðe doðru sýralayýnýz.

select gorev, AVG(maas) ortMaas from Personeller group by gorev order by gorev desc

--UYGULAMA-26: Personeller tablosundaki en yüksek maaþý gösteriniz.

select max(maas) as maksimumMaas from Personeller

--UYGULAMA-27: Her görevdeki en yüksek maaþlarý listeleyiniz.

select gorev, max(maas) from Personeller group by gorev

--UYGULAMA-28: Ortalama maaþý 20000’den büyük olan görevlerini listeleyiniz.

select gorev, avg(maas) from Personeller group by gorev having avg(maas) > 20000

--UYGULAMA-29: Bütün Personellerin ad soyad ve görev adý bilgilerini listeleyiniz.

select p.ad, p.soyad, g.ad from Personeller p, Gorevler g

--UYGULAMA-30:  Bütün Personellerin PersonellerID, Personeller ad soyad  ve görev adý bilgilerini listeleyiniz ve her alanýn baþýna ilgili tablonun ismini takma isimle yazýnýz.

select p.ad as PersonelAdý, p.soyad as PersonelSoyadý, g.ad as GorevAdý from Personeller p, Gorevler g

--UYGULAMA-31:  Her görev adýndaki ortalama maaþlarý “Genel Müdür” hariç olmak üzere listeleyiniz ve kayýtlarý en yüksek ortalamadan en düþük ortalamaya doðru sýralayýnýz.

select gorev, avg(maas) from Personeller group by gorev having gorev not in(select gorev from Gorevler where ad = 'Genel Müdür') order by avg(maas) desc

--UYGULAMA-32: Bütün Personellerin ad soyad , görev adlarýný ve aldýklarý eðitim adlarýný alanlarýný listeleyiniz.

select p.ad, p.soyad, g.ad, e.egitimAdi from Personeller p 
inner join Gorevler g on  g.gorev = p.gorev 
inner join Egitimler e on p.egitimDerecesi = e.Id

--UYGULAMA-33: Maaþý en fazla olan Personellerin personelId, Personeller ad soyad  ve maaþ alanlarýný listeleyiniz.

select personelId, ad, soyad, maas from Personeller where maas = (select max(maas) from Personeller)

--UYGULAMA-34: Her görevde en az maaþ alan Personellerin PersonellerID, Personeller ad soyad  ve maas alanlarýný listeleyiniz.

select personelId, ad, soyad, maas from Personeller where maas in (select MIN(maas) from Personeller group by gorev)

--UYGULAMA-35: Yaþý en küçük olan Personellerin PersonellerID, Personeller ad soyad  ve yaþ alanlarýný listeleyiniz.

select personelId, ad, soyad, yas from Personeller where yas in (select MIN(yas) from Personeller)

--UYGULAMA-36: Hiç eðitim alamayan Personelleri listeleyiniz.

select * from Personeller where egitimDerecesi is null

--UYGULAMA-37: Her görevde çalýþan toplam Personeller sayýsýný veren sql komutlarýný yazýnýz.

select gorev, COUNT(*) from Personeller group by gorev

--UYGULAMA-38: Yaþý 40’dan büyük olan Personellerleri listeleyiniz.

select * from Personeller where yas > 40

--UYGULAMA-39: Yaþý 40’dan büyük olan Personellerlerin maaþýna %10 zam yapýnýz.

update Personeller set maas = maas * 1.10 where yas > 40
select * from Personeller

--UYGULAMA-40: Her görevde en çok maaþ alan herhangi bir personelden daha çok maaþ alan personellerin PersonellerID, Personeller ad soyad, görev adlarýný  ve maas alanlarýný listeleyiniz.

SELECT g.ad, personelId, p.ad, soyad, maas FROM Personeller p inner join Gorevler g on g.gorev=p.gorev WHERE maas >any (SELECT Max(maas) FROM Personeller GROUP BY gorev)

--UYGULAMA-41: Her görevdeki maaþlarýn hepsinden daha az ama ortalamasý 25000'den büyük olan personellerin görev eðitimlerini de adlarý ile görebileceðimiz sorguyu yazýnýz.

SELECT personelId, p.ad, soyad, maas,g.ad, e.egitimAdi FROM Personeller p inner join Gorevler g on g.gorev=p.gorev inner join Egitimler e on e.Id=p.egitimDerecesi where maas < all (SELECT avg(maas) FROM Personeller GROUP BY gorev having avg(maas)>25000)

