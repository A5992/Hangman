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
  // Animals
  WordEntry(word: 'Cat', category: 2, difficulty: 0),
  WordEntry(word: 'Dog', category: 2, difficulty: 0),
  WordEntry(word: 'Cow', category: 2, difficulty: 0),
  WordEntry(word: 'Pig', category: 2, difficulty: 0),
  WordEntry(word: 'Horse', category: 2, difficulty: 0),
  WordEntry(word: 'Lion', category: 2, difficulty: 0),
  WordEntry(word: 'Bear', category: 2, difficulty: 0),
  WordEntry(word: 'Tiger', category: 2, difficulty: 0),
  WordEntry(word: 'Deer', category: 2, difficulty: 1),
  WordEntry(word: 'Eagle', category: 2, difficulty: 1),
  WordEntry(word: 'Wolf', category: 2, difficulty: 1),
  WordEntry(word: 'Penguin', category: 2, difficulty: 1),
  WordEntry(word: 'Koala', category: 2, difficulty: 1),
  WordEntry(word: 'Cheetah', category: 2, difficulty: 1),
  WordEntry(word: 'Hippopotamus', category: 2, difficulty: 1),
  WordEntry(word: 'Kangaroo', category: 2, difficulty: 1),
  WordEntry(word: 'Squirrel', category: 2, difficulty: 1),
  WordEntry(word: 'Chimpanzee', category: 2, difficulty: 2),
  WordEntry(word: 'Crocodile', category: 2, difficulty: 2),
  WordEntry(word: 'Porcupine', category: 2, difficulty: 2),
  WordEntry(word: 'Rhinoceros', category: 2, difficulty: 2),
  WordEntry(word: 'Elephant', category: 2, difficulty: 2),
  WordEntry(word: 'Butterfly', category: 2, difficulty: 2),
  WordEntry(word: 'Caterpillar', category: 2, difficulty: 2),
  WordEntry(word: 'Armadillo', category: 2, difficulty: 2),
  WordEntry(word: 'Chameleon', category: 2, difficulty: 2),
  WordEntry(word: 'Cockatoo', category: 2, difficulty: 2),
  WordEntry(word: 'Woodpecker', category: 2, difficulty: 2),
  WordEntry(word: 'Tarantula', category: 2, difficulty: 3),
  WordEntry(word: 'Albatross', category: 2, difficulty: 3),
  WordEntry(word: 'Antelope', category: 2, difficulty: 3),
  WordEntry(word: 'Chinchilla', category: 2, difficulty: 3),
  WordEntry(word: 'Iguana', category: 2, difficulty: 3),
  WordEntry(word: 'Platypus', category: 2, difficulty: 3),
  WordEntry(word: 'Porpoise', category: 2, difficulty: 3),
  WordEntry(word: 'Salamander', category: 2, difficulty: 3),
  WordEntry(word: 'Wolverine', category: 2, difficulty: 3),
  WordEntry(word: 'Zebra', category: 2, difficulty: 3),
  WordEntry(word: 'Aardvark', category: 2, difficulty: 3),
  WordEntry(word: 'Barracuda', category: 2, difficulty: 3),
  WordEntry(word: 'Capuchin', category: 2, difficulty: 3),
  WordEntry(word: 'Dugong', category: 2, difficulty: 3),
  WordEntry(word: 'Echidna', category: 2, difficulty: 3),
  WordEntry(word: 'Ferret', category: 2, difficulty: 3),
  WordEntry(word: 'Gibbon', category: 2, difficulty: 3),
  WordEntry(word: 'Hippopotamus', category: 2, difficulty: 3),
  //Food
  WordEntry(word: 'Apple', category: 3, difficulty: 0),
  WordEntry(word: 'Bread', category: 3, difficulty: 0),
  WordEntry(word: 'Cheese', category: 3, difficulty: 0),
  WordEntry(word: 'Rice', category: 3, difficulty: 0),
  WordEntry(word: 'Pizza', category: 3, difficulty: 0),
  WordEntry(word: 'Egg', category: 3, difficulty: 0),
  WordEntry(word: 'Fish', category: 3, difficulty: 0),
  WordEntry(word: 'Pasta', category: 3, difficulty: 1),
  WordEntry(word: 'Chicken', category: 3, difficulty: 1),
  WordEntry(word: 'Salad', category: 3, difficulty: 1),
  WordEntry(word: 'Hamburger', category: 3, difficulty: 1),
  WordEntry(word: 'Burrito', category: 3, difficulty: 1),
  WordEntry(word: 'Omelette', category: 3, difficulty: 1),
  WordEntry(word: 'Sandwich', category: 3, difficulty: 1),
  WordEntry(word: 'Lasagna', category: 3, difficulty: 1),
  WordEntry(word: 'Dumpling', category: 3, difficulty: 2),
  WordEntry(word: 'Risotto', category: 3, difficulty: 2),
  WordEntry(word: 'Paella', category: 3, difficulty: 2),
  WordEntry(word: 'Gnocchi', category: 3, difficulty: 2),
  WordEntry(word: 'Fajita', category: 3, difficulty: 2),
  WordEntry(word: 'Pancake', category: 3, difficulty: 2),
  WordEntry(word: 'Sausage', category: 3, difficulty: 2),
  WordEntry(word: 'Biryani', category: 3, difficulty: 2),
  WordEntry(word: 'Cupcake', category: 3, difficulty: 2),
  WordEntry(word: 'Goulash', category: 3, difficulty: 3),
  WordEntry(word: 'Bruschetta', category: 3, difficulty: 3),
  WordEntry(word: 'Guacamole', category: 3, difficulty: 3),
  WordEntry(word: 'Baklava', category: 3, difficulty: 3),
  WordEntry(word: 'Beignets', category: 3, difficulty: 3),
  WordEntry(word: 'Carbonara', category: 3, difficulty: 3),
  WordEntry(word: 'Prosciutto', category: 3, difficulty: 3),
  WordEntry(word: 'Ratatouille', category: 3, difficulty: 3),
  WordEntry(word: 'Tiramisu', category: 3, difficulty: 3),
  WordEntry(word: 'Vindaloo', category: 3, difficulty: 3),
  WordEntry(word: 'Zabaglione', category: 3, difficulty: 3),
  // Sports
  WordEntry(word: 'Soccer', category: 4, difficulty: 0),
  WordEntry(word: 'Basketball', category: 4, difficulty: 0),
  WordEntry(word: 'Baseball', category: 4, difficulty: 0),
  WordEntry(word: 'Cricket', category: 4, difficulty: 0),
  WordEntry(word: 'Tennis', category: 4, difficulty: 0),
  WordEntry(word: 'Rugby', category: 4, difficulty: 0),
  WordEntry(word: 'Golf', category: 4, difficulty: 0),
  WordEntry(word: 'Boxing', category: 4, difficulty: 1),
  WordEntry(word: 'Cycling', category: 4, difficulty: 1),
  WordEntry(word: 'Swimming', category: 4, difficulty: 1),
  WordEntry(word: 'Badminton', category: 4, difficulty: 1),
  WordEntry(word: 'Archery', category: 4, difficulty: 1),
  WordEntry(word: 'Billiards', category: 4, difficulty: 1),
  WordEntry(word: 'Squash', category: 4, difficulty: 1),
  WordEntry(word: 'Surfing', category: 4, difficulty: 2),
  WordEntry(word: 'Rowing', category: 4, difficulty: 2),
  WordEntry(word: 'Equestrian', category: 4, difficulty: 2),
  WordEntry(word: 'Triathlon', category: 4, difficulty: 2),
  WordEntry(word: 'Wrestling', category: 4, difficulty: 2),
  WordEntry(word: 'Judo', category: 4, difficulty: 2),
  WordEntry(word: 'Fencing', category: 4, difficulty: 2),
  WordEntry(word: 'Handball', category: 4, difficulty: 2),
  WordEntry(word: 'Gymnastics', category: 4, difficulty: 3),
  WordEntry(word: 'Waterpolo', category: 4, difficulty: 3),
  WordEntry(word: 'Decathlon', category: 4, difficulty: 3),
  WordEntry(word: 'Pentathlon', category: 4, difficulty: 3),
  WordEntry(word: 'Biathlon', category: 4, difficulty: 3),
  WordEntry(word: 'Taekwondo', category: 4, difficulty: 3),
  WordEntry(word: 'Synchronized Swimming', category: 4, difficulty: 3),
  WordEntry(word: 'Curling', category: 4, difficulty: 3),
  WordEntry(word: 'Kabbadi', category: 4, difficulty: 3),
  WordEntry(word: 'Lacrosse', category: 4, difficulty: 3),
  WordEntry(word: 'Bobsleigh', category: 4, difficulty: 3),
  WordEntry(word: 'Pole Vaulting', category: 4, difficulty: 3),
  // Movies
  WordEntry(word: 'Inception', category: 5, difficulty: 0),
  WordEntry(word: 'Casablanca', category: 5, difficulty: 0),
  WordEntry(word: 'Titanic', category: 5, difficulty: 0),
  WordEntry(word: 'Psycho', category: 5, difficulty: 0),
  WordEntry(word: 'Gladiator', category: 5, difficulty: 0),
  WordEntry(word: 'Avatar', category: 5, difficulty: 0),
  WordEntry(word: 'Jaws', category: 5, difficulty: 0),
  WordEntry(word: 'Frozen', category: 5, difficulty: 0),
  WordEntry(word: 'Rocky', category: 5, difficulty: 0),
  WordEntry(word: 'Twilight', category: 5, difficulty: 0),
  WordEntry(word: 'Bambi', category: 5, difficulty: 0),
  WordEntry(word: 'Dumbo', category: 5, difficulty: 1),
  WordEntry(word: 'Amadeus', category: 5, difficulty: 1),
  WordEntry(word: 'Cinderella', category: 5, difficulty: 1),
  WordEntry(word: 'Chinatown', category: 5, difficulty: 1),
  WordEntry(word: 'Fargo', category: 5, difficulty: 1),
  WordEntry(word: 'Heat', category: 5, difficulty: 1),
  WordEntry(word: 'Braveheart', category: 5, difficulty: 1),
  WordEntry(word: 'Footloose', category: 5, difficulty: 1),
  WordEntry(word: 'Scream', category: 5, difficulty: 1),
  WordEntry(word: 'Unforgiven', category: 5, difficulty: 1),
  WordEntry(word: 'Watchmen', category: 5, difficulty: 1),
  WordEntry(word: 'Zootopia', category: 5, difficulty: 2),
  WordEntry(word: 'Vertigo', category: 5, difficulty: 2),
  WordEntry(word: 'Metropolis', category: 5, difficulty: 2),
  WordEntry(word: 'Memento', category: 5, difficulty: 2),
  WordEntry(word: 'Battleship', category: 5, difficulty: 2),
  WordEntry(word: 'Blade Runner', category: 5, difficulty: 2),
  WordEntry(word: 'Ratatouille', category: 5, difficulty: 2),
  WordEntry(word: 'Prometheus', category: 5, difficulty: 2),
  WordEntry(word: 'Fight Club', category: 5, difficulty: 2),
  WordEntry(word: 'Interstellar', category: 5, difficulty: 2),
  WordEntry(word: 'Spectre', category: 5, difficulty: 2),
  WordEntry(word: 'Casino Royale', category: 5, difficulty: 3),
  WordEntry(word: 'Moonlight', category: 5, difficulty: 3),
  WordEntry(word: 'La La Land', category: 5, difficulty: 3),
  WordEntry(word: 'Brokeback Mountain', category: 5, difficulty: 3),
  WordEntry(word: 'Whiplash', category: 5, difficulty: 3),
  WordEntry(word: 'Mad Max: Fury Road', category: 5, difficulty: 3),
  WordEntry(word: 'Birdman', category: 5, difficulty: 3),
  WordEntry(word: 'Her', category: 5, difficulty: 3),
  WordEntry(word: 'Inglourious Basterds', category: 5, difficulty: 3),
  WordEntry(word: 'No Country for Old Men', category: 5, difficulty: 3),
  WordEntry(word: 'The Grand Budapest Hotel', category: 5, difficulty: 3),
  WordEntry(word: 'Gravity', category: 5, difficulty: 3),
  WordEntry(word: 'Django Unchained', category: 5, difficulty: 3),
  WordEntry(word: 'The Artist', category: 5, difficulty: 3),
  WordEntry(word: 'The Social Network', category: 5, difficulty: 3),
  WordEntry(word: 'The Tree of Life', category: 5, difficulty: 3),
  WordEntry(word: 'Black Swan', category: 5, difficulty: 3),
  WordEntry(word: 'The King’s Speech', category: 5, difficulty: 3),
  WordEntry(word: 'The Dark Knight', category: 5, difficulty: 3),
  WordEntry(word: 'Slumdog Millionaire', category: 5, difficulty: 3),
  WordEntry(word: 'There Will Be Blood', category: 5, difficulty: 3),
  WordEntry(word: 'The Departed', category: 5, difficulty: 3),
  WordEntry(word: 'Borat', category: 5, difficulty: 3),
  WordEntry(word: 'Mulholland Drive', category: 5, difficulty: 3),
  WordEntry(word: 'A Beautiful Mind', category: 5, difficulty: 3),
  WordEntry(word: 'The Truman Show', category: 5, difficulty: 3),
  WordEntry(word: 'Schindler’s List', category: 5, difficulty: 3),
  WordEntry(word: 'Goodfellas', category: 5, difficulty: 3),
  WordEntry(word: 'Die Hard', category: 5, difficulty: 3),
  WordEntry(word: 'Raging Bull', category: 5, difficulty: 3),
  WordEntry(word: 'Apocalypse Now', category: 5, difficulty: 3),
  WordEntry(word: 'A Clockwork Orange', category: 5, difficulty: 3),
  WordEntry(word: 'Rosemary’s Baby', category: 5, difficulty: 3),
  WordEntry(word: 'The Graduate', category: 5, difficulty: 3),
  WordEntry(word: '2001: A Space Odyssey', category: 5, difficulty: 3),
];

class WordAndCategory {
  final String word;
  final String category;

  WordAndCategory({required this.word, required this.category});
}

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

WordAndCategory randomWordAndCategory() {
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
        default:
          category = "Unknown Category";
          break;
      }

      return WordAndCategory(word: entry.word, category: category);
    } else {
      throw Exception("No words available");
    }
  }

WordEntry getRandomWord(int difficulty) {
  final random = Random();
  List<WordEntry> wordsOfDifficulty =
      words.where((word) => word.difficulty == difficulty).toList();
  return wordsOfDifficulty[random.nextInt(wordsOfDifficulty.length)];
}
