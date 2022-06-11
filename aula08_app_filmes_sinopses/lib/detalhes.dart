import 'package:flutter/material.dart';

class detalhes extends StatelessWidget {
  const detalhes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: _exibicao(context),
    );
  }

  _titulo(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.purple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _corpo(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 15,
          decorationColor: Colors.deepPurple,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _exibicao(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                children: [_titulo("Sinopse"), _corpo("Confira a sinopse!")]),
          ],
        ),
      ),
    );
  }
}
