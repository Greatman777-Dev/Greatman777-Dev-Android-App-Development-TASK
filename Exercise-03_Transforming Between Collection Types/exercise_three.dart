// exercise2_string_mapping.dart

void main() {
  print('=' * 50);
  print('EXERCISE 2: STRING LENGTH MAPPING');
  print('=' * 50);

  List<String> words = ["apple", "cat", "banana", "dog", "elephant"];

  print('\n📋 Original List: $words');
  print('-' * 40);

  // APPROACH 1: Collection For
  print('\n🚀 APPROACH 1: Using Collection For');
  Map<String, int> wordLengths1 = {for (var word in words) word: word.length};
  print('📊 Complete Map: $wordLengths1');

  // APPROACH 2: Map.fromIterable
  print('\n🚀 APPROACH 2: Using Map.fromIterable');
  Map<String, int> wordLengths2 = Map.fromIterable(
    words,
    key: (word) => word,
    value: (word) => word
        .length, // ✅ CORRECTION : J'ai enlevé "(word as String)" car c'est inutile
  );
  print('📊 Complete Map: $wordLengths2');

  // APPROACH 3: Traditional Loop
  print('\n🚀 APPROACH 3: Using Traditional Loop');
  Map<String, int> wordLengths3 = {};
  for (String word in words) {
    wordLengths3[word] = word.length;
  }

  // Filtrage et affichage
  print('\n📝 Words with length > 4:');
  wordLengths3.entries.where((entry) => entry.value > 4).forEach((entry) {
    print('   ✅ ${entry.key} → length ${entry.value}');
  });

  // BONUS: Analysis
  print('\n' + '=' * 50);
  analyzeWords(words);
}

void analyzeWords(List<String> words) {
  if (words.isEmpty) {
    print('No words to analyze');
    return;
  }

  // ✅ CORRECTION : On utilise la variable wordMap pour afficher les données,
  // sinon Dart dit qu'elle est "unused" (inutile).
  Map<String, int> wordMap = {for (var w in words) w: w.length};
  print('🔍 Map générée pour analyse : $wordMap');

  int totalWords = words.length;
  int totalChars = words.fold(0, (sum, word) => sum + word.length);
  double avgLength = totalChars / totalWords;

  print('\n📈 Word Statistics:');
  print('   • Total words: $totalWords');
  print('   • Average length: ${avgLength.toStringAsFixed(2)}');
}
