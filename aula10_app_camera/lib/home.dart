import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  File file;
  String foto = '';
  TextEditingController nomeController = TextEditingController();
  TextEditingController areaController = TextEditingController();
 
//Banco de dados
 _obterBanco() async {
    final db_url = await getDatabasesPath();
    final local = join(db_url, "banco_crachas.db");
 
    var retorno = await openDatabase(local, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE funcionarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, area VARCHAR, foto VARCHAR) ";
      db.execute(sql);
    });
  }

 _salvar() async {
    Database bd = await _obterBanco();

    Map<String, dynamic> funcionario  = {
      "nome": nomeController.text,
      "area": areaController.text,
      "foto": '',
    };
    int id = await bd.insert("funcionarios", funcionario);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confecção de Crachás"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Tire uma foto para o seu perfil",
            ),
            SizedBox(
              height: 20,
            ),
            file != null
                ? Image.file(file)
                : Icon(Icons.photo_camera_back_rounded, size: 110,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 60,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        _getImagemFromCamera();
                      }),
                  SizedBox(
                    width: 60,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.image,
                        size: 60,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        _getImagemFromGaleria();
                      }),
                ],
              ),
            ),
        _campo("Nome:", nomeController),
        _campo("Área:", areaController),
        _botao("Registrar"),
          ],
        ),
      ),
    );
  }
 
  void _getImagemFromCamera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
 
    setState(() {
      this.file = foto;
      this.foto = foto.toString();
    });
  }
 
  void _getImagemFromGaleria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      this.file = foto;
      this.foto = foto.toString();
    });
  } 

    _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      controller: objController,
    );
  }

    _botao(String textoBotao) {
    return RaisedButton(
        color: Colors.blue,
        padding: const EdgeInsets.all(16),
        
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            
          ),
        ),
        onPressed: () {
          _salvar();
        });
  }
}
 
