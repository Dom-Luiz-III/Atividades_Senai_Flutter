import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Aplicação',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 1, 75)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Minha aplicação Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Aplicação'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Clique Aqui'),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Olá, mundo!'),
              action: SnackBarAction(
                  label: 'Fechar',
                  onPressed: () {
                    // Num rola nada e ele só fecha msm
                  }),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
