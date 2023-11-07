import 'package:flutter/material.dart';
import 'segunda_pagina.dart';


void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Arquivos separados',
      theme: ThemeData(
      ),
      home: HomePage(),
      routes: {
        '/segunda': (context) => SegundaPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Arquivos separados'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir para a Segunda Página'),
          onPressed: () {
            Navigator.pushNamed(context, '/segunda');
          },
        ),
      ),
    );
  }
}