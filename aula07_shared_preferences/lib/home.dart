import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Sem frases salvas!";
  TextStyle estiloTexto = TextStyle(fontSize: 25, color: Color.fromARGB(255, 222, 176, 226));
  TextStyle color = TextStyle(color: Colors.black);
  bool dia = false;
  bool menor = false;
  String textoSalvo = "";
  String tema = "";

  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {    
    String estiloTextoDefinido = menor.toString();
    String colorDefinido = dia.toString();
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);    
    await prefs.setString("texto", estiloTextoDefinido);
    await prefs.setString("tema", colorDefinido);
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString("nome").toString();
      textoSalvo = prefs.getString("texto").toString();
      tema = prefs.getString("tema").toString();

      menor = textoSalvo == "false" ? false : true;
      dia = textoSalvo == "false" ? false : true;

    });
  }
  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("nome");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //Tema dia
                Row(
                  children: <Widget>[
                    Text(
                      "Tema: Dia",
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                        value: dia,
                        activeTrackColor: Color.fromARGB(255, 137, 16, 185),
                        activeColor: Color.fromARGB(255, 159, 33, 243),
                        onChanged: (value) {
                          setState(() {
                            dia = value;
                            if (dia == true) {
                              dia = value;
                              color = TextStyle(color: Colors.white);
                              estiloTexto = TextStyle(
                                  color: Colors.black,
                                  fontSize: estiloTexto.fontSize);
                            } 
                            else if (dia == false) {
                              dia = value;
                              color = TextStyle(color: Colors.black);
                              estiloTexto = TextStyle(
                                  color: Colors.white,
                                  fontSize: estiloTexto.fontSize);
                            }
                          });
                        }),
                  ],
                ),
                //texto pequeno
                Row(
                  children: <Widget>[
                    Text(
                      "Texto: Menor",
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                        value: menor,
                        activeTrackColor: Colors.black,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            menor = value;
                            if (menor == true) {
                              menor = value;
                              estiloTexto = TextStyle(
                                  fontSize: 15, color: estiloTexto.color);
                            } 
                            else if (menor == false) {
                              menor = value;
                              estiloTexto = TextStyle(
                                  fontSize: 25, color: estiloTexto.color);
                            }
                          });
                        }),
                  ],
                ),
              ],
            ),

            Card(
                color: color.color,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    style: estiloTexto,
                    maxLines: 15, //or null
                    decoration: InputDecoration(
                        labelText: "Insira sua frase aqui!",
                        fillColor: Color.fromARGB(255, 173, 60, 218)),
                    controller: _controllerCampo,
                    keyboardType: TextInputType.text,

                    //_textoSalvo,
                    //style: TextStyle(fontSize: 20),
                  ),
                )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[              
              RaisedButton(
                color: Color.fromARGB(255, 72, 8, 109),
                textColor: Colors.white,
                padding: EdgeInsets.all(25),
                child: Text("Salvar", style: TextStyle(fontSize: 15)),
                onPressed: _salvar,
              ),
              RaisedButton(
                color: Color.fromARGB(255, 115, 16, 196),
                textColor: Colors.white,
                padding: EdgeInsets.all(25),
                child: Text("Recuperar", style: TextStyle(fontSize: 15)),
                onPressed: _recuperar,
              ),
            ]),

            Container(              
              padding: EdgeInsets.all(30),
              color: color.color,
              child: Text(
                _textoSalvo,
                style: estiloTexto,
              ),
            )
          ],
        ),
      ),
    );
  }
}
