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
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.purple.shade900,
    );
  } 

 _corpo() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _texto("Catálogo de Instrumentos", 50.0),
          _carrosel(),
          //_texto(),
        ],
      ),
    );
  }

   _carrosel() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 500,
      child: PageView(
        children: <Widget>[
          _anuncio('violao', "Violão 6 cordas (Nylon) - Tagima", 500.00),
          _anuncio('guitarra', "Guitarra Elétrica - Tagima", 850.00),
          _anuncio('teclado', "Teclado Yamaha", 989.00),  
          _anuncio('cajon', "Cajón Eletroacústico", 250.00), 
        ],
      ),
    );
  } 

  _anuncio(String produto, String descricao, double valor) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _foto('$produto.png'),
          _texto(descricao, 30.0),
          _preco(valor.toStringAsFixed(2).toString()),
          //_texto(),
        ],
      ),
    );
  }



  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 250,
      width: 250,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      fit: BoxFit.contain,
    );
  } 

  _texto(textoParaExibir, tamanhoFonte) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.purple.shade900, fontSize: tamanhoFonte),
    );
  }

  _preco(valor) {
    return Text(
      "R\$ $valor",
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 31, 4, 65), fontSize: 50.0),
    );
  }

   
}