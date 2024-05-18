import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Acabaram as perguntas!',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
