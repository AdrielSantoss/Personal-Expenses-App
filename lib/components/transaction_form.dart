import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) adicionarTransacion;

  const TransactionForm({Key? key, required this.adicionarTransacion}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
    var title = titleController.text;
    var value = double.tryParse(valueController.text) ?? 0;

    if(title.isEmpty || value <= 0){
        return;
    }
    widget.adicionarTransacion(title, value); //WIDGET
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