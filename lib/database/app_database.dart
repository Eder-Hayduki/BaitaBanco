import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// criar banco. Função para criar base de dados.

void createDatabase(){
  getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'baitabanco.db'); // join é uma função que junta diversas strings que serão enviadas como argumento.
    openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY,'
          'nome TEXT,'
          'numero_conta INTEGER)');
    }, version: 1);
  });
}