import 'package:app_1/questao.dart';
import 'package:app_1/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function(int) responder;

  const Questionario({
    super.key,
    required this.responder,
    required this.perguntas,
    required this.perguntaSelecionada,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : []; // null?

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) => Resposta(resp['texto'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString()))))
      ],
    );
  }
}
