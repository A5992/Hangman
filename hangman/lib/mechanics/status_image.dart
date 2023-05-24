import 'package:flutter/material.dart';

class StatusImage extends StatelessWidget {
  int incorrectGuesses;

  StatusImage({Key? key, required this.incorrectGuesses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image;
    switch (incorrectGuesses) {
      case 0:
        image = 'assets/Hangman_0.png';
        break;
      case 1:
        image = 'assets/Hangman_1.png';
        break;
      case 2:
        image = 'assets/Hangman_2.png';
        break;
      case 3:
        image = 'assets/Hangman_3.png';
        break;
      case 4:
        image = 'assets/Hangman_4.png';
        break;
      case 5:
        image = 'assets/Hangman_5.png';
        break;
      default:
        image = 'assets/Hangman_0.png';
        break;
    }

    return Image(image: AssetImage(image));
  }
}
