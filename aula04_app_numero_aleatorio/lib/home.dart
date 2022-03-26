import 'package:flutter/material.dart';
import 'dart:math';

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

  int resultado = 0;

  void _calcularAleatorio() {
    setState(() {           
     resultado = new Random().nextInt(11);      
    });
  }

  _titulo() {
    return AppBar(
      title: Text("Jogo - Número Aleatório"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 19, 94, 63),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _texto("Pense em um número de 0 a 10"),
          _mostrarNumero(resultado),
          _botao()   
        ],
      ),
    );
  }  

  _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 270.0,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/2314/2314437.png',
      )
    );
   }

   _texto(textoParaExibir) { 
    return Text(
      textoParaExibir, 
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 7, 100, 7), fontSize: 25.0),
    );
  }

 _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularAleatorio,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color.fromARGB(255, 19, 94, 63),
        ),
      ),
    );
  }

  _mostrarNumero(numero) {
    return Text(
      numero.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 31, 97, 18), fontSize: 50.0
      ),
    );
  }


}