import 'package:flutter/material.dart';
import 'pessoal.dart';
import 'experiencia.dart';
import 'formacao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  String titulo = "Navegação";

  final telas = [
    Center(child: Text('')),
    pessoal(),
    experiencia(),
    formacao(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
            _foto(),
            Text(
              'Isabela Duarte', //texto
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Home'),
              subtitle: Text('Tela inicial do App'),
              trailing: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                  titulo = "Navegação";
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Sobre mim! :)'),

              onTap: () {
                setState(() {
                  _currentPage = 1;
                  titulo = "Pessoal";
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Minha(s) formação(ões) :)'),

              onTap: () {
                setState(() {
                  _currentPage = 3;
                  titulo = "Formação";
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiência'),
              subtitle: Text('Um pouco da minha experiência :)'),

              onTap: () {
                setState(() {
                  _currentPage = 2;
                  titulo = "Experiência";
                });
              },
            ),
          ],
        )),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text(titulo),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _foto() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 300.0,
      child: Image.network(
        'https://avatars.githubusercontent.com/u/80857238?v=4',
      )
    );
   }


}
