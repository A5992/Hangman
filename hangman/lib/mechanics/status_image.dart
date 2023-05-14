

import 'package:flutter/material.dart';

class StatusImage extends StatelessWidget {
  const StatusImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.sentiment_very_dissatisfied,
      size: 100,
      color: Colors.red,
    );
  }
}
