# cocktail_app

Proje Yapısı
main.dart: Uygulamanın ana dosyası.
DataModel: Verileri yönetmek için kullanılan state management sınıfı.
AnaKategoriEkrani: Kokteyl kategorilerini listeleyen ana ekran.
AltKategoriEkrani: Seçilen kategoriye ait kokteylleri listeleyen ekran.
KokteylDetayEkrani: Seçilen kokteylin detaylarını gösteren ekran.
Yaptıklarımız
API Entegrasyonu: TheCocktailDB API'sini kullanarak kokteyl kategorileri, kokteyller ve kokteyl detayları çekildi.
State Management: Provider kullanarak state management yapısı oluşturuldu.
Navigasyon: Flutter'ın Navigator widget'ı kullanılarak ekranlar arası geçişler sağlandı.
Animasyonlar: Hero widget'ı kullanılarak geçiş animasyonları eklendi.
Liste ve Detay Görünümü: ListView widget'ı ile kategoriler ve kokteyller listelendi, FutureBuilder ile API çağrıları asenkron olarak yönetildi.