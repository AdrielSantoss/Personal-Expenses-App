import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) adicionarTransacion;

  TransactionForm({Key? key, required this.adicionarTransacion}) : super(key: key);

  _submitForm(){
    var title = titleController.text;
    var value = double.tryParse(valueController.text) ?? 0;

    if(title.isEmpty || value <= 0){
        return;
    }
    adicionarTransacion(title, value);
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController, //formControlName
              keyboardType: const TextInputType.numberWithOptions(decimal: true), //habilitar casas decimal no IOS
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            TextButton(child: const Text('Nova transacao'), onPressed: () => _submitForm())
          ],
        ),
      ),
    );
  }
}