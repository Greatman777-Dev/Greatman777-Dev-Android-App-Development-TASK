// exercise1_zoo.dart
// Exercise 1: Model a Zoo - Inheritance, Abstract Classes, and Polymorphism

// Abstract class Animal
abstract class Animal {
  String name;
  int legs;
  
  Animal(this.name, this.legs);
  
  // Abstract method
  void makeSound();
  
  // Concrete method
  void describe() {
    print('$name has $legs legs');
  }
}

// Dog subclass
class Dog extends Animal {
  Dog(String name) : super(name, 4);
  
  @override
  void makeSound() {
    print('$name says Woof!');
  }
}

// Cat subclass
class Cat extends Animal {
  Cat(String name) : super(name, 4);
  
  @override
  void makeSound() {
    print('$name says Meow!');
  }
}

// Bird subclass (additional example)
class Bird extends Animal {
  Bird(String name) : super(name, 2);
  
  @override
  void makeSound() {
    print('$name says Chirp!');
  }
}

void main() {
  print('=' * 50);
  print('EXERCISE 1: MODEL A ZOO');
  print('=' * 50);
  
  // Create a list of animals (polymorphism)
  List<Animal> animals = [
    Dog('Buddy'),
    Cat('Whiskers'),
    Bird('Tweety'),
    Dog('Max'),
    Cat('Luna'),
  ];
  
  print('\n📋 Zoo Animals:');
  for (var animal in animals) {
    animal.describe();
  }
  
  print('\n🔊 Animal Sounds:');
  // Iterate and print each sound
  for (var animal in animals) {
    animal.makeSound();
  }
  
  print('\n' + '=' * 50);
  print('BONUS: Animal Information');
  print('=' * 50);
  
  // Bonus: Print detailed information
  for (var i = 0; i < animals.length; i++) {
    var animal = animals[i];
    print('${i + 1}. ${animal.runtimeType}: ${animal.name}');
  }
}