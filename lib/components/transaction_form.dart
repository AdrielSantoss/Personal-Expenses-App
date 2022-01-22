import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) adicionarTransacion;

  TransactionForm({Key? key, required this.adicionarTransacion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                    ),
                  ),
                  TextField(
                    controller: valueController, //formControlName
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  TextButton(child: const Text('Nova transacao'), onPressed: () => adicionarTransacion(titleController.text, double.tryParse(valueController.text) ?? 0))
                ],
              ),
            ),
        );
  }
}