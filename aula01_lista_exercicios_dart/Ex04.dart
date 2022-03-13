/* 4. Com o valor da cotação do dólar e uma certa quantidade de 
dólares. Calcular e exibir o valor correspondente em Reais (R$).
 */

void main() {
  double cotacao = 5.06;
  double dolares = 10;

  double reais = 10 * cotacao;
 
  print("O valor de $dolares dólares em reais é R\$ ${reais.toStringAsPrecision(4)} ");
}
