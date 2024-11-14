import 'package:flutter/material.dart';

Widget botaoCancelar(BuildContext context, String label) {
  return OutlinedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text(label),
  );
}

Widget botaoAcao(context, label, funcao) {
  return ElevatedButton(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(140, 40),
    ),
    onPressed: () => funcao,
    child: Text(label),
  );
}

