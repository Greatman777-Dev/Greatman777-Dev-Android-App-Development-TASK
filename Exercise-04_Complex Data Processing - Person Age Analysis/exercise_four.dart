// exercise3_person_analysis.dart
// Exercise 3: Complex Data Processing
// Find the average age of people whose names start with 'A' or 'B'

// Person data class
class Person {
  final String name;
  final int age;
  
  Person(this.name, this.age);
  
  @override
  String toString() => 'Person(name: $name, age: $age)';
}

void main() {
  print('=' * 60);
  print('EXERCISE 3: COMPLEX DATA PROCESSING - PERSON AGE ANALYSIS');
  print('=' * 60);
  
  // Sample data
  List<Person> people = [
    Person("Alice", 25),
    Person("Bob", 30),
    Person("Charlie", 35),
    Person("Anna", 22),
    Person("Ben", 28),
    Person("David", 40),
    Person("Eve", 27),
  ];
  
  print('\n📋 Original People List:');
  people.forEach((person) => print('   • ${person.name} (${person.age})'));
  print('-' * 60);
  
  // =============================================
  // APPROACH 1: Step-by-Step Approach
  // =============================================
  print('\n🚀 APPROACH 1: Step-by-Step Processing');
  print('-' * 40);
  
  // Step 1: Filter people whose names start with 'A' or 'B'
  List<Person> filteredPeople = [];
  
  for (var person in people) {
    String firstLetter = person.name[0].toUpperCase();
    if (firstLetter == 'A' || firstLetter == 'B') {
      filteredPeople.add(person);
    }
  }
  
  print('📊 Step 1 - Filtered People (A or B):');
  filteredPeople.forEach((p) => print('   • ${p.name} (${p.age})'));
  
  // Step 2: Extract ages
  List<int> ages = [];
  for (var person in filteredPeople) {
    ages.add(person.age);
  }
  
  print('\n📊 Step 2 - Extracted Ages: $ages');
  
  // Step 3: Calculate average
  if (ages.isNotEmpty) {
    int sum = 0;
    for (var age in ages) {
      sum += age;
    }
    double average = sum / ages.length;
    
    // Step 4: Format and print
    print('\n📊 Step 3 & 4 - Results:');
    print('   • Sum of ages: $sum');
    print('   • Number of people: ${ages.length}');
    print('   • Average age: ${average.toStringAsFixed(1)}');
  } else {
    print('\n❌ No people found matching the criteria');
  }
  
  // =============================================
  // APPROACH 2: Functional Programming Approach
  // =============================================
  print('\n' + '=' * 60);
  print('🚀 APPROACH 2: Functional Programming');
  print('=' * 60);
  
  // Filter people with names starting with A or B (case insensitive)
  var filtered = people.where((p) {
    String firstChar = p.name[0].toUpperCase();
    return firstChar == 'A' || firstChar == 'B';
  }).toList();
  
  print('\n📊 Filtered People:');
  filtered.forEach((p) => print('   • ${p.name} (${p.age})'));
  
  if (filtered.isNotEmpty) {
    // Calculate average age
    double averageAge = filtered.map((p) => p.age)
        .reduce((a, b) => a + b) / filtered.length;
    
    print('\n📊 Average Age: ${averageAge.toStringAsFixed(1)}');
  } else {
    print('\n❌ No matching people found');
  }
  
  // =============================================
  // APPROACH 3: Most Concise Single Pipeline
  // =============================================
  print('\n' + '=' * 60);
  print('🚀 APPROACH 3: Concise Single Pipeline');
  print('=' * 60);
  
  var result = people
      .where((p) => 'AB'.contains(p.name[0].toUpperCase()))
      .map((p) => p.age)
      .toList();
  
  if (result.isNotEmpty) {
    double avg = result.reduce((a, b) => a + b) / result.length;
    print('\n📊 Average age of people with names starting with A or B:');
    print('   • ${avg.toStringAsFixed(1)}');
  } else {
    print('\n❌ No matching people found');
  }
  
  // =============================================
  // APPROACH 4: Function-Based Approach
  // =============================================
  print('\n' + '=' * 60);
  print('🚀 APPROACH 4: Using Dedicated Functions');
  print('=' * 60);
  
  calculateAndPrintAverageAge(people, (p) {
    String firstChar = p.name[0].toUpperCase();
    return firstChar == 'A' || firstChar == 'B';
  });
  
  // =============================================
  // BONUS: Comprehensive Analysis
  // =============================================
  print('\n' + '=' * 60);
  print('📊 BONUS: Comprehensive Person Analysis');
  print('=' * 60);
  
  analyzePeople(people);
  
  print('\n' + '=' * 60);
  print('🏁 EXERCISE 3 COMPLETED');
  print('=' * 60);
}

