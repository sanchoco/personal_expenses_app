import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final void Function() selectHandler;
  const Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blueGrey, onPrimary: Colors.white),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
