/* A partir dos valores da aceleração (a em m/s2), da velocidade 
inicial (v0 em m/s) e do tempo de percurso(t em s). 
Calcular e exibir a velocidade final de automóvel em km/h. 
Exibir mensagem de acordo com a tabela:
 */
void main() {

  double a = 2;
  double v0 = 10;
  double t = 50;
 
  double Vms = v0 + a * t;
 
  double Vkmh = Vms * 3.6;
 
  if (Vkmh <=40) {
    print("Veiculo muito lento");
  }
  if(40 < Vkmh && Vkmh <=60) {
    print("Velocidade permitida");
  }
  if(60 < Vkmh && Vkmh <=80) {
    print("Velocidade de cruzeiro");
  }
  if(80 < Vkmh && Vkmh <=120) {
    print("Veículo rápido");
  }
  if(Vkmh > 120) {
    print("Veículo muito rápido");
  }
 
}

