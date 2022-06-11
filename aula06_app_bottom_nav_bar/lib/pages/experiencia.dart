import 'package:flutter/material.dart';

class experiencia extends StatelessWidget {
  const experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    return Container(
        child: Column(children: <Widget>[
      _titulo("Experiência"),
      _corpo(
          "Atuo como analista de sistemas e monitora de um curso preparatório para certificação."),
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
