import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountColtroller = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController),
          TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountColtroller),
          TextButton(
              child: Text('Add Transaction', style: TextStyle(color: Colors.purple)),
              onPressed: () {
                addTx(titleController.text, double.parse(amountColtroller.text));
              })
        ]),
      ),
    );
  }
}
