# Exercise 4: Complex Data Processing - Person Age Analysis

## 📋 Overview
This exercise demonstrates complex data processing by analyzing a list of Person objects. You'll filter people based on name patterns and calculate statistical averages.

## 📝 Problem Statement
Given a list of people with names and ages, find the average age of people whose names start with the letter 'A' or 'B'. Print the result rounded to one decimal place.

### Data Class
```dart
class Person {
  final String name;
  final int age;
  Person(this.name, this.age);
}
```

### Sample Data
```dart
List<Person> people = [
  Person("Alice", 25),
  Person("Bob", 30),
  Person("Charlie", 35),
  Person("Anna", 22),
  Person("Ben", 28),
];
```

### Expected Output
```
Average age: 26.2
```

## 🚀 Implementation Approaches

The code demonstrates **4 different approaches** to solve the same problem:

### Approach 1: Step-by-Step Processing
```dart
// Step 1: Filter people
List<Person> filtered = [];
for (var person in people) {
  String firstLetter = person.name[0].toUpperCase();
  if (firstLetter == 'A' || firstLetter == 'B') {
    filtered.add(person);
  }
}

// Step 2: Extract ages
List<int> ages = [];
for (var person in filtered) {
  ages.add(person.age);
}

// Step 3: Calculate average
int sum = 0;
for (var age in ages) {
  sum += age;
}
double average = sum / ages.length;
```

### Approach 2: Functional Programming
```dart
var filtered = people.where((p) {
  String firstChar = p.name[0].toUpperCase();
  return firstChar == 'A' || firstChar == 'B';
}).toList();

double averageAge = filtered.map((p) => p.age)
    .reduce((a, b) => a + b) / filtered.length;
```

### Approach 3: Concise Single Pipeline
```dart
var result = people
    .where((p) => 'AB'.contains(p.name[0].toUpperCase()))
    .map((p) => p.age)
    .toList();

double avg = result.reduce((a, b) => a + b) / result.length;
```

### Approach 4: Function-Based Approach
```dart
void calculateAndPrintAverageAge(List<Person> people, bool Function(Person) predicate) {
  var filtered = people.where(predicate).toList();
  var ages = filtered.map((p) => p.age).toList();
  double average = ages.reduce((a, b) => a + b) / ages.length;
  print(average.toStringAsFixed(1));
}
```

## 📊 Bonus Features

The code includes comprehensive analysis functions:

### Demographic Analysis
- Overall statistics (total people, total age, average age)
- Age range (minimum and maximum ages)
- Grouping by first letter of name
- Age distribution by categories

## 🧪 Test Cases

| Test Case | Input | Expected Average |
|-----------|-------|------------------|
| Standard dataset | Alice(25), Bob(30), Charlie(35), Anna(22), Ben(28) | 26.2 |
| All A/B names | Alice(20), Bob(25), Anna(30), Ben(35), Alex(40) | 30.0 |
| No A/B names | Charlie(25), David(30), Eve(35), Frank(40) | No matches |
| Mixed case | alice(25), BOB(30), anna(22), ben(28), Charlie(35) | 26.2 |
| Single match | Alice(25), Charlie(35), David(40) | 25.0 |
| Empty list | [] | No matches |
| Edge cases | ""(25), "A"(30), "B"(35), "   "(40) | 32.5 |

## 🔑 Key Concepts

### Data Classes
```dart
class Person {
  final String name;
  final int age;
  Person(this.name, this.age);
}
```

### String Manipulation
```dart
String firstChar = name[0];              // First character
String upperFirst = name[0].toUpperCase(); // Uppercase first letter
bool startsWithA = upperFirst == 'A';     // Check if starts with A
bool valid = 'AB'.contains(upperFirst);   // Check multiple letters
```

### Age Calculation
```dart
// Sum ages
int sum = ages.reduce((a, b) => a + b);

// Calculate average
double average = sum / ages.length;

// Format to one decimal
String formatted = average.toStringAsFixed(1);
```

## 🎯 How to Run

1. Save the code as `exercise3_person_analysis.dart`
2. Run with Dart:
```bash
dart exercise3_person_analysis.dart
```
3. To run tests, uncomment the last line:
```dart
// Uncomment to run tests
testExercise3();
```

## ✅ Expected Output

When running the main function, you should see:

```
============================================================
EXERCISE 3: COMPLEX DATA PROCESSING - PERSON AGE ANALYSIS
============================================================

📋 Original People List:
   • Alice (25)
   • Bob (30)
   • Charlie (35)
   • Anna (22)
   • Ben (28)
------------------------------------------------------------

🚀 APPROACH 1: Step-by-Step Processing
----------------------------------------
📊 Step 1 - Filtered People (A or B):
   • Alice (25)
   • Bob (30)
   • Anna (22)
   • Ben (28)

📊 Step 2 - Extracted Ages: [25, 30, 22, 28]

📊 Step 3 & 4 - Results:
   • Average age: 26.2
```

## 🎯 Key Functions Used

| Function | Purpose |
|----------|---------|
| `where()` | Filter collection based on condition |
| `map()` | Transform elements |
| `reduce()` | Combine elements into single value |
| `toList()` | Convert iterable to list |
| `toStringAsFixed()` | Format decimal numbers