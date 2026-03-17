// exercise_eight.dart
// Version simplifiée pour correspondre à l'exercice Kotlin

// Fonction maxOfSimple qui fonctionne avec des nombres et des chaînes
dynamic maxOfSimple(List<dynamic> list) {
  if (list.isEmpty) return null;

  var max = list[0];

  for (var i = 1; i < list.length; i++) {
    final current = list[i]; // On stocke l'élément actuel pour plus de clarté

    if (current is num && max is num) {
      if (current > max) {
        max = current;
      }
    } else if (current is String && max is String) {
      // ✅ CORRECTION : J'ai enlevé les "as String" qui étaient inutiles
      if (current.compareTo(max) > 0) {
        max = current;
      }
    }
  }

  return max;
}

void main() {
  print('=' * 60);
  print('EXERCISE 8: GENERIC maxOf FUNCTION');
  print('=' * 60);

  // Cas de test
  print('\n📝 Test: maxOf([3, 7, 2, 9])');
  print('   Result: ${maxOfSimple([3, 7, 2, 9])}');
  print('   Expected: 9\n');

  print('📝 Test: maxOf(["apple", "banana", "kiwi"])');
  print('   Result: ${maxOfSimple(["apple", "banana", "kiwi"])}');
  print('   Expected: "kiwi"\n');

  print('📝 Test: maxOf([])');
  print('   Result: ${maxOfSimple([])}');
  print('   Expected: null\n');

  print('📝 Test: maxOf([42])');
  print('   Result: ${maxOfSimple([42])}');

  print('\n📝 Test: maxOf([3.14, 2.71, 1.618])');
  print('   Result: ${maxOfSimple([3.14, 2.71, 1.618])}');
}
