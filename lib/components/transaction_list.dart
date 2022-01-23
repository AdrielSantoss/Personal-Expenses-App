import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({ Key? key, required this.transactions }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: transactions.isEmpty ? Column(
          children: [
            Text('Nenhuma transação cadastrada!', style: Theme.of(context).textTheme.headline6),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              height: 200,
              child: Image.asset(
                'assets/imgs/waiting.png', 
                fit: BoxFit.cover
              ),
            )
          ]
          ) : ListView.builder(itemBuilder: (ctx, index) {
          final tran = transactions[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(child: Text('R\$${tran.value}')),
                ),
              ),
              title: Text(
                tran.title,
                style: Theme.of(context).textTheme.headline6
              ),
              subtitle: Text(
                DateFormat('d/MMM/y').format(tran.date)
              ),
              //trailing:  (final)
            ),
          );
        }, 
        itemCount: transactions.length,
      )
    );
  }
}