import 'dart:math';

final List<String> categories = [
  'Cities',
  'Countries'
]; // 0: Cities, 1: Countries
final List<String> difficulties = [
  'Easy-peasy',
  'Lemon-squeezy',
  'Difficult-difficult',
  'Lemon-Difficult'
]; // 0: Easy-peasy, 1: Lemon-squeezy, 2: Difficult-difficult, 3: Lemon-Difficult



final List<WordEntry> words = [
  //Cities
  WordEntry(word: 'Berlin', category: 0, difficulty: 0),
  WordEntry(word: 'Madrid', category: 0, difficulty: 0),
  WordEntry(word: 'Paris', category: 0, difficulty: 0),
  WordEntry(word: 'London', category: 0, difficulty: 0),
  WordEntry(word: 'Rome', category: 0, difficulty: 0),
  WordEntry(word: 'Beijing', category: 0, difficulty: 0),
  WordEntry(word: 'Tokyo', category: 0, difficulty: 0),
  WordEntry(word: 'Delhi', category: 0, difficulty: 0),
  WordEntry(word: 'Aberdeen', category: 0, difficulty: 1),
  WordEntry(word: 'Cancun', category: 0, difficulty: 1),
  WordEntry(word: 'Edinburgh', category: 0, difficulty: 1),
  WordEntry(word: 'Seville', category: 0, difficulty: 1),
  WordEntry(word: 'Lisbon', category: 0, difficulty: 1),
  WordEntry(word: 'Copenhagen', category: 0, difficulty: 1),
  WordEntry(word: 'Vienna', category: 0, difficulty: 1),
  WordEntry(word: 'Oslo', category: 0, difficulty: 1),
  WordEntry(word: 'Doha', category: 0, difficulty: 1),
  WordEntry(word: 'Amman', category: 0, difficulty: 1),
  WordEntry(word: 'Havana', category: 0, difficulty: 1),
  WordEntry(word: 'Algiers', category: 0, difficulty: 1),
  WordEntry(word: 'Kampala', category: 0, difficulty: 1),
  WordEntry(word: 'Caracas', category: 0, difficulty: 1),
  WordEntry(word: 'Lahore', category: 0, difficulty: 1),
  WordEntry(word: 'Jakarta', category: 0, difficulty: 1),
  WordEntry(word: 'Reykjavik', category: 0, difficulty: 2),
  WordEntry(word: 'Guadalajara', category: 0, difficulty: 2),
  WordEntry(word: 'Chennai', category: 0, difficulty: 2),
  WordEntry(word: 'Durban', category: 0, difficulty: 2),
  WordEntry(word: 'Helsinki', category: 0, difficulty: 2),
  WordEntry(word: 'Glasgow', category: 0, difficulty: 2),
  WordEntry(word: 'Marseille', category: 0, difficulty: 2),
  WordEntry(word: 'Dublin', category: 0, difficulty: 2),
  WordEntry(word: 'Kazan', category: 0, difficulty: 2),
  WordEntry(word: 'Incheon', category: 0, difficulty: 2),
  WordEntry(word: 'Zagreb', category: 0, difficulty: 2),
  WordEntry(word: 'Sarajevo', category: 0, difficulty: 2),
  WordEntry(word: 'Bishkek', category: 0, difficulty: 2),
  WordEntry(word: 'Tbilisi', category: 0, difficulty: 2),
  WordEntry(word: 'Belgrade', category: 0, difficulty: 2),
  WordEntry(word: 'Bratislava', category: 0, difficulty: 2),
  WordEntry(word: 'Yerevan', category: 0, difficulty: 3),
  WordEntry(word: 'Ljubljana', category: 0, difficulty: 3),
  WordEntry(word: 'Thimphu', category: 0, difficulty: 3),
  WordEntry(word: 'Ashgabat', category: 0, difficulty: 3),
  WordEntry(word: 'Dushanbe', category: 0, difficulty: 3),
  WordEntry(word: 'Bujumbura', category: 0, difficulty: 3),
  WordEntry(word: 'Maseru', category: 0, difficulty: 3),
  WordEntry(word: 'Lilongwe', category: 0, difficulty: 3),
  WordEntry(word: 'Ouagadougou', category: 0, difficulty: 3),
  WordEntry(word: 'Paramaribo', category: 0, difficulty: 3),
  WordEntry(word: 'Naypyidaw', category: 0, difficulty: 3),
  WordEntry(word: 'Vientiane', category: 0, difficulty: 3),
  WordEntry(word: 'Phnom Penh', category: 0, difficulty: 3),
  WordEntry(word: 'Podgorica', category: 0, difficulty: 3),
  WordEntry(word: 'Chisinau', category: 0, difficulty: 3),
  WordEntry(word: 'Tashkent', category: 0, difficulty: 3),
  WordEntry(word: 'Asmara', category: 0, difficulty: 3),
  WordEntry(word: 'Djibouti', category: 0, difficulty: 3),
  WordEntry(word: 'Bujumbura', category: 0, difficulty: 3),
  WordEntry(word: 'Windhoek', category: 0, difficulty: 3),
  WordEntry(word: 'Mbabane', category: 0, difficulty: 3),
  WordEntry(word: 'Manama', category: 0, difficulty: 3),
  WordEntry(word: 'Muscat', category: 0, difficulty: 3),
  WordEntry(word: 'Doha', category: 0, difficulty: 3),
  //Countries
  WordEntry(word: 'Germany', category: 1, difficulty: 0),
  WordEntry(word: 'Spain', category: 1, difficulty: 0),
  WordEntry(word: 'France', category: 1, difficulty: 0),
  WordEntry(word: 'United Kingdom', category: 1, difficulty: 0),
  WordEntry(word: 'Italy', category: 1, difficulty: 0),
  WordEntry(word: 'China', category: 1, difficulty: 0),
  WordEntry(word: 'Japan', category: 1, difficulty: 0),
  WordEntry(word: 'India', category: 1, difficulty: 0),

  WordEntry(word: 'Brazil', category: 1, difficulty: 1),
  WordEntry(word: 'Canada', category: 1, difficulty: 1),
  WordEntry(word: 'Russia', category: 1, difficulty: 1),
  WordEntry(word: 'Australia', category: 1, difficulty: 1),
  WordEntry(word: 'Mexico', category: 1, difficulty: 1),
  WordEntry(word: 'Argentina', category: 1, difficulty: 1),
  WordEntry(word: 'Saudi Arabia', category: 1, difficulty: 1),
  WordEntry(word: 'South Africa', category: 1, difficulty: 1),

  WordEntry(word: 'Chile', category: 1, difficulty: 2),
  WordEntry(word: 'Egypt', category: 1, difficulty: 2),
  WordEntry(word: 'Morocco', category: 1, difficulty: 2),
  WordEntry(word: 'Nigeria', category: 1, difficulty: 2),
  WordEntry(word: 'Vietnam', category: 1, difficulty: 2),
  WordEntry(word: 'Thailand', category: 1, difficulty: 2),
  WordEntry(word: 'New Zealand', category: 1, difficulty: 2),
  WordEntry(word: 'Turkey', category: 1, difficulty: 2),

  WordEntry(word: 'Cuba', category: 1, difficulty: 2),
  WordEntry(word: 'Uganda', category: 1, difficulty: 2),
  WordEntry(word: 'Zimbabwe', category: 1, difficulty: 2),
  WordEntry(word: 'Mongolia', category: 1, difficulty: 2),
  WordEntry(word: 'Finland', category: 1, difficulty: 2),
  WordEntry(word: 'Norway', category: 1, difficulty: 2),
  WordEntry(word: 'Denmark', category: 1, difficulty: 2),
  WordEntry(word: 'Netherlands', category: 1, difficulty: 2),

  WordEntry(word: 'Botswana', category: 1, difficulty: 3),
  WordEntry(word: 'Belize', category: 1, difficulty: 3),
  WordEntry(word: 'Uruguay', category: 1, difficulty: 3),
  WordEntry(word: 'Paraguay', category: 1, difficulty: 3),
  WordEntry(word: 'Guatemala', category: 1, difficulty: 3),
  WordEntry(word: 'Honduras', category: 1, difficulty: 3),
  WordEntry(word: 'Nicaragua', category: 1, difficulty: 3),
  WordEntry(word: 'El Salvador', category: 1, difficulty: 3),

  WordEntry(word: 'Ethiopia', category: 1, difficulty: 3),
  WordEntry(word: 'Sudan', category: 1, difficulty: 3),
  WordEntry(word: 'Tanzania', category: 1, difficulty: 3),
  WordEntry(word: 'Mozambique', category: 1, difficulty: 3),
  WordEntry(word: 'Zambia', category: 1, difficulty: 3),
  WordEntry(word: 'Angola', category: 1, difficulty: 3),
  WordEntry(word: 'Niger', category: 1, difficulty: 3),
  WordEntry(word: 'Burkina Faso', category: 1, difficulty: 3),

  WordEntry(word: 'Mali', category: 1, difficulty: 3),
  WordEntry(word: 'Madagascar', category: 1, difficulty: 3),
  WordEntry(word: 'Malawi', category: 1, difficulty: 3),
  WordEntry(word: 'Kazakhstan', category: 1, difficulty: 3),
  WordEntry(word: 'Turkmenistan', category: 1, difficulty: 3),
  WordEntry(word: 'Kyrgyzstan', category: 1, difficulty: 3),
  WordEntry(word: 'Tajikistan', category: 1, difficulty: 3),
  WordEntry(word: 'Uzbekistan', category: 1, difficulty: 3),
];

class WordEntry {
  final String word;
  final int category;
  final int difficulty;

  WordEntry({
    required this.word,
    required this.category,
    required this.difficulty,
  });
}

WordEntry getRandomWord(int difficulty) {
  final random = Random();
  List<WordEntry> wordsOfDifficulty =
      words.where((word) => word.difficulty == difficulty).toList();
  return wordsOfDifficulty[random.nextInt(wordsOfDifficulty.length)];
}
