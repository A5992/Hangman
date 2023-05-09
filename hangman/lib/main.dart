import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainMenu(),
  ));
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hangman',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle New Game button press
              },
              child: const Text('New Game'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle Difficulty button press
              },
              child: const Text('Difficulty'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hints Enabled'),
                Checkbox(
                  value: true, // TODO: Bind this value to a state variable
                  onChanged: (bool? value) {
                    // TODO: Handle hints enabled checkbox
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
