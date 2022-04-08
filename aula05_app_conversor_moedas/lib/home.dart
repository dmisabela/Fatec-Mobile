import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool camposPreenchidos = false;
  var valorInf, deInf, paraInf;
 
  TextEditingController valor = TextEditingController();

  String dropdownDe = 'Real';
  String dropdownPara = 'Dólar';
  double result = 0.0;
  double resultFormat = 0.0;

  _obterResultado() {
    setState(() {

      if (valor.text.isNotEmpty) {
      
      valorInf = double.parse(valor.text);
      deInf = dropdownDe;
      paraInf = dropdownPara;
      camposPreenchidos = true;

          if (deInf == 'Dólar' && paraInf == 'Real') {
            result = valorInf * 4.75;
          } else if (deInf == 'Dólar' && paraInf == 'Euro') {
            result = valorInf * 0.91;
          } else if (deInf == 'Dólar' && paraInf == 'Dólar') {
            result = valorInf;
          } else if (deInf == 'Euro' && paraInf == 'Real') {
            result = valorInf * 5.16;
          } else if (deInf == 'Euro' && paraInf == 'Dólar') {
            result = valorInf * 1.09;
          } else if (deInf == 'Euro' && paraInf == 'Euro') {
            result = valorInf;
          } else if (deInf == 'Real' && paraInf == 'Dólar') {
            result = valorInf * 0.21;
          } else if (deInf == 'Real' && paraInf == 'Euro') {
            result = valorInf * 0.19;
          } else if (deInf == 'Real' && paraInf == 'Real') {
            result = valorInf;
          }

          resultFormat = double.parse(result.toStringAsFixed(2));

      }
      else {
        camposPreenchidos = false;
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
      title: Text("Conversor de Moedas"),
      centerTitle: true,
      backgroundColor: Colors.purple.shade900,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _corpoFormulario(),
          _botao(),
          _corpoResultado(camposPreenchidos),        
          
        ],
      ),
    );
  }

   _corpoFormulario() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campoNome("Valor", valor),
          _dropdownDe(),
          _dropdownPara(),
        ],
        
      ),
    );
  }

  _corpoResultado(bool camposPreenchidos) {
    if (camposPreenchidos) {
      return Container(   
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,        
        children: <Widget>[        
          _texto("Valor em $paraInf: $resultFormat"),         
        ],
      ),
    );
    }
    else {
      return Text(
      "Informar o valor",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.purple.shade900, fontSize: 25.0),
    );
    }   
    
  }

  _campoNome(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.purple.shade800)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.purple.shade900, fontSize: 25.0),
      controller: objController,
    );
  }

  _campoIdade(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.purple.shade800)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.purple.shade900, fontSize: 25.0),
      controller: objController,
    );
  }

   _dropdownDe() {
    return DropdownButton<String>(
      value: dropdownDe,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 25.0),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownDe = newValue!;
        });
      },
      items: <String>['Real', 'Dólar', 'Euro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

   _dropdownPara() {
    return DropdownButton<String>(
      value: dropdownPara,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 25.0),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownPara = newValue!;
        });
      },
      items: <String>['Real', 'Dólar', 'Euro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 200.0,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/3347/3347728.png',
      )
    );
   }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
          setState(() {
          _obterResultado();
         });
          },
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.deepPurple,
        ),
      ),
    );
    
  }
  
  _texto(textoParaExibir) {    
    return Text(      
      textoParaExibir,
      textAlign: TextAlign.justify,
      style: TextStyle(color: Colors.purple.shade900, fontSize: 25.0),
      
    );
  }

  _textoCentro(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.purple.shade900, fontSize: 25.0),
    );
  }

  
}