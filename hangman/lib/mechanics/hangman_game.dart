import 'package:flutter/material.dart';
import 'package:hangman/mechanics/hangman_words.dart';
import 'package:hangman/mechanics/on_screen_keyboard.dart';
import 'package:hangman/mechanics/status_image.dart';
import 'package:hangman/mechanics/underscores.dart';
import 'package:hangman/mechanics/hint_category.dart';

class HangmanGame extends StatefulWidget {
  const HangmanGame({Key? key}) : super(key: key);

  @override
  State<HangmanGame> createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  late String _word;
  late String _category;
  late List<String> _displayedWord;
  final Set<String> _guessedLetters = {};
  String get _displayedWordWithUnderscores =>
      _displayedWord.map((c) => c == '_' ? '_ ' : '$c ').join();

  @override
  void initState() {
    super.initState();
    final wordAndCategory = _randomWordAndCategory();
    _word = wordAndCategory.word;
    _category = wordAndCategory.category;
    _displayedWord = List.generate(_word.length, (_) => '_');
  }

  WordAndCategory _randomWordAndCategory() {
    return WordAndCategory(
      word: 'Berlin',
      category: 'Cities',
    );
  }

  void _guessLetter(String letter) {
    setState(() {
      _guessedLetters.add(letter);
    });
    if (_word.contains(letter)) {
      for (int i = 0; i < _word.length; i++) {
        if (_word[i] == letter) {
          setState(() {
            _displayedWord[i] = letter;
          });
        }
      }
    }
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
            _displayedWordWithUnderscores,
            style: const TextStyle(fontSize: 50),
          ),
          OnScreenKeyboard(
            onLetterPressed: _guessLetter,
          ),
          HintCategory(category: _category),
        ],
      ),
    );
  }
}

class WordAndCategory {
  final String word;
  final String category;

  WordAndCategory({required this.word, required this.category});
}
