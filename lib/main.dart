import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() {
  runApp(WordsApp());
}

class WordsApp extends StatelessWidget {
  const WordsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
