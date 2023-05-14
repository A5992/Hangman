import 'package:flutter/material.dart';
import 'package:hangman/mechanics/hangman_words.dart';

class HangmanGame extends StatefulWidget {
  const HangmanGame({Key? key}) : super(key: key);

  @override
  _HangmanGameState createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  late WordCategory _wordCategory;
  late String _underscores;

  @override
  void initState() {
    super.initState();
    _wordCategory = getRandomWord();
    _underscores = '_ ' * _wordCategory.word.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hangman'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StatusImage(),
            Text(
              _underscores,
              style: const TextStyle(fontSize: 50),
            ),
            const GuessedLetters(),
            HintCategory(category: _wordCategory.category),
          ],
        ));
  }
}

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

class GuessedLetters extends StatelessWidget {
  const GuessedLetters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Guessed Letters: ',
      style: TextStyle(fontSize: 20),
    );
  }
}

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
