using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;

namespace Soru5
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //Cache Mekanizmamız için bir sözlük tanımladık.
        Dictionary<string,string> filmler=  new Dictionary<string, string>();


        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                //Butona tıklanıldığında textboxtaki veriyi doğruca sorgula metoduna yolluyoruz.
                string result = sorgula(textBox1.Text);

                //verileri dinamik dizi haline getiriyoruz.
                dynamic array = JsonConvert.DeserializeObject(result);

                //Gerekli alan doldurmalarını yapıyoruz.
                lblFilmAdi.Text = array["Title"];
                lblYil.Text = array["Year"];
                lblYayinlanmaTarihi.Text = array["Released"];
                lblFilmSure.Text = array["Runtime"];
                textBox4.Text = array["Director"];
                textBox3.Text = array["Writer"];
                textBox2.Text = array["Actors"];
                pictureBox2.Load(Convert.ToString(array["Poster"]));
            }
            catch (InvalidOperationException)
            {
                //Bu alanda filmi bulamazsa hata fırlatmasını engelleyelim diye bir mesaj verdirdik.
                MessageBox.Show("Herhangi Bir Kayıt Bulunamadı. ");
            }
        }


        string sorgula(string filmadi)
        {
            /*
             * sorgula metodunda filmin adina göre işlem yapacağız.
             * Yapacağımız işlemlemler sırasıyla;
             * Sözlüğümüz anahtarı Filmin Adı, değeri ise json sonucudur.
             * Sözlüğümüzde filmin adını anahtar olarak aratıyoruz.
             * Eğer var ise bize true döner ve if bloğuna gider
             * Bu şekilde bize anahtarın değerini döndürür.
             * Fakat false dönerse burda yeniden sorgulama yapılır.
             */
            
            if (filmler.ContainsKey(filmadi))
            {
                return filmler[filmadi];
            }
            else
            {
                //url adresimiz için filmin adındaki boşlukları + ile değiştiriyoruz
                //ve bizim anahtarımız olan &apikey=7dea1579 takısını sona getiriyoruz.
                string url = filmadi.Replace(' ', '+');
                url = "http://www.omdbapi.com/?t=" + url + "&apikey=7dea1579";

                //result değişkenimize GetReleases metodunun çıktısını alıyoruz
                string result = GetReleases(url);

                //Search model sınıfımızdan model adında bir nesne türetiyoruz
                //ve bu nesneye json sonucunu serileştiriyoruz
                SearchModel model = JsonConvert.DeserializeObject<SearchModel>(result);
                
                //Ardından sözlüğe ekleyip sonucumuzu geri döndürüyoruz
                filmler.Add(filmadi, result);
                return result;
            }

        }

        private string GetReleases(string url )
        {
            //client değişkenimize bir web client oluşturuyoruz.
            var client = new WebClient();
            //response değişkenimize ise alacağımız json dosyasını atıyoruz ve gönderiyoruz.
            string response = client.DownloadString(url);
            return response;
        }
    }
}
