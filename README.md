
### SQL 

## CREATE
Create özelliği kullanım örnekleri;
 - **Veritabanı** Oluşturma (DATABASE)
 `CREATE DATABASE dbName` 
 
 Tablo oluşturmadan önce `USE dbName` ile veritabanını çağırmamız gerekiyor.
 
 - **Tablo** Oluşturma (TABLE)
 `CREATE TABLE tableName()`
 
  Parantezler içerisine yazabileceğimiz örnek veriler;
 - `personelNO int constraint PK_personelNo
primary key identity(1,1)`
Bu kod ile "**personelNO**" adında sütunumuzu oluşturup her yeni veri girildiğinde otomatik "**artan**" bir şekilde veri girişi yapıyor. 
`identity()` özelliğidir.
Tipi `int` dir, ve `primary key` dir.

   `primary key` Verilen sütundaki veriler **birbirinden farklı** olmak zorundadır.

 - `ad varchar(50)` 
 "**ad**" Adında sütun oluşturuyor ve tipini `varchar()` olarak ayarlayıp **50** **karakterlik** sınır koyuyor.
 
	 `varchar(sınır)` varchar özelliği sınır verilerek kullanılması gerekmektedir.

 - `maas money`
 "**maas**" Adında sütun oluşturuyor ve tipini `money` olarak ayarlıyor.
 
	 `money` **para** gibi **karakter sayısı değişkenlik gösteren ve küsuratlar içeren** veriler için kullanılabilir.
- `girisTarihi datetime`
"**girisTarihi**" adında sütun oluşturuyor ve tipini `datetime` yapıyor.

   `datetime` **tarih girişi** için kullanılır.

## DROP
Drop özelliği kullanım örnekleri;
 - Veritabanı **silme** (DATABASE)
 `DROP DATABASE dbName`
 
 - Tablo **silme** (TABLE)
 `DROP TABLE tableName`
 
 ## SELECT
Select özelliği kullanım örnekleri;

    SELECT * FROM tableName
   Bu kod ile **tableName** tablosundaki **bütün**(*) verileri görüntüleriz.
   
   Hepsini değil, **belirli sütunları** görüntülemek istiyorsak;
   

    SELECT column1,column2 FROM tableName
    SELECT column1 FROM tableName
   
