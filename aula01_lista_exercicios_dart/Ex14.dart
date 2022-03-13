/*
Exibir os vinte primeiros valores da série de Bergamaschi. 
A série: 1, 1, 1, 3, 5, 9, 17, ...
 */
void main () {

  int v1 = 1;
  int v2 = 1;
  int v3 = 1;

  for (int i = 1; i <= 20; i++) {
    if (i <= 3) {
      print(v1);
    }
    else {
    int v4 = v1 + v2 + v3;
    print(v4);
    v1 = v2;
    v2 = v3;
    v3 = v4;
    }
  }
}