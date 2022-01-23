import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double value;
  final double percentage;
  const ChartBar({ Key? key, required this.label, required this.value, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text('R\$${value.toStringAsFixed(2)}'),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            height: 60,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0
                    ),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                  )
                )
              ]
            ),
          ),
          Text(label),
        ],
    );
  }
}