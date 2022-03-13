/*
12. Definir um valor (X) qualquer.
Definir o intervalo que o programa que deverá calcular 
a tabuada do valor X digitado, sendo que o segundo 
valor (B), deverá ser maior que o primeiro (A). Exibir 
a tabuada do valor, no intervalo decrescente, 
ou seja, a tabuada de X no intervalo de B para A.
*/

 void main () {

     int x = 10;

     int A = 3;
     int B = 10;

    if (B <= A) {
       print("O segundo valor deve ser maior que o primeiro");
    } 

    else {
      for (int i = B; i >= A; i--) {
          int result = x * i;
          print("$x x $i = $result");
      }
    }


 }

