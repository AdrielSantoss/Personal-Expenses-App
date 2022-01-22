import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({ Key? key }) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: 't1', title: 'Novo tenis de Corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 210.76, date: DateTime.now()),
  ];

  _adicionarTransacion(String title, double value) => setState(() {
      _transactions.add(
        Transaction(
          id: Random().nextDouble().toString(), 
          title: title, value: value,
          date: DateTime.now()
        )
      );
    });  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          TransactionForm(adicionarTransacion: _adicionarTransacion),
          TransactionList(transactions: _transactions)
      ],
    );
  }
}