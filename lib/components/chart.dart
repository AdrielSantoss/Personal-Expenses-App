import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart({ Key? key, required this.recentTransaction }) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
      return List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index) // pegar ultimos dias da semana
        );

        double totalSum = 0.0;

        for(var tran in recentTransaction) {
          bool sameDay = tran.date.day == weekDay.day;
          bool sameMonth = tran.date.month == weekDay.month;
          bool sameYear = tran.date.year == weekDay.year;

          if(sameDay && sameMonth && sameYear) {
            totalSum += tran.value;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay)[0],
          'value': totalSum
        };
      }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + double.parse(item['value'].toString()); 
    }); // reduce
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((tr) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tr['day'].toString(),
                  value: double.parse(tr['value'].toString()),
                  percentage: _weekTotalValue == 0 ? 0.0 : (tr['value'] as double) / _weekTotalValue
                ),
              );
            }).toList()
          ),
        ),
    );
  }
}