/*
16. Armazenar dez números na memória do computador. 
Exibir os valores na ordem inversa à do que foi armazenado.
 */
void main () {

  final numbers = [];

  //populando dez números (de 1 a 10) no array numbers
  for(int i = 1; i <= 10; i++) {
    numbers.add(i); 
  }
  
  //exibindo os dez números na ordem inversa
  for(int j = 1; j <= numbers.length; j++) {
    print(numbers[numbers.length-j]);
  } 

}