Birden fazla tablomuz ve bu tablonun sütun isimlerinde benzerlik var ise;
`SELECT Tablo.ad FROM Tablo` Diyerek tam yol belirtmiş oluruz.
 ## SELECT - WHERE
 Select - Where Kullanımı;
 
 **Personel** adında **tablomuzun** olduğunu hayal edelim. Bu tabloda **ad, soyAd, maas, girisTarihi** gibi sütunlarımız olsun.
 
 **Adı Hakan olan personelin (veya personellerin) bütün(ad,soyAd,maas)**(*) bilgilerini görmek istiyorsam.
 
 `SELECT * FROM Personel WHERE ad = 'Hakan'`
 **ad** sütunundaki içeriği **Hakan** olan tüm verileri gösterecek.
 
 Sadece **maas** bilgisini görmek istersem. **Yıldız** yerine **maas** yazarım.
 `SELECT maas FROM Personel WHERE ad = 'Hakan'`
 
 **maas** ve **soyAd** `ı görmek istersem.
  
    SELECT maas, soyAd FROM Personel WHERE ad = 'HAKAN'
  <hr>
  
 ### AND  özelliği kullanımı;
 
   **ad** sütunundaki içeriği **Hakan** ve  **soyAd** sütunundaki içeriği **Soyadı** olan bir verinin **bütün**(*) bilgilerini görüntülemek istersem.
   `SELECT * FROM Personel WHERE ad = 'Hakan' AND soyAd = 'Soyadı'`

Aynı işleme **maas** verisi **5000 den büyük**  olma zorunluluğu getirirsem.
`SELECT * FROM Personel WHERE ad = 'Hakan' AND soyAd = 'Soyadı' AND maas > 5000`
   <hr>

### LIKE özelliği kullanımı;

**ad** sütunundaki içeriğin ilk harfi **a** veya **b** olan verinin(veya verilerin) **bütün**(*) bilgilerini görüntülemek istersem.
`SELECT * FROM Personel WHERE ad LIKE '[ab]%'`
`'[ab]%'` Bu kodun açıklaması, 

**ilk harf a veya b olacak
 % ile sonraki harfler ne olursa olsun 
 diyoruz.**

`[a-c]%` Bu kodun açıklaması,

**ilk harf a dan c ye kadar(a, c dahil) olan harfler
 sonraki harfler önemsiz olacak** 
 
 şeklinde sonuç verecek.

####  NOT LIKE kullanımı ise "LIKE" ı "NOT LIKE" olarak yazınca verdiğimiz aralığın dışındaki verileri verir.

   <hr>

### IN özelliği kullanımı;

**maas** aralığı 5000-10000 arası olan(5000 ve 10000 dahil) verileri görmek istersem.

    SELECT * FROM Personel WHERE maas IN (5000, 10000)
#### NOT IN kullanımı ise "IN" i "NOT IN" olarak çevirdiğimizde verilen aralığın dışındaki verileri gösterir.
<hr>

### BETWEEN özelliği kullanımı;

Belirli bir giriş tarihi aralığındaki personelleri görüntülemek istersem. 
`SELECT * FROM WEHERE girisTarihi BETWEEN '2021-01-01' AND '2023-01-01'`
<hr>

### Distinct özelliği kullanımı;

`SELECT DISTINCT * FROM Personel`
Komutu ile bütün personel ve bilgilerini görüntüleyebiliriz. Fakat aynı veriler sadece tek bir veri olarak görüntülenir.

Yani Hakan adında iki tane veri olsun tablomda.
`SELECT DISTINCT ad FROM Personel`
der isem Hakan adındaki iki veriden sadece biri görüntülenecek.

<hr>

### TOP özelliği kullanımı;

Tablomda yukarıdan ilk 5 veriyi görüntülemek istersem.
`SELECT TOP 5 * FROM Personel`

<hr>

### PERCENT özelliği kullanımı;

  `SELECT TOP 50 PERCENT * FROM Personel`
  Dersem verilerin %50 sini gösterecek.
  
  `TOP` olmak zorundadır.

<hr>

### ASC ve DESC özelliği kullanımı; (ORDER BY)

**ad** sütununu **a** dan **z** ye sıralamak istersem;
`SELECT * FROM Personel ORDER BY ad ASC`

**ASC yi DESC** yaparsam aynı işlemi tersine çevirecek.
`SELECT * FROM Personel ORDER BY ad DESC`

**maas** sütununu **küçükten - büyüğe** sıralamak istersem.
`SELECT * FROM Personel ORDER BY maas ASC`

**maas** sütununu **büyükten - küçüğe** sıralamak istersem.
`SELECT * FROM Personel ORDER BY maas DESC`

## SUM()
**Personeller** adında bir **tablomuz** ve **maas** adında **sütunumuz** olsun. 

**SUM()** ile **int** bir sütunun **içerisindeki tüm verileri toplayabiliriz.** Örnek;

`SELECT SUM(maas) FROM Personeller`

**Personeller tablosundaki maas sütunu**nun **tüm verileri toplar.**

### as "takmaAD"
`SELECT SUM(maas) as ToplamMaas FROM Personeller`
`SELECT ToplamMaas=SUM(maas) FROM Personeller`

**as** özelliği ile **Personeller** tablosundan **maas sütununun toplamı**nı **ToplamMaas takma adı**yla çıktı alabiliriz.

`SELECT p.ad FROM Personeller as p` 
Personeller adına takma ad ekleyerek p dedik.

## MAX() - MİN()

**Personeller tablosunda maas sütunundaki değerlerden en yüksek değer**i bulmak istersek;

`SELECT MAX(maas) FROM Personeller`

**Takma Ad eklemek** istersek; 
`SELECT MAX(maas) as EnYuksekMaas FROM Personeller`
<hr>

**Personeller tablosunda maas sütunundaki değerlerden en küçük değer**i bulmak istersek;

`SELECT MIN(maas) FROM Personeller`

**Takma Ad eklemek** istersek; 
`SELECT MIN(maas) as EnDusukMaas FROM Personeller`

## Count()

**Personeller tablosundaki maas sütunun içindeki veri adedi**ni verir.
**Fakat NULL - NOT değerlerini saymaz.**

Örnek;
`SELECT COUNT(maas) FROM Personeller`

## UPPER() - LOWER()

**Personeller tablosundaki ad sütunundaki verilerin çıktısını büyük** almak istersem;

`SELECT UPPER(ad) FROM Personeller`

Örnek;
**Giriş** = `SELECT ad FROM Personeller`
**Çıktı** = **Hakan**

**Giriş** = `SELECT UPPER(ad) FROM Personeller`
**Çıktı** = **HAKAN**

<hr>

**Personeller tablosundaki ad sütunundaki verilerin çıktısını küçük** almak istersem;

`SELECT LOWER(ad) FROM Personeller`

Örnek;
**Giriş** = `SELECT ad FROM Personeller`
**Çıktı** = **Hakan**

**Giriş** = `SELECT LOWER(ad) FROM Personeller`
**Çıktı** = **hakan**

## LEN()

**Personeller tablosundaki ad sütunundaki verilerin çıktısının uzunluğu**nu almak istersem;

`SELECT LEN(ad) FROM Personeller`

Örnek;
**Giriş** = `SELECT ad FROM Personeller`
**Çıktı** = **Hakan**

**Giriş** = `SELECT LEN(ad) FROM Personeller`
**Çıktı** = **5**

## AVG()

**Personeller tablosundaki maas sütunu**nun **ortalama veri**sini almak istersek;

`SELECT AVG(maas) FROM Personeller`

## CONVERT()

**Personeller tablosundaki ad sütunun veri tipini değiştirmek** için;

`SELECT CONVERT(varchar(3), ad) FROM Personeller`
`SELECT CAST(26.10 as int)` **26.10** Değerinin **tipini** **int** e çevirir.

## Zaman Fonksiyonları - GETDATE(), GETUTCDATE(), DATENAME(), DATEDIFF(), DATEADD()

`SELECT GETDATE()` **Şimdiki** zaman.
`SELECT GETUTCDATE()` **UTC** zamanı.

`SELECT DATENAME(DAY, CURRENT_TIMESTAMP)` **Gün**.
`SELECT DATENAME(MONTH, CURRENT_TIMESTAMP)` **Ay**.
`SELECT DATENAME(YEAR, CURRENT_TIMESTAMP)` **Yıl**.

**Yıl cinsinden Personeller tablosundaki personellerin giriş tarihi ile günümüz arasındaki fark**ı alalım;

`SELECT DATEDIFF(YEAR, girisTarihi, GETDATE()) FROM Personeller`
**Yıl** cinsini **ay** veya **gün** ile değiştirmek için **YEAR** **yerine** **MONTH** veya **DAY** yazıyoruz.

Personellerin **giriş** **yaptığı** **yıl** ı almak istersem;

`SELECT DATENAME(YEAR, girisTarihi) FROM Personeller`

Personellerin **giriş yaptığı yıl a ekleme yapmak** istersem;

`SELECT DATEADD(YY, 3, girisTarihi) FROM Personeller` Personellerin **giriş yaptığı yıl a 3 yıl eklendi**.

<hr>

### Örnekler;

`SELECT (Notlar.vize*0.4 + Notlar.final*0.6) as ortalamaNot FROM Notlar`

### Parantez içerisinde matematik işlemleri yapabiliriz.

<hr>

Personel **bölümleri**nin **maksimum maaş** değerini verir **fakat maksimum maaş değeri 20.000' den büyük** olmalı.

    select bolum, MAX(maas) as EnYuksekMaas from Personeller GROUP BY bolum having max(maas) > 20000

<hr>

**Görevlerine göre** **maaşı 15.000' den büyük olan kişiler**in **ortalaması** fakat **ortalaması 35.000' den büyük olan**lar.

    select gorev, AVG(maas) as maasOrt from Personeller WHERE maas > 15000 GROUP BY gorev having avg(maas) > 35000

<hr>

# Çoklu Tablo Çalışması

**Personeller ve Bolumler adında iki tablo**muz var. **Personeller tablosundaki bolum sütunu** ile **Bolumler tablosundaki bolumNo sütunu**nu **eşleştir**erek çıktı almak istiyorum.

    select b.*, p.* from Bolumler b, Personeller p where b.bolumNo=p.bolum

Dikkat! birleştirme işlemi **where** den sonra **b.bolumNo=p.bolum de gerçekleşiyor.**

![enter image description here](https://cdn.discordapp.com/attachments/852651577721880586/1184574574113849384/Ekran_goruntusu_2023-12-13_220836.png?ex=658c780a&is=657a030a&hm=d458f0a48ceb4ad3ce55a4575aeaa2c81692787e839140b2e92c4b2f36833ee7&)

-Aynı işlemin **inner join** versiyonu;

    select ... from tabloadi1 inner join tabloadi2 on tabloadi1.alan=tabloadi2.alan

-Aynı işleme **bir koşul daha ekleyelim(AND özelliği)** bu koşulumuz **ad** sütununda **herhangi bir yerinde** **İ** **harfini şartlasın.**

    select b.*, p.* from Bolumler b, Personeller p where b.bolumNo=p.bolum and ad like ('%i%')

![enter image description here](https://cdn.discordapp.com/attachments/852651577721880586/1184578234579435600/Ekran_goruntusu_2023-12-13_222957.png?ex=658c7b73&is=657a0673&hm=7baaa9158a7644ad7257ea3df9134aee075b6799de991d504471901a10f87bef&)

-Aynı işlemde **ad sütununda herhangi bir yerinde i harfi içermesin** ve **soyad sütunu alfabetik sıraya göre** sıralansın.

    select b.*, p.* from Bolumler b, Personeller p where b.bolumNo=p.bolum and ad not like ('%i%') order by soyad

![enter image description here](https://cdn.discordapp.com/attachments/852651577721880586/1184579811176349758/image.png?ex=658c7ceb&is=657a07eb&hm=e2e3339ac39b8e9b0c8314f44f929734d31f8786d632e559e983d2952f65f77b&)

<hr>

### İki tabloyu ilişkilendirme;

    select ... from tabloadi1 inner join tabloadi2 on tabloadi1.alan=tabloadi2.alan where ...

### İkiden fazla tabloyu ilişkilendirme;

    select ... from tabloadi1 inner join tabloadi2 on tabloadi1.alan=tabloadi2.alan inner join tabloadi3 on tabload1.alan=tabloadi3.alan

<hr>

### inner join ile tablo ilişkilendirme arasındaki fark;

    select t.ad, f.filmId, f.ad, f.imdbPuan from Filmler f, Turler t where t.turId = f.turId

-

    select t.ad, f.filmId, f.ad, f.imdbPuan from Filmler f inner join Turler t on t.turId = f.turId

<hr>

## LEFT JOİN

left join - **solda belirtilen tabloyu olduğu gibi getir**ir **sağda belirtilen tablodan sadece eşleşenler**i getirir

![enter image description here](https://cdn.discordapp.com/attachments/852651577721880586/1184583559504203836/Ekran_goruntusu_2023-12-13_222957.png?ex=658c8069&is=657a0b69&hm=e5a4c8a906ce12e4ff9d61bddf0f633c69cc40eecc5b4e5acf8470fe15b845a7&)


## RİGHT JOİN ise aynı işlemi sağ`a çevrilmiş hali.

## FULL OUTER JOİN

Herhangi bir koşul olmadan iki tabloyu olduğu gibi ekler.

    
    select f.filmId, f.ad, f.imdbPuan, t.ad turAD from Filmler f full outer join Turler t on f.turId = f.turId

<hr>

# [LIRIANDEV](https://liriandev.com)
