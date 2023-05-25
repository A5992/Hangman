import 'package:flutter/material.dart';

class StatusImage extends StatelessWidget {
  final int incorrectGuesses;

  const StatusImage({Key? key, required this.incorrectGuesses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/Hangman_0.png',
      'assets/Hangman_1.png',
      'assets/Hangman_2.png',
      'assets/Hangman_3.png',
      'assets/Hangman_4.png',
      'assets/Hangman_5.png',
    ];

    String image =
        incorrectGuesses < images.length ? images[incorrectGuesses] : images[0];

    return Image(image: AssetImage(image));
  }
}
