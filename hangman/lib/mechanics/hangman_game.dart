import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/mechanics/hangman_words.dart';
import 'package:hangman/mechanics/on_screen_keyboard.dart';
import 'package:hangman/mechanics/status_image.dart';
import 'package:hangman/mechanics/hint_category.dart';
import 'package:audioplayers/audioplayers.dart';

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
  final player = AudioCache();
  String get _displayedWordWithUnderscores =>
      _displayedWord.map((c) => c == '_' ? '_ ' : '$c ').join();

  final int _maxIncorrectGuesses = 6;
  int _currentIncorrectGuesses = 0;

  @override
  void initState() {
    super.initState();
    final wordAndCategory = _randomWordAndCategory();
    _word = wordAndCategory.word;
    _category = wordAndCategory.category;
    _displayedWord = List.generate(_word.length, (_) => '_');
  }

  WordAndCategory _randomWordAndCategory() {
    final random = Random();

    if (words.isNotEmpty) {
      WordEntry entry = words[random.nextInt(words.length)];

      String category;
      switch (entry.category) {
        case 0:
          category = "Cities";
          break;
        case 1:
          category = "Countries";
          break;
        case 2:
          category = "Animals";
          break;
        case 3:
          category = "Food";
          break;
        case 4:
          category = "Sports";
          break;
        case 5:
          category = "Movies";
          break;
        case 6:
          category = "TV Shows";
          break;
        case 7:
          category = "Books";
          break;
        default:
          category = "Unknown Category";
          break;
      }

      return WordAndCategory(word: entry.word, category: category);
    } else {
      throw Exception("No words available");
    }
  }

  void _guessLetter(String letter) {
    String lowerLetter = letter.toLowerCase();
    String lowerWord = _word.toLowerCase();
    setState(() {
      _guessedLetters.add(letter);
    });
    if (lowerWord.contains(lowerLetter)) {
      for (int i = 0; i < _word.length; i++) {
        if (lowerWord[i] == lowerLetter) {
          setState(() {
            _displayedWord[i] = letter;
          });
        }
      }
    } else {
      setState(() {
        _currentIncorrectGuesses++;
      });
    }
  }

  bool _isGameOver() {
    if (_currentIncorrectGuesses >= _maxIncorrectGuesses && !_hasWon()) {
      player.play('assets/fatalitysound.mp3');
      return true;
    } else {
      return _currentIncorrectGuesses >= _maxIncorrectGuesses || _hasWon();
    }
  }

  bool _hasWon() {
    return !_displayedWord.contains('_');
  }

  @override
  Widget build(BuildContext context) {
    if (_isGameOver()) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hangman'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  _hasWon() ? 'assets/winner.png' : 'assets/fatality.png'),
              Text(
                _hasWon()
                    ? 'Congratulations! You won!'
                    : 'Game Over! You lost!',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back to Main Menu'),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hangman'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusImage(incorrectGuesses: _currentIncorrectGuesses),
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
}

class WordAndCategory {
  final String word;
  final String category;

  WordAndCategory({required this.word, required this.category});
}
