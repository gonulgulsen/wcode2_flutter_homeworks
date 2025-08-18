void main() {
    // a Kısmı 
    //int variable tanımlama
    int sayi1 = 19;
    print("Birinci sayı : $sayi1");

    // String variable tanımlama
    String cumle = "Bugün kendini nasıl hissediyorsun?";
    print("String değişkeni : $cumle");

    // double variable tanımlama
    double ondalikliSayi = 1.68;
    print("double değişkeni : $ondalikliSayi");

    // bool variable tanımlama
    bool yukleniyorMu = true;
    print("bool değişkeni : $yukleniyorMu");

    //dynamic variable tanımlama
    dynamic dinamikDeger = "Dart";
    print("dynamic değişkeni : $dinamikDeger");

    //char variable tanımlama 
    String harf = 'g';
    print("char değişkeni : $harf");

    //b Kısmı
    // ondalikliSayi değişkeninin camelCase tanımlanması
    var ondalikliSayiCamelCase = 1.68;
    print("double değişkeni (camelCase) : $ondalikliSayiCamelCase");

    //dinamikDeger değişkeninin snake_case tanımlanması
    var dinamik_deger = "Dart";
    print("dynamic değişkeni (snake_case) : $dinamik_deger");

    //yukleniyorMu değişkeninin PascalCase tanımlanması
    var YukleniyorMu = true;
    print("bool değişkeni (PascalCase) : $YukleniyorMu");

    //c Kısmı
    String ad = "Gönül Gülsen";
    String soyadi = "Kurt";
    int yas = 35;
    bool resitlik = true;
    print("Merhaba, ben $ad $soyadi. $yas yaşındayım. Reşitlik durumum : $resitlik");
}