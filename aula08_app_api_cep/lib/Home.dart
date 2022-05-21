import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String info_endereco = '';
  String erro_msg = "Ocorreu um erro ao buscar os dados, insira um CEP válido e tente novamente.";
  var erro;
 
  _recuperarCep() async {

    if(cepController.text.isNotEmpty) {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';
 
    print(url);

    try {

        http.Response response = await http.get(Uri.parse(url));
        Map<String, dynamic> retorno = json.decode(response.body);

        if(response.statusCode == 200) {
            if(!(retorno["logradouro"] == null || retorno["logradouro"] == "")) {
                String cep = cepController.text;
                String logradouro = retorno["logradouro"];
                String bairro = retorno["bairro"];
                String localidade = retorno["localidade"];
                String uf = retorno["uf"];
            
                setState(() {
                  info_endereco =
                      ' Cep: $cep \n Logradouro: $logradouro \n Bairro: $bairro \n Cidade: $localidade \n Estado: $uf';
                });           
            }
            else {
              setState(() {
              info_endereco = erro_msg;
              });
            } 
        }
        

      } on Exception catch (e) {
         setState(() {
          info_endereco = erro_msg;
         });
      }
    }
    else {
      setState(() {
          info_endereco =
             'Preencha o campo de CEP.';
        });
    }
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CEP x Endereço"),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Digite o CEP",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 68, 18, 88))),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 16, 1, 26), fontSize: 25.0),              
                  controller: cepController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
              ),
              Flexible(
              child: Container(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: _recuperarCep,
                  child: Icon(Icons.arrow_right, color: Colors.white)),
                  
                 ),
               ),         
            ],
           ),   
           Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(info_endereco, style: const TextStyle(color: Colors.deepPurple, fontSize: 25)),   
                 ),
              ),                   
          ],
        ),
      ),
    );
  }
}

/*


            


            */