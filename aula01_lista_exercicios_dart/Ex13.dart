/*
Exibir os trinta primeiros valores da série 
de Fibonacci. A série: 1, 1, 2, 3, 5, 8, ...
 */

void main () {

  int v1 = 1;
  int v2 = 1;

  for (int i = 1; i <= 30; i++) {
    if (i <= 2) {
      print(v1);
    }
    else {
    int v3 = v1 + v2;
    print(v3);
    v1 = v2;
    v2 = v3;
    }
  }
}




