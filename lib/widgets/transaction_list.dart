import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).primaryColor;
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(border: Border.all(color: themeColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: themeColor),
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '${DateFormat('yyyy/MM/dd HH:mm:ss').format(transactions[index].date)}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
