# cocktail_app
Utku Sertaç - 1030520847
Mobile Application Development Course Project  -  Fehim Köylü
Erciyes Üniversitesi Bilgisayar Mühendisliği Bölümü

TR-

Proje Yapısı

main.dart: Uygulamanın ana dosyası.
DataModel: Verileri yönetmek için kullanılan state management sınıfı.
AnaKategoriEkrani: Kokteyl kategorilerini listeleyen ana ekran.
AltKategoriEkrani: Seçilen kategoriye ait kokteylleri listeleyen ekran.
KokteylDetayEkrani: Seçilen kokteylin detaylarını gösteren ekran.

Yapılanlar

API Entegrasyonu: TheCocktailDB API'si kullanılarak kokteyl kategorileri, kokteyller ve kokteyl detayları çekildi.
State Management: Provider kullanarak state management yapısı oluşturuldu.
Navigasyon: Flutter'ın Navigator widget'ı kullanılarak ekranlar arası geçişler sağlandı.
Animasyonlar: Hero widget'ı kullanılarak geçiş animasyonları eklendi.
Liste ve Detay Görünümü: ListView widget'ı ile kategoriler ve kokteyller listelendi, FutureBuilder ile API çağrıları asenkron olarak yönetildi.

EN-

Project Structure

main.dart: Main file of the project.
DataModel: State Management class for managing data.
AnaKategoriEkrani: Main screen that list coctail categories.
AltKategoriEkrani: Shows cocktails that belongs to the chosen category.
KokteylDetayEkrani: Shows details of the chosen cocktail.

What Has Been Done

API Integration: Cocktail categories, cocktails and cocktail details pulled using TheCocktailDB API.
State Management: State management structure has been build using Provider.
Navigasyon: Transitions between screens were achieved using Flutter's Navigator widget.
Animation: Added transition animations using Hero widget.
Categories and cocktails were listed with the ListView widget, and API calls were managed asynchronously with FutureBuilder.