// exercise_six.dart

// 1. Définition de la classe parente avec un constructeur const
sealed class NetworkState {
  const NetworkState(); 
}

// 2. Les classes enfants peuvent maintenant être const
class Loading extends NetworkState {
  const Loading();

  @override
  String toString() => 'Loading...';
}

class Success extends NetworkState {
  final String data;
  const Success(this.data);

  @override
  String toString() => 'Success: $data';
}

class Failure extends NetworkState {
  final String error;
  const Failure(this.error);

  @override
  String toString() => 'Error: $error';
}

void main() {
  // Création d'une liste d'états pour tester
  const states = [
    Loading(),
    Success('Données reçues avec succès !'),
    Failure('Connexion perdue.'),
  ];

  print('\n--- Handling Network States ---');
  
  for (var state in states) {
    handleStateWithSwitch(state);
  }
}

// 3. Utilisation du Switch (obligatoire avec une classe sealed)
void handleStateWithSwitch(NetworkState state) {
  switch (state) {
    case Loading():
      print('⏳ Application en cours de chargement...');
      break;
    case Success(data: var message):
      print('✅ Félicitations : $message');
      break;
    case Failure(error: var msg d'erreur):
      print('❌ Alerte : $msg d'erreur');
      break;
  }
}