import 'package:baitabanco/database/app_database.dart';
import 'package:baitabanco/model/contato.dart';
import 'package:flutter/material.dart';

import 'form_contato.dart';

class ListaContatos extends StatefulWidget {
  // final List<Contato> contatos = [];
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    /*contatos.add(Contato(0, 'Eder', 7000));
    contatos.add(Contato(0, 'Eduardo', 7001));
    contatos.add(Contato(0, 'Edirce', 7002)); */

    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 3)).then((value) => buscar()),
//        future: buscar(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            // antes de future ser executado
            // case ConnectionState.none:
            //break;

            //enquanto o future está carregando e não foi finalizado.
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading...'),
                  ],
                ),
              );
              break;
              // case ConnectionState.active:
              //snapshot com dados disponíveis, mas future não foi finalizado.

              break;
            case ConnectionState.done:
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return _ItemContato(contato);
                },
                itemCount: contatos.length,
              );
              break;
          }
          return Text('Erro ao carregar lista!');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormContato(),
                ),
              //).then((novoContato) => debugPrint(novoContato.toString()),
              ).then((value){
                setState((){});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;

  _ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
