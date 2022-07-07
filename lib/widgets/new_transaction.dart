import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountColtroller = TextEditingController();
  var _selectedDate = null;

  void submitData() {
    final enteredTitle = _titleController.text;
    if (_amountColtroller.text.isEmpty ||
        enteredTitle.isEmpty ||
        _amountColtroller.text.isEmpty ||
        _selectedDate == null) {
      return;
    }
    final enteredAmount = double.parse(_amountColtroller.text.replaceAll(',', '.'));
    if (enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountColtroller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null ? 'No Date Chosen!' : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
              ),
              AdaptiveFlatButton('Choose Date', _presentDatePicker)
            ],
          ),
          ElevatedButton(
              child: Text(
                'Add Transaction',
              ),
              onPressed: submitData)
        ]),
      ),
    );
  }
}
