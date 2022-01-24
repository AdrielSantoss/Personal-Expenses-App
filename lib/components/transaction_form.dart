import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) adicionarTransacion;

  const TransactionForm({Key? key, required this.adicionarTransacion}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm(){
    var title = titleController.text;
    var value = double.tryParse(valueController.text) ?? 0;

    if(title.isEmpty || value <= 0){
        return;
    }
    widget.adicionarTransacion(title, value, _selectedDate); //WIDGET
  }

  _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now().subtract(const Duration(days: 360)), 
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); // PROMISE! (future)
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
            SizedBox(
              height: 70,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('dd/MM/y').format(_selectedDate)),
                  TextButton(
                    child: const Text(
                      'Selecionar data',
                       style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    onPressed: _showDatePicker,
                  )
                ], 
              ),
            ),
            ElevatedButton(child: const Text('Adicionar'), onPressed: () => _submitForm())
          ],
        ),
      ),
    );
  }
}