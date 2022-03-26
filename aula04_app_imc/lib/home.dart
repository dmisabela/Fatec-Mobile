import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String mostrarResultado = "Informe os valores!";

  void _calcular() {
    setState(() {

      if (pesoController.text.isNotEmpty && alturaController.text.isNotEmpty) {
      
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      double imc = peso / (altura * altura);
      var imcFormat = imc.toStringAsFixed(2);

          if (imc > 25) {
            mostrarResultado = 'O seu imc é de $imcFormat, portanto o peso não é ideal.';
          }
          else {
            mostrarResultado = 'O seu imc é de $imcFormat, portanto o peso é ideal.';
          }

      }
      else {
        mostrarResultado = "Os dois valores devem ser preenchidos.";
      }
      
    });
  }

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
      title: Text("Cálculo do IMC"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 202, 84, 37),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Peso", pesoController),
          _campo("Altura", alturaController),
          _botao(),
          _texto(mostrarResultado),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Color.fromARGB(255, 53, 12, 5))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 236, 150, 36), fontSize: 25.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcular,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color.fromARGB(255, 85, 95, 95),
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 211, 78, 37), fontSize: 25.0),
    );
  }

   _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 300.0,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/504/504272.png',
      )
    );
   }

}