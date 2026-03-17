// exercise_eight.dart
// Simplified version that matches the Kotlin exercise

// Simple maxOf function that works with numbers and strings
dynamic maxOfSimple(List<dynamic> list) {
  if (list.isEmpty) return null;
  
  var max = list[0];
  
  for (var i = 1; i < list.length; i++) {
    if (list[i] is num && max is num) {
      if (list[i] > max) {
        max = list[i];
      }
    } else if (list[i] is String && max is String) {
      if ((list[i] as String).compareTo(max as String) > 0) {
        max = list[i];
      }
    }
  }
  
  return max;
}

void main() {
  print('=' * 60);
  print('EXERCISE 1: GENERIC maxOf FUNCTION');
  print('=' * 60);
  
  // Test cases exactly as in the exercise
  print('\n📝 Test: maxOf(listOf(3, 7, 2, 9))');
  print('   Result: ${maxOfSimple([3, 7, 2, 9])}'); // 9
  print('   Expected: 9\n');
  
  print('📝 Test: maxOf(listOf("apple", "banana", "kiwi"))');
  print('   Result: ${maxOfSimple(["apple", "banana", "kiwi"])}'); // kiwi
  print('   Expected: "kiwi"\n');
  
  print('📝 Test: maxOf(emptyList())');
  print('   Result: ${maxOfSimple([])}'); // null
  print('   Expected: null\n');
  
  // Additional test for single element
  print('📝 Test: maxOf([42])');
  print('   Result: ${maxOfSimple([42])}'); // 42
  
  // Additional test for doubles
  print('\n📝 Test: maxOf([3.14, 2.71, 1.618])');
  print('   Result: ${maxOfSimple([3.14, 2.71, 1.618])}'); // 3.14
}