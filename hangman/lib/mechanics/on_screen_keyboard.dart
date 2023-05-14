import 'package:flutter/material.dart';

class OnScreenKeyboard extends StatefulWidget {
  final Function(String) onLetterPressed;

  const OnScreenKeyboard({Key? key, required this.onLetterPressed})
      : super(key: key);

  @override
  State<OnScreenKeyboard> createState() => _OnScreenKeyboardState();
}

class _OnScreenKeyboardState extends State<OnScreenKeyboard> {
  final Set<String> _guessedLetters = {};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 26,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, int index) {
        String letter = String.fromCharCode(index + 65);
        bool alreadyPressed = _guessedLetters.contains(letter);

        return ElevatedButton(
          onPressed: alreadyPressed
              ? null
              : () {
                  setState(() {
                    _guessedLetters.add(letter);
                  });
                  widget.onLetterPressed(letter);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: alreadyPressed ? Colors.grey : Colors.blue,
          ),
          child: Text(letter),
        );
      },
    );
  }
}
