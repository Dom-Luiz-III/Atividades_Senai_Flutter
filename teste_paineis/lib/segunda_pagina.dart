import 'package:flutter/material.dart';

class SegundaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Página'),
      ),
      body: Center(
        child: Text('Bem-vindo à segunda página!'),
      ),
    );
  }
}