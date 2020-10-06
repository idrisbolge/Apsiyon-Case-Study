/*
Bir Ayakkabý daðýtýcý firmanýn ayakkabý markalarýný hangi maðazaya gönderdiðini tutan bir veritabaný tasarýmýdýr.
1. Sorunun 2. Þýkkýna ait cevaplar aþaðýdaki gibidir.
Aþaðýdaki dört sorgu 2 farklý tablonun arasýndaki baðlantýlarý gösterir. 
Baðlantýlar þöyle olacaktýr.
 * Ürün-Ürün Detaylarý
 * Kategori - Kategori Detaylarý
 * Marka - Marka Detaylarý
 * Satýcý Maðaza - Satýcý Maðaza Detaylarý
*/

/*
Ýlk Sorgumuz Ürünlerin ve Ürün detaylarýnýn bir arada yazdýrýlmasýný saðlar.
*/
SELECT Urun.UrunID, Urun.Adi, Urun.Fiyati, UrunDetaylar.Detay
FROM Urun INNER JOIN UrunDetaylar 
ON Urun.UrunID = UrunDetaylar.UrunId

/*
Ýkinci sorgumuz ise kategori ve kategori detaylarýný bir arada yazdýrýlmasýný saðlar.
*/
SELECT Kategori.KategoriID, Kategori.Adi, KategoriDetaylari.Detay
FROM Kategori INNER JOIN KategoriDetaylari 
ON Kategori.KategoriID = KategoriDetaylari.KategoriID

/*
Üçüncü sorgumuz ise markalarýn detaylarý ile birlikte yazýlmasýný saðlar. 
*/
SELECT Marka.MarkaID, Marka.Adi, MarkaDetaylarý.Detaylar
FROM Marka INNER JOIN MarkaDetaylarý 
ON Marka.MarkaID = MarkaDetaylarý.MarkaID

/*
Dördüncü sorgumuz ise  Satýcý maðazalarýmýz ve detaylarýný bir arada tutulmasýný saðlar.
*/
SELECT Satici.SaticiID, Satici.Adi, SaticiDetaylar.Detay
FROM Satici INNER JOIN SaticiDetaylar 
ON Satici.SaticiID = SaticiDetaylar.SaticiID



/*
-------------------------------------------------------------------------------------------------------------------------------------------
*/

/*
Aþaðýdaki sorgu 8 tablonun tek bir join ile birleþtirilmesini saðlar.
*/

SELECT Urun.UrunID AS [Ürün Numarasý], Urun.Adi AS [Ürün Adý], Urun.Fiyati AS [Ürün Fiyatý], UrunDetaylar.Detay AS [Ürün Detaylarý], Kategori.Adi AS Kategori, KategoriDetaylari.Detay AS [Kategori Detayý], Marka.Adi AS Marka, 
                         MarkaDetaylarý.Detaylar AS [Marka Bilgisi], Satici.Adi AS [Satýcý Maðaza], SaticiDetaylar.Detay AS [Maðaza Detayý]
FROM Kategori INNER JOIN
KategoriDetaylari ON Kategori.KategoriID = KategoriDetaylari.KategoriID INNER JOIN
MarkaDetaylarý INNER JOIN
Marka ON MarkaDetaylarý.MarkaID = Marka.MarkaID INNER JOIN
SaticiDetaylar INNER JOIN
Satici ON SaticiDetaylar.SaticiID = Satici.SaticiID INNER JOIN
Urun ON Satici.SaticiID = Urun.SaticiID ON Marka.MarkaID = Urun.MarkaID ON Kategori.KategoriID = Urun.KategoriID INNER JOIN
UrunDetaylar ON Urun.UrunID = UrunDetaylar.UrunId


/*
-------------------------------------------------------------------------------------------------------------------------------------------
*/

/*

Aþaðýdaki sorgu ise subquery kullanýlarak4 farklý tablodan veri çekmeyi amaçlar. 
Burda yapacaðýmýz tablo þu þekilde oluþacaktýr.

Ürün Numarasý,Ürün Adý,Marka,Kategori,Satýcý Maðaza þeklinde olacaktýr. 

*/

SELECT Urun.UrunID,Urun.Adi, 
(SELECT Adi FROM Marka WHERE Marka.MarkaID = Urun.MarkaID) AS Marka,
(SELECT Adi FROM Kategori WHERE Kategori.KategoriID = Urun.KategoriID) AS Kategori,
(SELECT Adi FROM Satici WHERE Satici.SaticiID= Urun.SaticiID) AS 'Satýcý Maðaza'
FROM Urun