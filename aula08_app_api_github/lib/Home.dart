import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController gitController = TextEditingController();
  String info_user = '';
  String erro_msg = "Ocorreu um erro ao buscar os dados, insira um username válido e tente novamente.";
  var erro;  
  String iconGithub = "https://cdn-icons-png.flaticon.com/512/25/25231.png";
  String foto = "https://cdn-icons-png.flaticon.com/512/25/25231.png";
 
  _recuperarUsuario() async {

    if(gitController.text.isNotEmpty) {
    String url = 'https://api.github.com/users/${gitController.text}';
 
    print(url);

    try {

        http.Response response = await http.get(Uri.parse(url));
        Map<String, dynamic> retorno = json.decode(response.body);
        print(response.statusCode);

        if(response.statusCode == 200) {
                int id = retorno["id"];
                String nome = (retorno["name"] == null) ? "Não informado" : retorno["name"];
                int repositorios = retorno["public_repos"]; 
                String criadoEm = retorno["created_at"];
                int seguidores = retorno["followers"];
                int seguindo = retorno["following"];          
                
            
                setState(() {
                  info_user =
                      ' Id: $id \n Nome: $nome \n Repositórios: $repositorios \n Criado em: $criadoEm \n Seguidores: $seguidores \n Seguindo: $seguindo';

                  foto = retorno["avatar_url"]; 

                });     
          }

          else {
          setState(() {
              info_user =
                'Preencha o campo de usuário com um usuário válido.';
              foto = iconGithub;
            });
        }       

      } on Exception catch (e) {
         setState(() {
          info_user = erro_msg;
          foto = iconGithub;
         });
      }
    }
   
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Devs"),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _foto(),
            ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Digite o username",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 68, 18, 88))),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 16, 1, 26), fontSize: 25.0),              
                  controller: gitController,
                ),
              ),
              Flexible(
              child: Container(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: _recuperarUsuario,
                  child: Icon(Icons.arrow_right, color: Colors.white)),
                  
                 ),
               ),         
            ],
           ),   
           Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(info_user, style: const TextStyle(color: Colors.deepPurple, fontSize: 25)),   
                 ),
              ),                   
          ],
        ),
      ),
    );
  }


  _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 300.0,
      child: Image.network(
        foto,
      )
    );
   }


}

