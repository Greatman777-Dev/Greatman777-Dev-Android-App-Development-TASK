// exercise2_string_mapping.dart
// Exercise 2: Transforming Between Collection Types
// Given a list of strings, create a map where keys are strings and values are their lengths.
// Then print only entries where length is greater than 4.

void main() {
  print('=' * 50);
  print('EXERCISE 2: STRING LENGTH MAPPING');
  print('=' * 50);
  
  // Sample data
  List<String> words = ["apple", "cat", "banana", "dog", "elephant"];
  
  print('\n📋 Original List: $words');
  print('-' * 40);
  
  // =============================================
  // APPROACH 1: Collection For (Modern Dart)
  // =============================================
  print('\n🚀 APPROACH 1: Using Collection For');
  print('-' * 30);
  
  // Create map using collection for
  Map<String, int> wordLengths1 = {
    for (var word in words) word: word.length
  };
  
  print('📊 Complete Map: $wordLengths1');
  print('\n📝 Words with length > 4:');
  
  // Filter and display
  wordLengths1.forEach((word, length) {
    if (length > 4) {
      print('   ✅ $word → length $length');
    }
  });
  
  // =============================================
  // APPROACH 2: Map.fromIterable
  // =============================================
  print('\n🚀 APPROACH 2: Using Map.fromIterable');
  print('-' * 30);
  
  // Create map using Map.fromIterable
  Map<String, int> wordLengths2 = Map.fromIterable(
    words,
    key: (word) => word,
    value: (word) => (word as String).length,
  );
  
  print('📊 Complete Map: $wordLengths2');
  print('\n📝 Words with length > 4:');
  
  wordLengths2.forEach((word, length) {
    if (length > 4) {
      print('   ✅ $word → length $length');
    }
  });
  
  // =============================================
  // APPROACH 3: Traditional Loop
  // =============================================
  print('\n🚀 APPROACH 3: Using Traditional Loop');
  print('-' * 30);
  
  // Create empty map
  Map<String, int> wordLengths3 = {};
  
  // Populate using loop
  for (String word in words) {
    wordLengths3[word] = word.length;
  }
  
  print('📊 Complete Map: $wordLengths3');
  print('\n📝 Words with length > 4:');
  
  // Filter using where and forEach
  wordLengths3.entries
      .where((entry) => entry.value > 4)
      .forEach((entry) {
        print('   ✅ ${entry.key} → length ${entry.value}');
      });
  
  // =============================================
  // APPROACH 4: Functional Chain (Most Concise)
  // =============================================
  print('\n🚀 APPROACH 4: Functional Chain (Most Concise)');
  print('-' * 30);
  
  print('\n📝 Words with length > 4:');
  words
      .where((word) => word.length > 4)
      .forEach((word) => print('   ✅ $word → length ${word.length}'));
  
  // =============================================
  // BONUS: Additional Analysis
  // =============================================
  print('\n' + '=' * 50);
  print('📊 BONUS: Statistical Analysis');
  print('=' * 50);
  
  analyzeWords(words);
  
  print('\n' + '=' * 50);
  print('🏁 EXERCISE 2 COMPLETED');
  print('=' * 50);
}

// =============================================
// BONUS FUNCTION: Word Analysis
// =============================================
void analyzeWords(List<String> words) {
  if (words.isEmpty) {
    print('No words to analyze');
    return;
  }
  
  // Create map of word lengths
  Map<String, int> wordMap = {for (var w in words) w: w.length};
  
  // Calculate statistics
  int totalWords = words.length;
  int totalChars = words.fold(0, (sum, word) => sum + word.length);
  double avgLength = totalChars / totalWords;
  
  // Find longest and shortest words
  String longestWord = words.reduce((a, b) => a.length > b.length ? a : b);
  String shortestWord = words.reduce((a, b) => a.length < b.length ? a : b);
  
  // Group by length
  Map<int, List<String>> groupedByLength = {};
  for (var word in words) {
    groupedByLength.putIfAbsent(word.length, () => []).add(word);
  }
  
  // Display statistics
  print('\n📈 Word Statistics:');
  print('   • Total words: $totalWords');
  print('   • Total characters: $totalChars');
  print('   • Average length: ${avgLength.toStringAsFixed(2)}');
  print('   • Longest word: "$longestWord" (${longestWord.length} chars)');
  print('   • Shortest word: "$shortestWord" (${shortestWord.length} chars)');
  
  print('\n📚 Words grouped by length:');
  groupedByLength.forEach((length, wordsList) {
    print('   • Length $length: ${wordsList.join(', ')}');
  });
  
  // Words longer than 4 characters
  List<String> longWords = words.where((w) => w.length > 4).toList();
  print('\n🔍 Words longer than 4 characters: ${longWords.length} found');
  for (var word in longWords) {
    print('   • "$word" (${word.length} chars)');
  }
}

// =============================================
// TEST FUNCTION: Run comprehensive tests
// =============================================
void testExercise2() {
  print('\n' + '=' * 50);
  print('🧪 RUNNING TESTS FOR EXERCISE 2');
  print('=' * 50);
  
  // Test Case 1: Sample data
  List<String> test1 = ["apple", "cat", "banana", "dog", "elephant"];
  runTestCase('Test 1: Sample data', test1);
  
  // Test Case 2: Mixed lengths
  List<String> test2 = ["hello", "world", "dart", "programming", "flutter", "code"];
  runTestCase('Test 2: Mixed lengths', test2);
  
  // Test Case 3: All short words
  List<String> test3 = ["cat", "dog", "bird", "fish", "ant", "bee"];
  runTestCase('Test 3: All short words', test3);
  
  // Test Case 4: All long words
  List<String> test4 = ["beautiful", "wonderful", "fantastic", "amazing"];
  runTestCase('Test 4: All long words', test4);
  
  // Test Case 5: Edge cases
  List<String> test5 = ["", "a", "ab", "abc", "abcd", "abcde", "abcdef"];
  runTestCase('Test 5: Edge cases', test5);
  
  // Test Case 6: Empty list
  List<String> test6 = [];
  runTestCase('Test 6: Empty list', test6);
}

// Helper function for running tests
void runTestCase(String testName, List<String> words) {
  print('\n📌 $testName');
  print('   Input: $words');
  
  // Create map
  Map<String, int> wordMap = {for (var w in words) w: w.length};
  print('   Map: $wordMap');
  
  // Filter and display words with length > 4
  var longWords = wordMap.entries.where((e) => e.value > 4).toList();
  
  if (longWords.isEmpty) {
    print('   Result: No words with length > 4');
  } else {
    print('   Words with length > 4:');
    for (var entry in longWords) {
      print('      • ${entry.key} (${entry.value})');
    }
  }
}

// Uncomment to run tests
// testExercise2();