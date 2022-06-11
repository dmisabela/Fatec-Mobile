import 'package:flutter/material.dart';

class formacao extends StatelessWidget {
  const formacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    return Container(
      child: Column(children: <Widget>[
      _titulo("Formação"),
      _corpo(
          "Estou cursando ADS na Fatec de Praia Grande, atualmente no 5º semestre."),
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
