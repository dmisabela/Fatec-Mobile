import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detalhes.dart';

class home extends StatelessWidget {
  String url = "https://sujeitoprogramador.com/r-api/?api=filmes";
  String nome = '';
  String foto = '';
  
  _filmes() async {
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    nome = retorno["nome"];
    String sinopse = retorno["sinopse"];
    foto = retorno["foto"];

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: 
        _corpo(context),
      ),
    );
  }

  _titulo() {
    return AppBar(
        title: Text("App de Filmes"),
        centerTitle: true,
        backgroundColor: Colors.blue);
  }

  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: _texto(nome),
                      padding: EdgeInsets.all(50),
                    ),
                    Container(
                      child: _botao(context, 'Detalhes'),
                      padding: EdgeInsets.all(50),
                    ),
                  ],
                ),
                Image.network(
                  foto,
                  height: 500,
                  width: 500,
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  _texto(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.purple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Colors.purple,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _botao(BuildContext context, String textoBotao) {
    return RaisedButton(
        color: Colors.purple,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickOutraTela(context);
          _filmes();
        });
  }

  _onClickOutraTela(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return detalhes();
      }),
    );
  }
}
