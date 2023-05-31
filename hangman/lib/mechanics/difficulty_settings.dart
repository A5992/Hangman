import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hangman/mechanics/hangman_words.dart';

void showSettingsPanel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      // return const SettingsPanel();
      // Define SettingsPanel or replace it with an existing widget.
      return Container(); // Temporary replacement
    },
  );
}

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      // return const ErrorDialog();
      // Define ErrorDialog or replace it with an existing widget.
      return const AlertDialog(); // Temporary replacement
    },
  );
}

class DifficultySettings {
  final List<WordEntry> levelZero = [];
  final List<WordEntry> levelOne = [];
  final List<WordEntry> levelTwo = [];
  final List<WordEntry> levelThree = [];

  List<int> selectedLevels = [0, 1, 2, 3];

  void addWordEntry(WordEntry entry) {
    switch (entry.difficulty) {
      case 0:
        levelZero.add(entry);
        break;
      case 1:
        levelOne.add(entry);
        break;
      case 2:
        levelTwo.add(entry);
        break;
      case 3:
        levelThree.add(entry);
        break;
      default:
        throw Exception(
            "Invalid difficulty level, please make sure at least one difficulty level is selected");
    }
  }

  void setSelectedLevels(List<int> newLevels) {
    selectedLevels = newLevels;
  }

  WordEntry getRandomWordEntry() {
    // Combine selected difficulty levels into a single list
    List<WordEntry> combined = [];
    for (var level in selectedLevels) {
      switch (level) {
        case 0:
          combined.addAll(levelZero);
          break;
        case 1:
          combined.addAll(levelOne);
          break;
        case 2:
          combined.addAll(levelTwo);
          break;
        case 3:
          combined.addAll(levelThree);
          break;
        default:
          throw Exception("Invalid difficulty level");
      }
    }

    // Return a random word from the combined list
    if (combined.isNotEmpty) {
      return combined[Random().nextInt(combined.length)];
    } else {
      throw Exception("No words available");
    }
  }
}

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // set to min to wrap content
        children: [
          const Text('Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Here you can add your application settings.'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: const Text('An error occurred. Please try again.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class DifficultySettingsScreen extends StatefulWidget {
  const DifficultySettingsScreen({super.key});

  @override
  State<DifficultySettingsScreen> createState() =>
      _DifficultySettingsScreenState();
}

class _DifficultySettingsScreenState extends State<DifficultySettingsScreen> {
  DifficultySettings difficultySettings = DifficultySettings();
  bool levelZeroSelected = true;
  bool levelOneSelected = true;
  bool levelTwoSelected = true;
  bool levelThreeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Difficulty Level(s)'),
      ),
      body: ListView(
        children: <Widget>[
          CheckboxListTile(
            title: const Text('Level 0'),
            value: levelZeroSelected,
            onChanged: (bool? value) {
              setState(() {
                levelZeroSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Level 1'),
            value: levelOneSelected,
            onChanged: (bool? value) {
              setState(() {
                levelOneSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Level 2'),
            value: levelTwoSelected,
            onChanged: (bool? value) {
              setState(() {
                levelTwoSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Level 3'),
            value: levelThreeSelected,
            onChanged: (bool? value) {
              setState(() {
                levelThreeSelected = value ?? false;
              });
            },
          ),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: () {
              // Save selected difficulty levels to DifficultySettings
              List<int> selectedLevels = [];
              if (levelZeroSelected) selectedLevels.add(0);
              if (levelOneSelected) selectedLevels.add(1);
              if (levelTwoSelected) selectedLevels.add(2);
              if (levelThreeSelected) selectedLevels.add(3);
              difficultySettings.setSelectedLevels(selectedLevels);
              //Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
