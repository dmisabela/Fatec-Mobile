import 'package:flutter/material.dart';

class pessoal extends StatelessWidget {
  const pessoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    return Container(
        child: Column(children: <Widget>[
      _titulo("Sobre mim"),
      _corpo(
          "Oi, sou a Isabela :) Tenho 20 anos, divido meu coração entre tecnologia e educação! Estudo ADS na Fatec de Praia Grande e trabalho como Analista de Sistemas."),
    ]));
  }

  _titulo(titulo) {
    return Row(
    children: <Widget>[
      Flexible(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text(
              titulo, //texto
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              ),
            )            
          ),
      ],
      );   

  } 

  _corpo(corpo) {
    return Row(
    children: <Widget>[
      Flexible(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text(
              corpo, //texto
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.justify,
              ),
            )            
          ),
      ],
      ); 

}

}