// =============================================
// FUNCTION-BASED APPROACH
// =============================================

/// Calculates and prints the average age of people matching a predicate
void calculateAndPrintAverageAge(List<Person> people, bool Function(Person) predicate) {
  print('\n📊 Function-Based Calculation:');
  
  var filtered = people.where(predicate).toList();
  
  if (filtered.isEmpty) {
    print('   ❌ No people match the criteria');
    return;
  }
  
  var ages = filtered.map((p) => p.age).toList();
  int sum = ages.reduce((a, b) => a + b);
  double average = sum / ages.length;
  
  print('   • Matching people: ${filtered.length}');
  print('   • Ages: $ages');
  print('   • Sum: $sum');
  print('   • Average: ${average.toStringAsFixed(1)}');
}

// =============================================
// BONUS: Comprehensive Analysis Functions
// =============================================

/// Performs comprehensive analysis on a list of people
void analyzePeople(List<Person> people) {
  if (people.isEmpty) {
    print('No people to analyze');
    return;
  }
  
  print('\n📈 DEMOGRAPHIC ANALYSIS');
  print('-' * 40);
  
  // Overall statistics
  var allAges = people.map((p) => p.age).toList();
  int totalPeople = people.length;
  int totalAge = allAges.reduce((a, b) => a + b);
  double overallAvg = totalAge / totalPeople;
  
  print('📊 Overall Statistics:');
  print('   • Total people: $totalPeople');
  print('   • Total age sum: $totalAge');
  print('   • Overall average age: ${overallAvg.toStringAsFixed(1)}');
  
  // Age range
  int minAge = allAges.reduce((a, b) => a < b ? a : b);
  int maxAge = allAges.reduce((a, b) => a > b ? a : b);
  print('   • Age range: $minAge - $maxAge');
  
  // Group by first letter
  print('\n📊 Analysis by First Letter:');
  Map<String, List<Person>> byFirstLetter = {};
  
  for (var person in people) {
    String firstLetter = person.name[0].toUpperCase();
    byFirstLetter.putIfAbsent(firstLetter, () => []).add(person);
  }
  
  // Sort letters for display
  var sortedLetters = byFirstLetter.keys.toList()..sort();
  
  for (var letter in sortedLetters) {
    var group = byFirstLetter[letter]!;
    var groupAges = group.map((p) => p.age).toList();
    double groupAvg = groupAges.reduce((a, b) => a + b) / group.length;
    
    print('   • Letter "$letter": ${group.length} people, ');
    print('     Average age: ${groupAvg.toStringAsFixed(1)}');
    print('     Names: ${group.map((p) => p.name).join(', ')}');
  }
  
  // Age distribution
  print('\n📊 Age Distribution:');
  
  Map<String, List<Person>> ageGroups = {
    '0-18': [],
    '19-30': [],
    '31-40': [],
    '41-50': [],
    '51+': [],
  };
  
  for (var person in people) {
    if (person.age <= 18) {
      ageGroups['0-18']!.add(person);
    } else if (person.age <= 30) {
      ageGroups['19-30']!.add(person);
    } else if (person.age <= 40) {
      ageGroups['31-40']!.add(person);
    } else if (person.age <= 50) {
      ageGroups['41-50']!.add(person);
    } else {
      ageGroups['51+']!.add(person);
    }
  }
  
  ageGroups.forEach((group, persons) {
    if (persons.isNotEmpty) {
      print('   • $group: ${persons.length} person${persons.length > 1 ? 's' : ''}');
    }
  });
}

