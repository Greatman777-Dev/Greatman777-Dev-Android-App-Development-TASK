// exercise2_logger.dart
// Exercise 2: Implement a Logger Using Delegation

// 1. Define Logger interface
abstract class Logger {
  void log(String message);
}

// 2. ConsoleLogger implementation
class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('[Console] $message');
  }
}

// 2. FileLogger implementation (simulated)
class FileLogger implements Logger {
  @override
  void log(String message) {
    print('[File] $message');
  }
}

// 3. Application class that delegates to Logger
class Application implements Logger {
  final Logger _logger;
  
  // Constructor injection
  Application(this._logger);
  
  // Delegate log method to the injected logger
  @override
  void log(String message) {
    _logger.log(message);
  }
  
  // Application-specific methods
  void start() {
    log('Application started');
  }
  
  void processData(String data) {
    log('Processing data: $data');
  }
  
  void stop() {
    log('Application stopped');
  }
}

void main() {
  print('=' * 60);
  print('EXERCISE 2: LOGGER USING DELEGATION');
  print('=' * 60);
  
  // Using ConsoleLogger
  print('\n📋 Using ConsoleLogger:');
  Application app1 = Application(ConsoleLogger());
  app1.start();
  app1.processData('User login');
  app1.stop();
  
  // Using FileLogger
  print('\n📋 Using FileLogger:');
  Application app2 = Application(FileLogger());
  app2.start();
  app2.processData('Database query');
  app2.stop();
  
  // Test with both loggers
  print('\n📋 Testing with sample output:');
  Application testApp = Application(ConsoleLogger());
  testApp.log('App started'); // prints to console
  
  Application fileApp = Application(FileLogger());
  fileApp.log('Error occurred'); // "File: Error occurred"
}