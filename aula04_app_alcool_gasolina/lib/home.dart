import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String mostrarResultado = "Informe os valores!";

  void _calcular() {
    setState(() {

      if (alcoolController.text.isNotEmpty && gasolinaController.text.isNotEmpty) {
      
      double alc = double.parse(alcoolController.text);
      double gas = double.parse(gasolinaController.text);

      double divisao = alc / gas;

          if (divisao <= 0.7) {
            mostrarResultado = 'É mais vantajoso abastecer com álcool';
          }
          else {
            mostrarResultado = 'É mais vantajoso abastecer com gasolina';
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
      title: Text("Álcool ou gasolina?"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 201, 52, 26),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Preço do álcool", alcoolController),
          _campo("Preço da gasolina", gasolinaController),
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
      style: TextStyle(color: Color.fromARGB(255, 140, 20, 20), fontSize: 25.0),
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
          color: Color.fromARGB(255, 74, 183, 187),
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 73, 7, 7), fontSize: 25.0),
    );
  }

   _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 300.0,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/183/183212.png',
      )
    );
   }

}