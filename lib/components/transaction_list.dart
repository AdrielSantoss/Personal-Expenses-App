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
                      'R\$ ${tran.value.toStringAsFixed(2)}', 
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
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'
                        ),
                      ),
                      Text(
                        DateFormat('d/MMM/y').format(tran.date),
                        style: TextStyle(
                          color: Colors.grey.shade600
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
        }, 
        itemCount: transactions.length,
      )
    );
  }
}