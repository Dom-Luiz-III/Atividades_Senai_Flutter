import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual foi o professor de Linguagem C no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 0},
        {'texto': 'Lucas', 'pontuacao': 0},
        {'texto': 'Ivanildo', 'pontuacao': 0},
        {'texto': 'Phillipe', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual foi o professor de UML no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 10},
        {'texto': 'Lucas', 'pontuacao': 0},
        {'texto': 'Ivanildo', 'pontuacao': 0},
        {'texto': 'Phillipe', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual foi o professor de Excel no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 0},
        {'texto': 'Lucas', 'pontuacao': 10},
        {'texto': 'Ivanildo', 'pontuacao': 0},
        {'texto': 'Phillipe', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual foi o professor de Python no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 0},
        {'texto': 'Lucas', 'pontuacao': 10},
        {'texto': 'Ivanildo', 'pontuacao': 0},
        {'texto': 'Phillipe', 'pontuacao': 0},
      ],
    },
        {
      'texto': 'Qual foi o professora de MySQL no SENAI?',
      'respostas': [
        {'texto': 'Ingrid', 'pontuacao': 0},
        {'texto': 'Thaiany', 'pontuacao': 10},
        {'texto': 'Sandrinha', 'pontuacao': 0},
        {'texto': 'Jéssica', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual a marca do robô cachorro que o SENAI CIMATEC tem?',
      'respostas': [
        {'texto': 'Samsung', 'pontuacao': 0},
        {'texto': 'Xiaomi', 'pontuacao': 0},
        {'texto': 'Unitree', 'pontuacao': 10},
        {'texto': 'Boston Dynamics', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Em que ano o SENAI foi fundado?',
      'respostas': [
        {'texto': '1964', 'pontuacao': 0},
        {'texto': '1942', 'pontuacao': 10},
        {'texto': '1987', 'pontuacao': 0},
        {'texto': '2002', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Que tipo de instituição o SENAI é?',
      'respostas': [
        {'texto': 'Organização não governamental', 'pontuacao': 0},
        {'texto': 'Pública estatal', 'pontuacao': 0},
        {'texto': 'Privada de capital aberto', 'pontuacao': 0},
        {'texto': 'Privada de interesse público', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas SENAI'),
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mountain.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: temPerguntaSelecionada
                ? DefaultTextStyle(
                    style: const TextStyle(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0),
                      child: Questionario(
                        perguntas: _perguntas,
                        perguntaSelecionada: _perguntaSelecionada,
                        quandoResponder: _responder,
                      ),
                    ),
                  )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}