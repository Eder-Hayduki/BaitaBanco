import 'package:flutter/material.dart';

import 'form_contato.dart';

class ListaContatos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Eder Luiz Hayduki',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text(
              '8000',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormContato(),
                ),
              )
              .then(
                (novoContato) => debugPrint(novoContato.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
