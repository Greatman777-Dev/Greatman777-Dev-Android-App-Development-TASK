# Exercise 8 README.md

```markdown
# Exercise 8: Generic maxOf Function

## 📋 Overview
This exercise demonstrates generic programming by creating a function that finds the maximum element in a list.

## 📝 Problem Statement
Write a generic function `maxOf` that returns the maximum element from a list. The function should work for any type that implements `Comparable<T>`.

### Function Signature (Kotlin)
```kotlin
fun <T : Comparable<T>> maxOf(list: List<T>): T?
```

### Test Cases
```kotlin
println(maxOf(listOf(3, 7, 2, 9))) // 9
println(maxOf(listOf("apple", "banana", "kiwi"))) // "kiwi"
println(maxOf(emptyList())) // null
```

## 🚀 Dart Implementation

```dart
T? maxOf<T>(List<T> list) {
  if (list.isEmpty) return null;
  
  T max = list.first;
  
  for (var element in list) {
    if (element is num && max is num) {
      if (element > max) {
        max = element;
      }
    } else if (element is String && max is String) {
      if (element.compareTo(max) > 0) {
        max = element;
      }
    }
  }
  
  return max;
}
```

## 🧪 Test Results

| Input | Expected | Output |
|-------|----------|--------|
| `[3, 7, 2, 9]` | `9` | `9` |
| `["apple", "banana", "kiwi"]` | `"kiwi"` | `"kiwi"` |
| `[]` | `null` | `null` |
| `[42]` | `42` | `42` |
| `[3.14, 2.71, 1.618]` | `3.14` | `3.14` |

## 🎯 How to Run

```bash
dart exercise_eight.dart