# Exercise 6 README.md - Model Network Request State with Sealed Class

```markdown
# Exercise 6: Model Network Request State with Sealed Class

## 📋 Overview
This exercise demonstrates how to model network request states using a sealed class in Dart. The implementation shows three possible states for a network request.

## 📝 Problem Statement
Define a sealed class `NetworkState` representing three states:

- **Loading** - Request in progress
- **Success(data: String)** - Successful request with returned data
- **Failure(error: String)** - Failed request with error message

Write a function that handles each state and prints appropriate messages.

## 🚀 Implementation

### Sealed Class Hierarchy
```dart
sealed class NetworkState {
  const NetworkState();
}

class Loading extends NetworkState {
  const Loading();
}

class Success extends NetworkState {
  final String data;
  const Success(this.data);
}

class Failure extends NetworkState {
  final String error;
  const Failure(this.error);
}
```

### State Handler Function
```dart
void handleStateWithSwitch(NetworkState state) {
  switch (state) {
    case Loading():
      print('⏳ Application en cours de chargement...');
      break;
    case Success(data: var message):
      print('✅ Félicitations : $message');
      break;
    case Failure(error: var errorMsg):
      print('❌ Alerte : $errorMsg');
      break;
  }
}
```

### Main Function
```dart
void main() {
  const states = [
    Loading(),
    Success('Données reçues avec succès !'),
    Failure('Connexion perdue.'),
  ];

  for (var state in states) {
    handleStateWithSwitch(state);
  }
}
```

## ✅ Expected Output

```
--- Handling Network States ---
⏳ Application en cours de chargement...
✅ Félicitations : Données reçues avec succès !
❌ Alerte : Connexion perdue.
```

## 🎯 How to Run

1. Save the code as `exercise2_network_state.dart`
2. Run with Dart:
```bash
dart exercise2_network_state.dart
```

## 🔑 Key Features

- **`sealed class`** - Ensures all subclasses are known at compile time
- **`const` constructors** - Allows creating constant instances
- **Pattern matching** - Switch statement with pattern matching (Dart 3+)
- **Exhaustive handling** - All possible states must be handled