import 'package:app_1/questionario.dart';
import 'package:app_1/resultado.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const PerguntaApp());
}

// StatelessWidget é imutavel - pode mudar externamente(re-renderiza), dentro do componente sao const
// StatefulWidget é mutavel - pode mudar a UI intermanete
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacao': 5},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'branco', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 10},
        {'texto': 'cobra', 'pontuacao': 5},
        {'texto': 'elefante', 'pontuacao': 3},
        {'texto': 'leao', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é seu instrutor favorito?',
      'respostas': [
        {'texto': 'maria', 'pontuacao': 10},
        {'texto': 'joao', 'pontuacao': 5},
        {'texto': 'leo', 'pontuacao': 3},
        {'texto': 'pedro', 'pontuacao': 1},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  _reinicarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  // construtor
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[700],
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  responder: _responder,
                  perguntaSelecionada: _perguntaSelecionada)
              : Resultado(_pontuacaoTotal, _reinicarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
