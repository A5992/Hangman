import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hangman/mechanics/hangman_words.dart';

void showSettingsPanel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container();
    },
  );
}

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog();
    },
  );
}

class DifficultySettings {
  final List<WordEntry> levelZero = [];
  final List<WordEntry> levelOne = [];
  final List<WordEntry> levelTwo = [];
  final List<WordEntry> levelThree = [];

  List<int> selectedLevels = [0, 1, 2, 3];

  DifficultySettings(List<WordEntry> words) {
    for (var entry in words) {
      addWordEntry(entry);
    }
  }

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

  WordAndCategory getRandomWordAndCategory() {
    final random = Random();
    // Combine selected difficulty levels into a single list
    final List<WordEntry> combined = [];
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
      WordEntry entry = combined[random.nextInt(combined.length)];

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
        default:
          category = "Unknown Category";
          break;
      }

      return WordAndCategory(word: entry.word, category: category);
    } else {
      throw Exception("No words available.");
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
  final DifficultySettings difficultySettings;

  const DifficultySettingsScreen({Key? key, required this.difficultySettings})
      : super(key: key);

  @override
  State<DifficultySettingsScreen> createState() =>
      _DifficultySettingsScreenState();
}

class _DifficultySettingsScreenState extends State<DifficultySettingsScreen> {
  late DifficultySettings difficultySettings;
  bool levelZeroSelected = true;
  bool levelOneSelected = true;
  bool levelTwoSelected = true;
  bool levelThreeSelected = true;

  @override
  void initState() {
    super.initState();
    difficultySettings = widget.difficultySettings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Difficulty Level(s)'),
      ),
      body: ListView(
        children: <Widget>[
          CheckboxListTile(
            title: Text(difficulties[0]),
            value: levelZeroSelected,
            onChanged: (bool? value) {
              setState(() {
                levelZeroSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(difficulties[1]),
            value: levelOneSelected,
            onChanged: (bool? value) {
              setState(() {
                levelOneSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(difficulties[2]),
            value: levelTwoSelected,
            onChanged: (bool? value) {
              setState(() {
                levelTwoSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(difficulties[3]),
            value: levelThreeSelected,
            onChanged: (bool? value) {
              setState(() {
                levelThreeSelected = value!;
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
