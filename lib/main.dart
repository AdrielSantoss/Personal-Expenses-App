import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(const ExtensesApp());

class ExtensesApp extends StatelessWidget {
  const ExtensesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHome(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
          primaryColor: Colors.purple,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) { // filter
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7)
      ));
    }).toList(); 
  }

  _adicionarTransacion(String title, double value, DateTime date) { 
    setState(() {
      _transactions.add(
        Transaction(
          id: Random().nextDouble().toString(), 
          title: title,
          value: value,
          date: date
        )
      );
    });  

    Navigator.of(context).pop(); //close modal
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tran) => tran.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(adicionarTransacion: _adicionarTransacion);
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransaction: _recentTransactions),
            TransactionList(transactions: _transactions, delete: _deleteTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),  
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}