import 'package:flutter/material.dart';
import 'helper/CompraHelper.dart';
import 'model/Compra.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController  _mercadoriaController = TextEditingController();
  TextEditingController _qtController = TextEditingController();
  var _db = CompraHelper();
  // ignore: deprecated_member_use
  List<Compra> _compra = List<Compra>();

  _exibirTelaCadastro({Compra compra}) {
    String textoSalvarAtualizar = "";
    if (compra == null) {
      //salvando
      _mercadoriaController.text = "";
      _qtController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _mercadoriaController.text = compra.mercadoria;
      _qtController.text = compra.qt;
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar "),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _mercadoriaController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Mercadoria", hintText: "Digite mercadoria..."),
                ),
                TextField(
                  controller: _qtController,
                  decoration: InputDecoration(
                      labelText: "Qt", hintText: "Digite qt..."),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarCompra(compraSelecionada: compra);

                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }

  _recuperarCompra() async {
    List comprasRecuperadas = await _db._recuperarCompra();

    List<Compra> listaTemporaria = List<Compra>();
    for (var item in comprasRecuperadas) {
      Compra compra = Compra.fromMap(item);
      listaTemporaria.add(compra);
    }

    setState(() {
      _compra = listaTemporaria;
    });
    listaTemporaria = null;

  }

  _salvarAtualizarCompra({Compra compraSelecionada}) async {
    String mercadoria = _mercadoriaController.text;
    String qt = _qtController.text;

    if (compraSelecionada == null) {
      //salvar
      Compra compra =
          Compra(mercadoria, qt);
      int resultado = await _db.salvarCompra(compra);
    } else {
      //atualizar
      compraSelecionada.mercadoria = mercadoria;
      compraSelecionada.qt = qt;
      int resultado = await _db.atualizarCompra(compraSelecionada);
    }

    _mercadoriaController.clear();
    _qtController.clear();

    _recuperarCompra();
  }

  _removerCompra(int id) async {
    await _db.removerCompra(id);

    _recuperarCompra();
  }

  @override
  void initState() {
    super.initState();
    _recuperarCompra();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas tarefas"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _compra.length,
                  itemBuilder: (context, index) {
                    final compra = _compra[index];

                    return Card(
                      child: ListTile(
                        title: Text(compra.mercadoria),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(compra: compra);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.deepPurple
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerCompra(compra.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
