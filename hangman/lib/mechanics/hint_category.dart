import 'package:flutter/material.dart';

class HintCategory extends StatelessWidget {
  final String category;
  final bool hintsEnabled;

  const HintCategory(
      {Key? key, required this.category, required this.hintsEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      hintsEnabled ? '$category ' : "",
      style: const TextStyle(fontSize: 20),
    );
  }
}
