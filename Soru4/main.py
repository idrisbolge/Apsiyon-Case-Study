from  selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

#browser değişkenine hangi driveri çalıştıracağımızı gösterdik.
browser = webdriver.Chrome(executable_path=r'..\Soru4\chromedriver.exe')


def MainPage():
    # Web Tarayıcımızı tam ekran yaptık ve n11.com sitesine gittik
    browser.maximize_window()
    browser.get("https://www.n11.com/")

    # eğer sayfa başlığı 'n11.com - Hayat Sana Gelir' ise console ekranımıza bildirdik.
    #değil ise hata bildirisi verdik.
    if(browser.title=="n11.com - Hayat Sana Gelir" ):
        print("Web Sayfamız Açıldı.")

        # Sayfaya girince çıkan popup'ı esc tuşuna bastırarak kapattık.
        webdriver.ActionChains(browser).send_keys(Keys.ESCAPE).perform()

        # Giriş Yap Tuşuna bastık
        browser.find_element_by_css_selector("#header > div > div > div.hMedMenu > div.customMenu > div.myAccountHolder.customMenuItem.withLocalization > div > div > a.btnSignIn").click()
        time.sleep(2)
        #Login işlemlerini başlattık
        LoginPage()
    else:
        print("Bir hata oluştu. İnternet Bağlantınızı kontrol ediniz.")


def LoginPage():
    #Giriş yap sayfasında bizim test aracı olduğumuzu fark eden bir javascript kodu olduğundan
    #facebook ile login olacağız. Bu yüzden Facebook ile giriş butonuna basıyoruz.
    browser.find_element_by_css_selector(
        "#loginContainer > div > div.leftBlock > div > div.facebook_large.medium.facebookBtn.btnLogin"
    ).click()

    #Facebook'a giriş farklı bir pop up benzeri sayfadan olacağı için
    #ikinci sayfaya geçmeliyiz. Bu yüzden ikinci pencereye geçiş sağlıyoruz.
    #öncesinde login_page değişkenine şu anki pencereyi aktarıyoruz
    login_page = browser.current_window_handle
    for handle in browser.window_handles:
        if handle != login_page:
            facebook_login = handle

    #facebook login penceresine geçiş yaptığımız kod.
    browser.switch_to.window(facebook_login)
    time.sleep(1)

    #facebook penceresinde email password alanlarına bilgileri gönderdik.
    # Ardından giriş yap tuşuna bastık.
    browser.find_element_by_css_selector("#email").send_keys("apsiyonsoru4@hotmail.com")
    browser.find_element_by_css_selector("#pass").send_keys("apsiyon+4")
    browser.find_element_by_css_selector("#u_0_0").click()

    #tekrar login_page değişkeninin tuttuğu pencereye geçtik.
    browser.switch_to.window(login_page)
    #login_page değişkeni n11.com/giris-yap penceresini tuttuğu için bir geri yaparak
    # n11.com ana sayfasına dönüyoruz.
    browser.back()
    time.sleep(2)
    #sayfa yenilendiği için pop up tekrar aktif olacaktır. Bu yüzden tekrar esc tuşuna basıyoruz.
    webdriver.ActionChains(browser).send_keys(Keys.ESCAPE).perform()

    #Arama işlemini başlatıyoruz
    Search()


#Burada ise arama yapacağız ve veri geldiğine dair onay vereceğiz.
def Search():
    time.sleep(1)
    #öncelikle arama kutusunu bulup ona 'samsung' anahtar kelimesini aktarıyoruz
    browser.find_element_by_css_selector("#searchData").send_keys("samsung")
    time.sleep(2)
    #Daha sonra arama butonuna basıyoruz.
    browser.find_element_by_css_selector(
        "#header > div > div > div.hMedMenu > div.searchBox.withLocalization > a > span"
    ).click()

    time.sleep(3)
    #burada aramamız yapılmış olmalı. Şimdi kontrol edip onay vereceğiz.
    result =browser.find_element_by_css_selector(
        "#contentListing > div > div > div.productArea > section > div.header > div.resultText"
    )
    print(result.text)


MainPage()




