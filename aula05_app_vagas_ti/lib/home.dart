import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas em TI"),
      centerTitle: true,
      backgroundColor: Colors.purple.shade900,
    );
  } 

 _corpo() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[  
          _texto("", "Vagas", 80.0),  
          _foto(),              
          _carrosel(),
          //_texto(),
        ],
      ),
    );
  }

  _foto() {
    return Container(
      height: 200.0,
      child: Image.network(
        'https://thumbs.dreamstime.com/b/%C3%ADcone-da-feira-de-emprego-isolado-no-fundo-branco-133862365.jpg',
      )
    );
   }

   _carrosel() {
    return Container(
      height: 500,
      child: ListView(
        children: <Widget>[
          _anuncio('Desenvolvedor Backend', 8500.00, "Linguagens Java e C#, conhecimento em banco de dados Oracle", "13 99999-9999"),
          _anuncio('Desenvolvedor FrontEnd', 7500.00, "Conhecimento em Vue.js e Angular", "13 99999-9999"),
          _anuncio('DevOps', 6500.00, "Conhecimento em CI/CD, Azure DevOps, Terraform", "13 99999-9999"),    
        ],
      ),
    );
  } 

  _anuncio(String tituloCargo, double salario, String descricao, String contato) {
    return Container(
      decoration: BoxDecoration(       
      color: Colors.white,
      border: Border.all(color: Colors.black)
     ),     
      padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _texto("", tituloCargo, 50.0),          
          _salario(salario.toStringAsFixed(2).toString()),
          _texto("Descrição: ", descricao, 30.0),
          _texto("Contato: ", contato, 30.0),
          //_texto(),
        ],
      ),
    );
  }

  _texto(String label, textoParaExibir, tamanhoFonte) {
    return Text(
      "$label $textoParaExibir",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.purple.shade900, fontSize: tamanhoFonte),
    );
  }

  _salario(valor) {
    return Text(
      "R\$ $valor",
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 31, 4, 65), fontSize: 50.0),
    );
  }

   
}