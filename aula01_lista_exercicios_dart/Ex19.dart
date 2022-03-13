/*
19. Armazenar o nome e idade de 5 pessoas. 
Exibir os dados (nome e idade) de todas as pessoas.
*/

void main() {

  Pessoa p1 = Pessoa("Isabela", 19);
  Pessoa p2 = Pessoa("Ana", 47);
  Pessoa p3 = Pessoa("Chiara", 46);
  Pessoa p4 = Pessoa("Alessandra", 51);
  Pessoa p5 = Pessoa("Paola", 49);

  final pessoas = [p1, p2, p3, p4, p5];

    for (Pessoa p in pessoas) {
      print(p.dadosPessoa());
    }

}

class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  String dadosPessoa() {
    return "$nome - $idade anos";
  }

}