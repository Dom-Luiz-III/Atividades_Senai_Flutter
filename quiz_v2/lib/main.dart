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
        {'texto': 'Maxuel', 'pontuacao': 1},
        {'texto': 'Lucas', 'pontuacao': 1},
        {'texto': 'Ivanildo', 'pontuacao': 1},
        {'texto': 'Phillipe', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual foi o professor de UML no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 10},
        {'texto': 'Lucas', 'pontuacao': 1},
        {'texto': 'Ivanildo', 'pontuacao': 1},
        {'texto': 'Phillipe', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual foi o professor de Excel no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 1},
        {'texto': 'Lucas', 'pontuacao': 10},
        {'texto': 'Ivanildo', 'pontuacao': 1},
        {'texto': 'Phillipe', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual foi o professor de Python no SENAI?',
      'respostas': [
        {'texto': 'Maxuel', 'pontuacao': 1},
        {'texto': 'Lucas', 'pontuacao': 10},
        {'texto': 'Ivanildo', 'pontuacao': 1},
        {'texto': 'Phillipe', 'pontuacao': 1},
      ],
    }
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mountain.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: temPerguntaSelecionada
                ? DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Questionario(
                      perguntas: _perguntas,
                      perguntaSelecionada: _perguntaSelecionada,
                      quandoResponder: _responder,
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
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
