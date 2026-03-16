# Exercise 1 README.md

```markdown
# Exercise 1: Custom Higher-Order Function - processList

## 📋 Overview
Build a higher-order function that filters a list of integers based on a custom predicate, demonstrating functional programming concepts in Dart.

## 🎯 Learning Objectives
- Understand higher-order functions and function types
- Practice lambda expressions and closures
- Implement custom filtering logic
- Master predicate functions

## 📝 Problem Statement
Create a function that filters a list of integers based on a **predicate** (a test condition). The function should:

1. Accept a list of integers
2. Accept a predicate function that tests each integer
3. Return a **new list** containing only elements that pass the test
4. Keep the original list unchanged

## 🔧 Function Specification

### Signature
```dart
List<int> processList(List<int> numbers, bool Function(int) predicate)
```

### Parameters
| Parameter | Type | Description |
|-----------|------|-------------|
| `numbers` | `List<int>` | The input list to filter |
| `predicate` | `bool Function(int)` | A function that tests each number |

### Return Value
| Condition | Return Value |
|-----------|--------------|
| Normal case | New `List<int>` with matching elements |
| No matches | Empty list `[]` |
| Empty input | Empty list `[]` |

## 💡 Examples

### Example 1: Filter Even Numbers
```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Using a lambda expression
  List<int> evenNumbers = processList(numbers, (n) => n % 2 == 0);
  print('Even numbers: $evenNumbers'); // [2, 4, 6, 8, 10]
  
  // Using a named function
  bool isOdd(int n) => n % 2 != 0;
  List<int> oddNumbers = processList(numbers, isOdd);
  print('Odd numbers: $oddNumbers'); // [1, 3, 5, 7, 9]
}
```

### Example 2: Multiple Conditions
```dart
void main() {
  List<int> scores = [45, 67, 89, 92, 38, 71, 55, 63];
  
  // Filter passing scores (>= 60)
  var passing = processList(scores, (score) => score >= 60);
  print('Passing scores: $passing'); // [67, 89, 92, 71, 63]
}
```

## 🛠️ Implementation Approaches

### Approach 1: Manual Loop
```dart
List<int> processList(List<int> numbers, bool Function(int) predicate) {
  List<int> result = [];
  
  for (int number in numbers) {
    if (predicate(number)) {
      result.add(number);
    }
  }
  
  return result;
}
```

### Approach 2: Using Built-in where()
```dart
List<int> processList(List<int> numbers, bool Function(int) predicate) {
  return numbers.where(predicate).toList();
}
```

### Approach 3: Generic Version
```dart
List<T> processListGeneric<T>(List<T> items, bool Function(T) predicate) {
  return items.where(predicate).toList();
}
```

## 🧪 Test Cases

### Basic Test Cases
| Input List | Predicate | Expected Output |
|------------|-----------|-----------------|
| `[1,2,3,4,5,6]` | `(n) => n % 2 == 0` | `[2,4,6]` |
| `[1,2,3,4,5,6]` | `(n) => n > 3` | `[4,5,6]` |
| `[1,2,3,4,5,6]` | `(n) => n < 3` | `[1,2]` |
| `[1,2,3,4,5,6]` | `(n) => n == 4` | `[4]` |

### Edge Cases
| Input List | Predicate | Expected Output |
|------------|-----------|-----------------|
| `[]` | `(n) => n > 0` | `[]` |
| `[1,3,5,7]` | `(n) => n % 2 == 0` | `[]` |
| `[5]` | `(n) => n > 0` | `[5]` |

## 🔑 Key Concepts

### 1. Higher-Order Functions
A function that takes another function as a parameter or returns a function.

### 2. Function Types
The syntax `bool Function(int)` means:
- Returns a `bool`
- Takes one `int` parameter

### 3. Predicates
Functions that return a boolean value, used for testing conditions.

### 4. Lambda Expressions
Anonymous functions written concisely:
```dart
// Full syntax
(int n) { return n % 2 == 0; }

// Arrow syntax
(int n) => n % 2 == 0

// Type inference
(n) => n % 2 == 0
```

## ⚠️ Common Mistakes to Avoid

### ❌ Modifying the Original List
```dart
// WRONG
List<int> processList(List<int> numbers, predicate) {
  numbers.removeWhere((n) => !predicate(n));
  return numbers; // Original list is modified!
}

// CORRECT
List<int> processList(List<int> numbers, predicate) {
  List<int> result = [];
  for (int n in numbers) {
    if (predicate(n)) result.add(n);
  }
  return result; // Original unchanged
}
```

### ❌ Incorrect Function Type
```dart
// WRONG
List<int> processList(List<int> numbers, Function predicate) // Loses type safety

// CORRECT
List<int> processList(List<int> numbers, bool Function(int) predicate) // Type-safe
```

## ✅ Best Practices

1. **Use descriptive names**
   ```dart
   List<int> processList(List<int> numbers, bool Function(int) isSelected)
   ```

2. **Handle edge cases**
   ```dart
   if (numbers == null || numbers.isEmpty) return [];
   ```

3. **Document your code**
   ```dart
   /// Filters a list of integers using a predicate function.
   /// Returns a new list containing only elements that satisfy the predicate.
   ```

## 🌟 Bonus Challenges

### Challenge 1: Find First Match
```dart
int? findFirst(List<int> numbers, bool Function(int) predicate) {
  for (int n in numbers) {
    if (predicate(n)) return n;
  }
  return null;
}
```

### Challenge 2: Count Matches
```dart
int countMatches(List<int> numbers, bool Function(int) predicate) {
  int count = 0;
  for (int n in numbers) {
    if (predicate(n)) count++;
  }
  return count;
}
```

## 📊 Quick Reference

```dart
// Function type syntax
bool Function(int)  // Returns bool, takes int

// Lambda syntax
(int n) => n % 2 == 0  // Single expression
(int n) { return n % 2 == 0; }  // Block body

// Common predicates
(n) => n > 0           // Positive numbers
(n) => n % 2 == 0      // Even numbers
(n) => n >= 10 && n <= 20  // In range
```

## 📚 Additional Resources
- [Dart Functions Documentation](https://dart.dev/guides/language/language-tour#functions)
- [Dart Collection Methods](https://api.dart.dev/stable/2.19.6/dart-core/Iterable-class.html)

## 🎓 Success Criteria

You've successfully completed this exercise if you can:
- [ ] Write a function that accepts another function as a parameter
- [ ] Use lambda expressions to create predicates
- [ ] Filter lists without modifying the original
- [ ] Handle edge cases like empty lists
- [ ] Explain what a higher-order function is

---

**Happy Coding!** 🚀
```

This is a clean, well-structured README.md file specifically for Exercise 1. It contains all the essential information: overview, learning objectives, problem statement, function specification, examples, implementation approaches, test cases, key concepts, common mistakes, best practices, bonus challenges, and a quick reference.
Bindzi Kevin Elyse