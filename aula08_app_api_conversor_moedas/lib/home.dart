import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String moedaOrigem = 'De';
  String moedaFinal = 'Para';
  String resposta = 'Valor total';
  double total = 0;
  double valor = 0;

  TextEditingController numeroController = TextEditingController();

  String base_url = "https://economia.awesomeapi.com.br/json/last/";
  String getURL() {
    return base_url + moedaOrigem + '-' + moedaFinal;
  }

  _valorFinal() async {
    valor = double.parse(numeroController.text);
    http.Response response = await http.get(Uri.parse(getURL()));

    Map<String, dynamic> retorno = jsonDecode(response.body);
    double Cotacao = retorno['ask'];
    setState(() {
      total = valor * Cotacao;
      resposta = 'Valor total: $total';
    });
  }

  _dropOrigem() {
    return DropdownButton<String>(
      value: moedaOrigem,
      items: <String>['De', 'BRL', 'USD', 'EUR', 'BTC'].map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (selecionado) {
        setState(() {
          moedaOrigem = selecionado.toString();
        });
      },
    );
  }

  _dropFinal() {
    return DropdownButton<String>(
      value: moedaFinal,
      items: <String>['Para', 'BRL', 'USD', 'EUR', 'BTC'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (selecionado) {
        setState(() {
          moedaFinal = selecionado.toString();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversão de Moedas"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o valor a converter",
                  labelStyle: TextStyle(color: Colors.deepPurple)),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
              controller: numeroController,
            ),
            _dropOrigem(),
            _dropFinal(),
            Text(resposta,
                style: TextStyle(color: Colors.black, fontSize: 30.0)),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _valorFinal,
                  child: Text("Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
