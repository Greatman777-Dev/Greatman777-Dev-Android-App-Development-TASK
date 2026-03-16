// exercise2_network_state.dart
// Exercise 2: Model Network Request State with Sealed Class

// 1. Définition de la classe scellée (Sealed Class)
sealed class NetworkState {
  // Correction ici : Ajout du constructeur constant
  const NetworkState(); 
}

// État de chargement (Singleton)
class Loading extends NetworkState {
  const Loading(); 
  
  @override
  String toString() => 'Loading';
}

// État de succès avec données
class Success extends NetworkState {
  final String data;
  
  Success(this.data);
  
  @override
  String toString() => 'Success(data: $data)';
}

// État d'erreur avec message
class Error extends NetworkState {
  final String message;
  
  Error(this.message);
  
  @override
  String toString() => 'Error(message: $message)';
}

// --- Fonctions de gestion d'état ---

void handleState(NetworkState state) {
  if (state is Loading) {
    print('🔄 Loading...');
  } else if (state is Success) {
    print('✅ Success: ${state.data}');
  } else if (state is Error) {
    print('❌ Error: ${state.message}');
  }
}

// Utilisation du Switch (recommandé en Dart 3+)
void handleStateWithSwitch(NetworkState state) {
  switch (state) {
    case Loading():
      print('🔄 Loading...');
    case Success(data: var d):
      print('✅ Success: $d');
    case Error(message: var m):
      print('❌ Error: $m');
  }
}

// --- Point d'entrée principal ---

void main() {
  print('=' * 50);
  print('EXERCISE 2: NETWORK REQUEST STATE');
  print('=' * 50);
  
  // Liste des états
  List<NetworkState> states = [
    const Loading(),
    Success('User data loaded'),
    Error('Network timeout'),
    Success('Profile picture uploaded'),
    const Loading(),
    Error('Server error 500'),
  ];
  
  print('\n📊 Network States:');
  for (var i = 0; i < states.length; i++) {
    print('${i + 1}. ${states[i]}');
  }
  
  print('\n🔍 Handling Network States:');
  for (var state in states) {
    handleStateWithSwitch(state);
  }
}