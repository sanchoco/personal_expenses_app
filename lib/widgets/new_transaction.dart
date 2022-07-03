import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountColtroller = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    if (enteredTitle.isEmpty || amountColtroller.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(amountColtroller.text.replaceAll(',', '.'));
    if (enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountColtroller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData,
          ),
          TextButton(child: Text('Add Transaction', style: TextStyle(color: Colors.purple)), onPressed: submitData)
        ]),
      ),
    );
  }
}
