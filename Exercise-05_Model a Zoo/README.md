# Exercise 5 README.md - Model a Zoo

```markdown
# Exercise 5: Model a Zoo

## 📋 Overview
This exercise demonstrates object-oriented programming concepts by modeling a zoo with different animal types.

## 📝 Problem Statement
Create a class hierarchy for animals with the following requirements:

- **Abstract class** `Animal` with:
  - `name` property
  - `legs` property
  - Abstract method `makeSound()`
- **Two concrete subclasses**: `Dog` and `Cat`, each with their own sound
- Create a list of animals, iterate through them, and print each animal's sound

### Expected Output
```
Buddy says Woof!
Whiskers says Meow!
```

## 🚀 Implementation

### Animal Class (Abstract)
```dart
abstract class Animal {
  String name;
  int legs;
  Animal(this.name, this.legs);
  void makeSound(); // abstract
}
```

### Dog Subclass
```dart
class Dog extends Animal {
  Dog(String name) : super(name, 4);
  @override
  void makeSound() => print('$name says Woof!');
}
```

### Cat Subclass
```dart
class Cat extends Animal {
  Cat(String name) : super(name, 4);
  @override
  void makeSound() => print('$name says Meow!');
}
```

### Main Function
```dart
void main() {
  List<Animal> animals = [Dog('Buddy'), Cat('Whiskers')];
  
  for (var animal in animals) {
    animal.makeSound();
  }
}
```

## 🎯 How to Run

1. Save the code as `exercise1_zoo.dart`
2. Run with Dart:
```bash
dart exercise1_zoo.dart
```

## ✅ Expected Output

```
Buddy says Woof!
Whiskers says Meow!