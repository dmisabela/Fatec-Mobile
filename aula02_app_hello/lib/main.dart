import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red
      ),
      home: home(),
    );
  }
}
 
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Hello!"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 51, 1, 92),
        
      ),
      body: Container(
        color: Color.fromARGB(255, 247, 214, 253),
        child: const Center(
          child: Text("Hello, Isabela!",
          style: TextStyle(
            fontSize: 45,
            color: Color.fromARGB(255, 51, 1, 92),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decorationStyle: TextDecorationStyle.dashed,
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 185, 109, 247),
        child: const Icon(Icons.star),
      ),

    );
  }
}

