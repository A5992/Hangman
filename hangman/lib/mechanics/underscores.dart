import 'package:flutter/material.dart';

class Underscores extends StatelessWidget {
  const Underscores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '_ _ _ _',
      style: TextStyle(fontSize: 50),
    );
  }
}