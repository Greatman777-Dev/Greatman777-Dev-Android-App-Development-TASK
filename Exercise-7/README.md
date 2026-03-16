# Exercise 7 README.md - Drawable Shapes with Interfaces

```markdown
# Exercise 7: Drawable Shapes with Interfaces

## 📋 Overview
This exercise demonstrates interfaces and polymorphism by creating different shapes that implement a common `Drawable` interface.

## 📝 Problem Statement
Define an interface `Drawable` with a function `draw()`. Create classes `Circle` and `Square` that implement `Drawable`. Each should have appropriate properties (radius, side length) and print a simple ASCII representation.

### Expected Output
Each shape should draw itself using ASCII art:
- Circle: Circular pattern with `*`
- Square: Square pattern with `*`
- Triangle: Triangular pattern with `*`

## 🚀 Implementation

### Drawable Interface
```dart
abstract class Drawable {
  void draw();
  void drawWithColor(String color);
}
```

### Circle Class
```dart
class Circle implements Drawable {
  final double radius;
  Circle(this.radius);
  
  @override
  void draw() {
    print('\n   ***');
    print('  *   *');
    print(' *     *');
    print('  *   *');
    print('   ***');
  }
  
  @override
  void drawWithColor(String color) {
    print('\n🎨 Drawing a $color circle with radius $radius:');
    draw();
  }
  
  double get area => 3.14159 * radius * radius;
}
```

### Square Class
```dart
class Square implements Drawable {
  final double side;
  Square(this.side);
  
  @override
  void draw() {
    print('\n   ****');
    print('  *    *');
    print('  *    *');
    print('   ****');
  }
  
  @override
  void drawWithColor(String color) {
    print('\n🎨 Drawing a $color square with side $side:');
    draw();
  }
  
  double get area => side * side;
}
```

### Triangle Class (Bonus)
```dart
class Triangle implements Drawable {
  final double base;
  final double height;
  Triangle(this.base, this.height);
  
  @override
  void draw() {
    print('\n     *');
    print('    ***');
    print('   *****');
    print('  *******');
    print(' *********');
  }
  
  @override
  void drawWithColor(String color) {
    print('\n🎨 Drawing a $color triangle:');
    draw();
  }
  
  double get area => 0.5 * base * height;
}
```

### Main Function
```dart
void main() {
  List<Drawable> shapes = [
    Circle(5),
    Square(4),
    Triangle(6, 4),
  ];
  
  for (var shape in shapes) {
    shape.draw();
  }
}
```

## ✅ Expected Output

```
==================================================
EXERCISE 3: DRAWABLE SHAPES
==================================================

📐 Drawing all shapes:

--- Shape 1: Circle ---

   ***
  *   *
 *     *
  *   *
   ***

--- Shape 2: Square ---

   ****
  *    *
  *    *
   ****

--- Shape 3: Triangle ---

     *
    ***
   *****
  *******
 *********
```

## 🎯 How to Run

1. Save the code as `exercise3_shapes.dart`
2. Run with Dart:
```bash
dart exercise3_shapes.dart
```

## 🔑 Key Concepts

- **Interface** - Abstract class with methods to implement
- **Polymorphism** - Treat different shapes as `Drawable`
- **Method Overriding** - Implement interface methods
- **Type Checking** - Use `is` to check specific shape types