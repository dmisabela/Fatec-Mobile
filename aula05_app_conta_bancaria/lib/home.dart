import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool camposPreenchidos = false;
  var nomeInf, idadeInf, sexoInf, escolaridadeInf, limiteInf, nacionalidadeInf;
 
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();

  String dropdownSexoValor = 'Feminino';
  String dropdownEscolaridadeValor = 'Educação Infantil';
  double valorSliderLimite = 1000.00;
  bool valorSwitchNacionalidade = true;
  String nacionalidadeString = 'Brasileiro';

  _obterResultado() {
    setState(() {

      if (nome.text.isNotEmpty 
      && idade.text.isNotEmpty) {
      
      nomeInf = nome.text;
      idadeInf = int.parse(idade.text);
      sexoInf = dropdownSexoValor;
      escolaridadeInf = dropdownEscolaridadeValor;
      limiteInf = valorSliderLimite;
      nacionalidadeInf = nacionalidadeString;
      camposPreenchidos = true;
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
      title: Text("Abertura de Conta"),
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
          _campoNome("Nome", nome),
          _campoIdade("Idade", idade),
          _dropdownSexo(),
          _dropdownEscolaridade(),
          _texto("Limite:"),
          _sliderLimite(),          
          _textoCentro(valorSliderLimite.toStringAsFixed(2).toString()), 
          _switchNacionalidade(),
          _textoCentro(nacionalidadeString), 
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
          _textoCentro("Dados informados: "),
          _texto("Nome: $nomeInf"),
          _texto("Idade: $idadeInf"),
          _texto("Sexo: $sexoInf"),
          _texto("Escolaridade: $escolaridadeInf"),
          _texto("Limite: $limiteInf"),
          _texto("Nacionalidade: $nacionalidadeInf"),          
        ],
      ),
    );
    }
    else {
      return Text(
      "Todos os campos devem ser preenchidos",
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

   _dropdownSexo() {
    return DropdownButton<String>(
      value: dropdownSexoValor,
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
          dropdownSexoValor = newValue!;
        });
      },
      items: <String>['Feminino', 'Masculino', 'Prefiro não informar']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

   _dropdownEscolaridade() {
    return DropdownButton<String>(
      value: dropdownEscolaridadeValor,
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
          dropdownEscolaridadeValor = newValue!;
        });
      },
      items: <String>['Educação Infantil', 'Fundamental', 'Médio', 'Superior', 'Pós-Graduação', 'Mestrado', 'Doutorado']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

   _sliderLimite() {
    return Slider(
      value: valorSliderLimite,
      min: 0,
      max: 10000,
      divisions: 100,
      label: valorSliderLimite.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSliderLimite = value;
        });
      },
      thumbColor: Colors.purpleAccent,
      activeColor: Colors.deepPurple,
    );
  }

  _switchNacionalidade() {
    return Switch(
      value: valorSwitchNacionalidade,
      onChanged: (value) {
        setState(() {
          valorSwitchNacionalidade = value; 
          nacionalidadeString = valorSwitchNacionalidade ? 'Brasileiro' : 'Estrangeiro';
        });
      },
      activeTrackColor: Colors.deepPurple,
      activeColor: Colors.purpleAccent,
    );
  }

  _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 200.0,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/3164/3164118.png',
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