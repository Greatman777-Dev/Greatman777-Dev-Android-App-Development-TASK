Exercise 9: Logger Using Delegation

## 📋 Overview
This exercise demonstrates the delegation pattern by creating a logging system where an Application class delegates logging responsibilities to different logger implementations.

## 📝 Problem Statement
Create a simple logging system using delegation:

1. Define an interface `Logger` with a function `log(message: String)`
2. Provide two implementations: 
   - `ConsoleLogger` (prints to console)
   - `FileLogger` (simulates writing to a file)
3. Create a class `Application` that delegates logging to a Logger

### Expected Output
```dart
val app = Application(ConsoleLogger())
app.log("App started") // prints to console

val fileApp = Application(FileLogger())
fileApp.log("Error occurred") // "File: Error occurred"
```

## 🚀 Implementation

### Logger Interface
```dart
abstract class Logger {
  void log(String message);
}
```

### ConsoleLogger Implementation
```dart
class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('[Console] $message');
  }
}
```

### FileLogger Implementation
```dart
class FileLogger implements Logger {
  @override
  void log(String message) {
    print('[File] $message');
  }
}
```

### Application Class with Delegation
```dart
class Application implements Logger {
  final Logger _logger;
  
  Application(this._logger);
  
  @override
  void log(String message) {
    _logger.log(message);
  }
}
```

## 🧪 Test Cases

| Test | Code | Expected Output |
|------|------|-----------------|
| Console Logger | `Application(ConsoleLogger()).log("App started")` | `[Console] App started` |
| File Logger | `Application(FileLogger()).log("Error occurred")` | `[File] Error occurred` |
| App Methods | `app.start()` | `[Console] Application started` |

## 🎯 How to Run

```bash
dart exercise2_logger.dart
```

## ✅ Expected Output

```
============================================================
EXERCISE 2: LOGGER USING DELEGATION
============================================================

📋 Using ConsoleLogger:
[Console] Application started
[Console] Processing data: User login
[Console] Application stopped

📋 Using FileLogger:
[File] Application started
[File] Processing data: Database query
[File] Application stopped

📋 Testing with sample output:
[Console] App started
[File] Error occurred
```

## 🔑 Key Concepts

- **Interface**: Abstract class defining contract
- **Delegation**: Forwarding tasks to another object
- **Dependency Injection**: Passing logger through constructor
- **Polymorphism**: Switching implementations without changing Application class