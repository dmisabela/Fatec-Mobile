/*
20. Armazenar o nome, sexo e idade de 5 pessoas. 
Devem ser apenas “F” ou “M” para o sexo e 
valores positivos para a idade. Exibir os dados (nome, 
sexo e idade) de todas as pessoas do sexo feminino.

*/

void main() {

  Pessoa p1 = Pessoa("Isabela", 19, "F");  
  Pessoa p2 = Pessoa("João", 33, "M");
  Pessoa p3 = Pessoa("Ana", 47, "F");
  Pessoa p4 = Pessoa("Chiara", 46, "F");
  Pessoa p5 = Pessoa("José", 25, "M");

  final pessoas = [p1, p2, p3, p4, p5];

    for (Pessoa p in pessoas) {
      if (p.sexo == "F") {
      print(p.dadosPessoa());
      }
    }
}

class Pessoa {
  String nome;
  int idade;
  String sexo;

  Pessoa(this.nome, this.idade, this.sexo);

  String dadosPessoa() {
    return "Nome: $nome | Idade: $idade | Sexo: $sexo";
  }

}