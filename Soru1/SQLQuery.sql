/*
Bir Ayakkab� da��t�c� firman�n ayakkab� markalar�n� hangi ma�azaya g�nderdi�ini tutan bir veritaban� tasar�m�d�r.
1. Sorunun 2. ��kk�na ait cevaplar a�a��daki gibidir.
A�a��daki d�rt sorgu 2 farkl� tablonun aras�ndaki ba�lant�lar� g�sterir. 
Ba�lant�lar ��yle olacakt�r.
 * �r�n-�r�n Detaylar�
 * Kategori - Kategori Detaylar�
 * Marka - Marka Detaylar�
 * Sat�c� Ma�aza - Sat�c� Ma�aza Detaylar�
*/

/*
�lk Sorgumuz �r�nlerin ve �r�n detaylar�n�n bir arada yazd�r�lmas�n� sa�lar.
*/
SELECT Urun.UrunID, Urun.Adi, Urun.Fiyati, UrunDetaylar.Detay
FROM Urun INNER JOIN UrunDetaylar 
ON Urun.UrunID = UrunDetaylar.UrunId

/*
�kinci sorgumuz ise kategori ve kategori detaylar�n� bir arada yazd�r�lmas�n� sa�lar.
*/
SELECT Kategori.KategoriID, Kategori.Adi, KategoriDetaylari.Detay
FROM Kategori INNER JOIN KategoriDetaylari 
ON Kategori.KategoriID = KategoriDetaylari.KategoriID

/*
���nc� sorgumuz ise markalar�n detaylar� ile birlikte yaz�lmas�n� sa�lar. 
*/
SELECT Marka.MarkaID, Marka.Adi, MarkaDetaylar�.Detaylar
FROM Marka INNER JOIN MarkaDetaylar� 
ON Marka.MarkaID = MarkaDetaylar�.MarkaID

/*
D�rd�nc� sorgumuz ise  Sat�c� ma�azalar�m�z ve detaylar�n� bir arada tutulmas�n� sa�lar.
*/
SELECT Satici.SaticiID, Satici.Adi, SaticiDetaylar.Detay
FROM Satici INNER JOIN SaticiDetaylar 
ON Satici.SaticiID = SaticiDetaylar.SaticiID



/*
-------------------------------------------------------------------------------------------------------------------------------------------
*/

/*
A�a��daki sorgu 8 tablonun tek bir join ile birle�tirilmesini sa�lar.
*/

SELECT Urun.UrunID AS [�r�n Numaras�], Urun.Adi AS [�r�n Ad�], Urun.Fiyati AS [�r�n Fiyat�], UrunDetaylar.Detay AS [�r�n Detaylar�], Kategori.Adi AS Kategori, KategoriDetaylari.Detay AS [Kategori Detay�], Marka.Adi AS Marka, 
                         MarkaDetaylar�.Detaylar AS [Marka Bilgisi], Satici.Adi AS [Sat�c� Ma�aza], SaticiDetaylar.Detay AS [Ma�aza Detay�]
FROM Kategori INNER JOIN
KategoriDetaylari ON Kategori.KategoriID = KategoriDetaylari.KategoriID INNER JOIN
MarkaDetaylar� INNER JOIN
Marka ON MarkaDetaylar�.MarkaID = Marka.MarkaID INNER JOIN
SaticiDetaylar INNER JOIN
Satici ON SaticiDetaylar.SaticiID = Satici.SaticiID INNER JOIN
Urun ON Satici.SaticiID = Urun.SaticiID ON Marka.MarkaID = Urun.MarkaID ON Kategori.KategoriID = Urun.KategoriID INNER JOIN
UrunDetaylar ON Urun.UrunID = UrunDetaylar.UrunId


/*
-------------------------------------------------------------------------------------------------------------------------------------------
*/

/*

A�a��daki sorgu ise subquery kullan�larak4 farkl� tablodan veri �ekmeyi ama�lar. 
Burda yapaca��m�z tablo �u �ekilde olu�acakt�r.

�r�n Numaras�,�r�n Ad�,Marka,Kategori,Sat�c� Ma�aza �eklinde olacakt�r. 

*/

SELECT Urun.UrunID,Urun.Adi, 
(SELECT Adi FROM Marka WHERE Marka.MarkaID = Urun.MarkaID) AS Marka,
(SELECT Adi FROM Kategori WHERE Kategori.KategoriID = Urun.KategoriID) AS Kategori,
(SELECT Adi FROM Satici WHERE Satici.SaticiID= Urun.SaticiID) AS 'Sat�c� Ma�aza'
FROM Urun