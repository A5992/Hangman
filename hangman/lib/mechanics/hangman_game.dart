import 'package:flutter/material.dart';
import 'package:hangman/mechanics/on_screen_keyboard.dart';
import 'package:hangman/mechanics/status_image.dart';
import 'package:hangman/mechanics/hint_category.dart';
import 'package:hangman/mechanics/audio_manager.dart';
import 'package:hangman/mechanics/difficulty_settings.dart';

class HangmanGame extends StatefulWidget {
  final DifficultySettings difficultySettings;
  const HangmanGame({Key? key, required this.difficultySettings})
      : super(key: key);

  @override
  State<HangmanGame> createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  late String _word;
  late String _category;
  late List<String> _displayedWord;
  final AudioManager _audioManager = AudioManager();
  final Set<String> _guessedLetters = {};
  String get _displayedWordWithUnderscores {
    return _displayedWord.map((c) {
      if (c == '_') {
        return '_ ';
      } else if (c == ' ') {
        return '  '; // space represented as a double space for visibility
      } else {
        return '$c ';
      }
    }).join();
  }

  final int _maxIncorrectGuesses = 6;
  int _currentIncorrectGuesses = 0;

  @override
  void initState() {
    super.initState();
    final wordAndCategory =
        widget.difficultySettings.getRandomWordAndCategory();
    _word = wordAndCategory.word;
    _category = wordAndCategory.category;
    _displayedWord =
        List.generate(_word.length, (i) => _word[i] == ' ' ? ' ' : '_');
  }

  void _guessLetter(String letter) {
    if (letter == '') {
      return;
    }

    String lowerLetter = letter.toLowerCase();
    String lowerWord = _word.toLowerCase();
    setState(() {
      _guessedLetters.add(letter);
    });

    if (lowerWord.contains(lowerLetter)) {
      for (int i = 0; i < _word.length; i++) {
        if (lowerWord[i] == lowerLetter) {
          setState(() {
            _displayedWord[i] = _word[i];
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
      _audioManager.playGameOverSound();
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
                  _hasWon() ? 'assets/winner.gif' : 'assets/fatality.png'),
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
            HintCategory(category: _category),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: OnScreenKeyboard(
            onLetterPressed: _guessLetter,
          ),
        ),
      );
    }
  }
}
