// exercise3_shapes.dart
// Exercise 3: Drawable Shapes with Interfaces

// Drawable interface
abstract class Drawable {
  void draw();
  void drawWithColor(String color); // Additional method
}

// Circle class
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
  
  // Circle-specific method
  double get area => 3.14159 * radius * radius;
}

// Square class
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
  
  // Square-specific method
  double get area => side * side;
}

// Triangle class (additional shape)
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
  
  // Triangle-specific method
  double get area => 0.5 * base * height;
}

// Enhanced Circle with better ASCII art
class EnhancedCircle implements Drawable {
  final double radius;
  
  EnhancedCircle(this.radius);
  
  @override
  void draw() {
    print('\n' + _drawCircle());
  }
  
  String _drawCircle() {
    String result = '';
    int diameter = (radius * 2).round();
    
    for (int i = 0; i <= diameter; i++) {
      for (int j = 0; j <= diameter; j++) {
        double distance = ((i - radius) * (i - radius) + (j - radius) * (j - radius)).toDouble();
        if (distance > radius * radius - radius && distance < radius * radius + radius) {
          result += '*';
        } else {
          result += ' ';
        }
      }
      result += '\n';
    }
    return result;
  }
  
  @override
  void drawWithColor(String color) {
    print('\n🎨 Drawing a $color enhanced circle with radius $radius:');
    draw();
  }
}

void main() {
  print('=' * 50);
  print('EXERCISE 3: DRAWABLE SHAPES');
  print('=' * 50);
  
  // Create list of drawable shapes
  List<Drawable> shapes = [
    Circle(5),
    Square(4),
    Triangle(6, 4),
    EnhancedCircle(5),
  ];
  
  print('\n📐 Drawing all shapes:');
  for (var i = 0; i < shapes.length; i++) {
    print('\n--- Shape ${i + 1}: ${shapes[i].runtimeType} ---');
    shapes[i].draw();
  }
  
  print('\n' + '=' * 50);
  print('🎨 Drawing with colors');
  print('=' * 50);
  
  // Draw with colors
  for (var shape in shapes) {
    shape.drawWithColor(['red', 'blue', 'green', 'yellow'][shapes.indexOf(shape) % 4]);
  }
  
  print('\n' + '=' * 50);
  print('📊 Shape Information');
  print('=' * 50);
  
  // Access shape-specific properties
  for (var shape in shapes) {
    if (shape is Circle) {
      print('Circle area: ${shape.area.toStringAsFixed(2)}');
    } else if (shape is Square) {
      print('Square area: ${shape.area.toStringAsFixed(2)}');
    } else if (shape is Triangle) {
      print('Triangle area: ${shape.area.toStringAsFixed(2)}');
    } else if (shape is EnhancedCircle) {
      print('Enhanced Circle with radius ${shape.radius}');
    }
  }
  
  print('\n' + '=' * 50);
  print('BONUS: Shape Collection');
  print('=' * 50);
  
  // Create a shape collection with mixed types
  List<Drawable> shapeCollection = [
    Circle(3),
    Square(5),
    Circle(7),
    Square(2),
    Triangle(3, 4),
  ];
  
  // Count shapes by type
  int circles = 0;
  int squares = 0;
  int triangles = 0;
  
  for (var shape in shapeCollection) {
    if (shape is Circle) circles++;
    if (shape is Square) squares++;
    if (shape is Triangle) triangles++;
  }
  
  print('\nShape Collection Summary:');
  print('   • Circles: $circles');
  print('   • Squares: $squares');
  print('   • Triangles: $triangles');
  print('   • Total shapes: ${shapeCollection.length}');
}