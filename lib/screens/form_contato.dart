import 'package:baitabanco/model/contato.dart';
import 'package:flutter/material.dart';

class FormContato extends StatefulWidget {

  @override
  _FormContatoState createState() => _FormContatoState();

}

class _FormContatoState extends State<FormContato> {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Numero da conta',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: (){
                    final nome = _nomeController.text;
                    final numeroConta = int.tryParse(_numeroContaController.text);
                    final Contato novoContato = Contato(0, nome, numeroConta!);
                    Navigator.pop(context, novoContato);
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}