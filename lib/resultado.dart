import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function() _reinicarQuestionario;

  const Resultado(this.pontuacao, this._reinicarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nívem Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: _reinicarQuestionario,
          child: const Text(
            'Reinicar',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20
            ),
          ),
        )
      ],
    );
  }
}
