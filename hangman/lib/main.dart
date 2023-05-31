import 'package:flutter/material.dart';
import 'package:hangman/mechanics/hangman_game.dart';
import 'package:hangman/mechanics/difficulty_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DifficultySettings difficultySettings = DifficultySettings();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: MainMenu(difficultySettings: difficultySettings),
    );
  }
}

class MainMenu extends StatefulWidget {
  final DifficultySettings difficultySettings;

  const MainMenu({Key? key, required this.difficultySettings}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool _hintsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hangman'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hangman',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 50),
                _buildButton('New Game', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HangmanGame(difficultySettings: widget.difficultySettings),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                _buildButton('Difficulty', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DifficultySettingsScreen(
                          difficultySettings: widget.difficultySettings),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hints Enabled',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    Checkbox(
                      value: _hintsEnabled,
                      onChanged: (bool? value) {
                        setState(() {
                          _hintsEnabled = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
