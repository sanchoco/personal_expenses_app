import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'Yout are awesome and innocent!';
    } else if (resultScore <= 16) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 30) {
      resultText = 'You are ... strange?';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          TextButton(
            child: Text(
              'Restart',
              style: TextStyle(color: Colors.pink),
            ),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
