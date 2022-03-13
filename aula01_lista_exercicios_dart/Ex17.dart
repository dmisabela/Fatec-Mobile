/*
17. Armazenar dez valores na memória do computador. 
Após a digitação dos valores, criar uma rotina para 
ler os valores e achar e exibir o maior deles.
 */

void main () {

 final numbers = [10, 20, 40, 53, 88, 54, 23, 60, 12, 19];

 int maiorValor = numbers[0];

 for(int i = 1; i < numbers.length; i++) {
     if (numbers[i] > maiorValor) {
       maiorValor = numbers[i];
     }
 }
  print("O maior valor é $maiorValor ");

}
