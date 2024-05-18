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
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': ['preto', 'vermelho', 'verde', 'branco']
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['coelho', 'cobra', 'elefante', 'leao']
    },
    {
      'texto': 'Qual é seu instrutor favorito?',
      'respostas': ['maria', 'joao', 'leo', 'pedro']
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
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
              : const Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
