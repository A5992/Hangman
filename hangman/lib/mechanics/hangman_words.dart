import 'dart:math';

final List<WordCategory> words = [
  WordCategory(word: 'Berlin', category: 'Cities'),
];

class WordCategory {
  final String word;
  final String category;

  WordCategory({required this.word, required this.category});
}

WordCategory getRandomWord() {
  final random = Random();
  return words[random.nextInt(words.length)];
}
