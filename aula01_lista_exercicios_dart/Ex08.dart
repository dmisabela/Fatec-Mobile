/* A partir de três valores, 
verificar se formam ou não um triângulo. Em caso positivo,
exibir sua classificação: “Isósceles, escaleno ou eqüilátero”. 
Um triângulo escaleno possui todos os lados diferentes, o 
isósceles, dois lados iguais e o eqüilátero, todos os lados 
iguais. Para existir triângulo é necessário que a soma de dois 
lados quaisquer seja maior que o outro, isto, para os três lados
 */

void main() {

  double l1 = 15;
  double l2 = 10;
  double l3 = 10;

  if ((l1+l2) < l3 || (l1+l3 < l2) || (l2+l3 < l1)) {
    print("O triângulo não existe.");
  }
  else if (l1 == l2 && l2 == l3) {
    print("Triângulo equilátero - todos os lados são iguais.");
  }
  else if ((l1 == l2) || (l1 == l3) || (l2 == l3)) {
    print("Triângulo isósceles - dois lados iguais e 1 diferente.");
  }
  else {
    print("Triângulo escaleno - todos os lados são diferentes.");

  }
  
}