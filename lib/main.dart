import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [];
  final titleController = TextEditingController();
  final amountColtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            elevation: 5,
            child: Container(
              child: Text('CHART!'),
              width: double.infinity,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController),
                TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountColtroller),
                TextButton(
                  child: Text('Add Transaction', style: TextStyle(color: Colors.purple)),
                  onPressed: () {
                    print(titleController.text);
                    print(amountColtroller.text);
                  },
                )
              ]),
            ),
          ),
          TransactionList()
        ],
      ),
    );
  }
}
