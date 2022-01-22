import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExtensesApp());

class ExtensesApp extends StatelessWidget {
  const ExtensesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final _transactions = [
    Transaction(id: 't1', title: 'Novo tenis de Corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 210.76, date: DateTime.now()),
  ];

  MyHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           const SizedBox(
              width: double.infinity,
              child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tran){
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ), 
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        tran.value.toString(), 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                        ),
                        )
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tran.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          tran.date.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade600
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      )
    );
  }
}