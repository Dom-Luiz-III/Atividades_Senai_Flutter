import 'package:flutter/material.dart';
import 'classes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Classe Carro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarroScreen(),
    );
  }
}

class CarroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Classe Carro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarroWidget(Carro('Corolla', 'Toyota', 2022)),
            CarroWidget(Carro('Uno', 'FIAT', 2016)),
            CarroWidget(Carro('Onix', 'Chevrolet', 2018)),
            CarroWidget(Carro('Toro', 'FIAT', 2023)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100, // Defina a largura desejada
                  height: 100, // Defina a altura desejada
                  child: Image.asset('lib/images/uno.jpg'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('lib/images/corolla.jpg'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('lib/images/toro.webp'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarroWidget extends StatelessWidget {
  final Carro carro;

  CarroWidget(this.carro);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Marca: ${carro.marca}'),
          Text('Modelo: ${carro.modelo}'),
          Text('Ano: ${carro.ano}'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content:
                      Text('O ${carro.marca} ${carro.modelo} está acelerando!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Acelerar'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content:
                      Text('O ${carro.marca} ${carro.modelo} está freando!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Frear'),
            ),
          ),
        ],
      ),
    );
  }
}
