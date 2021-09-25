import 'package:flutter/material.dart';
import 'package:baitabanco/palette.dart';
import 'package:baitabanco/screens/dashboard.dart';
import 'package:baitabanco/screens/contatos.dart';
import 'package:baitabanco/screens/novoContato.dart';

void main() => runApp(BaitaBanco());

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
      home: NovoContato(),
    );
  }
}