// =============================================
// TEST FUNCTION: Comprehensive Test Cases
// =============================================

void testExercise3() {
  print('\n' + '=' * 60);
  print('🧪 RUNNING COMPREHENSIVE TESTS FOR EXERCISE 3');
  print('=' * 60);
  
  // Test Case 1: Standard dataset
  List<Person> test1 = [
    Person("Alice", 25),
    Person("Bob", 30),
    Person("Charlie", 35),
    Person("Anna", 22),
    Person("Ben", 28),
  ];
  runTestCase('Test 1: Standard dataset', test1, 26.2);
  
  // Test Case 2: All names start with A or B
  List<Person> test2 = [
    Person("Alice", 20),
    Person("Bob", 25),
    Person("Anna", 30),
    Person("Ben", 35),
    Person("Alex", 40),
  ];
  runTestCase('Test 2: All names start with A/B', test2, 30.0);
  
  // Test Case 3: No names start with A or B
  List<Person> test3 = [
    Person("Charlie", 25),
    Person("David", 30),
    Person("Eve", 35),
    Person("Frank", 40),
  ];
  runTestCase('Test 3: No A/B names', test3, null);
  
  // Test Case 4: Mixed case names
  List<Person> test4 = [
    Person("alice", 25),
    Person("BOB", 30),
    Person("anna", 22),
    Person("ben", 28),
    Person("Charlie", 35),
  ];
  runTestCase('Test 4: Mixed case names', test4, 26.2);
  
  // Test Case 5: Single person matching
  List<Person> test5 = [
    Person("Alice", 25),
    Person("Charlie", 35),
    Person("David", 40),
  ];
  runTestCase('Test 5: Single matching person', test5, 25.0);
  
  // Test Case 6: Empty list
  List<Person> test6 = [];
  runTestCase('Test 6: Empty list', test6, null);
  
  // Test Case 7: Edge cases (empty name)
  List<Person> test7 = [
    Person("", 25),
    Person("A", 30),
    Person("B", 35),
    Person("   ", 40),
  ];
  runTestCase('Test 7: Edge cases (empty/short names)', test7, 32.5); // A(30) + B(35) = 65/2 = 32.5
}

void runTestCase(String testName, List<Person> people, double? expectedAverage) {
  print('\n📌 $testName');
  print('   Input: ${people.length} people');
  
  // Filter people with names starting with A or B
  var filtered = people.where((p) {
    if (p.name.isEmpty) return false;
    String firstChar = p.name[0].toUpperCase();
    return firstChar == 'A' || firstChar == 'B';
  }).toList();
  
  print('   Filtered: ${filtered.length} people');
  
  if (filtered.isEmpty) {
    print('   Result: No matching people found');
    if (expectedAverage == null) {
      print('   ✅ PASSED');
    } else {
      print('   ❌ FAILED - Expected average $expectedAverage but got no matches');
    }
    return;
  }
  
  // Calculate average
  double average = filtered.map((p) => p.age)
      .reduce((a, b) => a + b) / filtered.length;
  
  String formattedAvg = average.toStringAsFixed(1);
  
  print('   Average age: $formattedAvg');
  
  if (expectedAverage != null) {
    double difference = (average - expectedAverage).abs();
    if (difference < 0.1) {
      print('   ✅ PASSED');
    } else {
      print('   ❌ FAILED - Expected ${expectedAverage.toStringAsFixed(1)}');
    }
  }
  
  // Show matching people
  print('   Matching people:');
  filtered.forEach((p) => print('      • ${p.name} (${p.age})'));
}

// Uncomment to run tests
// testExercise3();