/* Definir valor de cinco produtos. 
Escolher um valor referente ao
pagamento da somatória destes valores. Calcular 
exibir o troco que deverá ser devolvido.
 */

void main() {

  double valorp1 = 10;
  double valorp2 = 5.80;
  double valorp3 = 8.90;
  double valorp4 = 15;
  double valorp5 = 20.80;

  double valorTotal = valorp1 + valorp2 + valorp3 + valorp4 + valorp5;
  double valorPago = 100;

  double troco = valorPago - valorTotal;

  print("O valor de total da compra foi $valorTotal reais, o valor pago foi $valorPago reais e o troco totalizou $troco reais ");
  
}
