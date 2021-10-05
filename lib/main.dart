import 'package:baitabanco/model/contato.dart';
import 'package:flutter/material.dart';
import 'package:baitabanco/palette.dart';
import 'package:baitabanco/screens/dashboard.dart';
import 'package:baitabanco/screens/lista_contatos.dart';
import 'package:baitabanco/screens/form_contato.dart';
import 'database/app_database.dart';


void main() {
  runApp(BaitaBanco());
  salvar(Contato(0, 'CarecaBarrigudo', 8000)).then((id){
   buscar().then((contatos) => debugPrint(contatos.toString()));
  });
}

class BaitaBanco extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[700],
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch:Palette.darkGreen).copyWith(secondary: Colors.green[900])
      ),
      home: DashBoard(),
    );
  }
}

