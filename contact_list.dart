import 'package:fiap_sqlite/Database/script.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> _buscador() async {
    String path = join(await getDatabasesPath(), 'banco');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute(createTable);
        db.execute(insertDados);
      },
    );
    return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
      ),
      body: FutureBuilder(
        future: _buscador(),
        builder: (context, dadosfuturo) {
          dynamic lista = dadosfuturo.data;
          if (dadosfuturo.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              var contato = lista[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(contato['url_avatar']),
                ),
                title: Text(contato['nome']),
                subtitle: Text(contato['telefone']),
              );
            },
          );
        },
      ),
    );
  }
}
