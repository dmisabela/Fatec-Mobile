/*
18. Armazenar vinte valores em um vetor.
Entrar com uma constante multiplicativa que deverá multiplicar 
cada um dos valores do vetor e armazenar o resultado no próprio vetor, 
na respectiva posição.
*/

void main () {

  final numbers = [];
  const multip = 2;

  //populando dez números (de 1 a 20) no array numbers
  for(int i = 1; i <= 20; i++) {
    numbers.add(i); 
  }

  print("Vetor original: $numbers ");
    
  //multiplicando cada valor pela constante na mesma posição
  for(int j = 0; j < numbers.length; j++) {    
    numbers[j] = numbers[j] * multip;
  } 

  print("Após multiplicar por $multip = $numbers ");

}