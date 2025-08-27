
double dikdortgenAlani(double uzunKenar, double kisaKenar){
  return uzunKenar * kisaKenar;
}

int carp (int a, int b){
  int multiplyByTwo(int x) {
    return x*2;
  }

  int result = a;
  for (int i = 1; i < b; i++){
    result = multiplyByTwo(result);
  }

  return result;
}

void listedenElemanSil(List<dynamic> liste, dynamic eleman){
  liste.remove(eleman);
}


void main() {
  double uzunKenar = 9.54;
  double kisaKenar = 4.76;
  double alan = dikdortgenAlani(uzunKenar, kisaKenar);
  print('Dikdörtgenin alanı : $alan');

  //carp fonksiyonu çağırılması - call
  int a = 5;
  int b = 3;
  int sonuc = carp(5, 3);
  print( 'Sonuç : $sonuc');

  List<int> sayilar = [1, 2, 3, 4, 5];
  print('Başlangıç listesi : $sayilar');
  listedenElemanSil(sayilar, 1);
  print('4 silindikten sonraki liste : $sayilar');
}