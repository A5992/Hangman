import 'package:flutter/material.dart';

class HintCategory extends StatelessWidget {
  final String category;

  const HintCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$category ',
      style: const TextStyle(fontSize: 20),
    );
  }
}
