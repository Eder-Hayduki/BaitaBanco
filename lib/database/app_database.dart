import 'package:baitabanco/model/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// criar banco. Função para criar base de dados.

Future<Database>createDatabase(){
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'baitabanco.db');
    // join é uma função que junta diversas strings que serão enviadas como argumento.
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY,'
          'nome TEXT,'
          'numero_conta INTEGER)');
    }, version: 1);
        //,onDowngrade: onDatabaseDowngradeDelete
  });
}

Future<int> salvar(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['id'] = contato.id;
    contatoMap['nome'] = contato.nome;
    contatoMap['numero_conta'] = contato.numeroConta;

    return db.insert('contatos', contatoMap);
  });
}

Future<List<Contato>> buscar(){
  return createDatabase().then((db){
    return db.query('contatos').then((maps){
      final List<Contato> contatos = [];
      for(Map<String, dynamic> map in maps){
        final Contato contato = Contato(
            map['id'],
            map['nome'],
            map['numero_conta']
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}