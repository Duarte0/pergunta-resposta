import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final Function() onSelected;

  const Resposta(this.texto, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onSelected,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
          child: Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
