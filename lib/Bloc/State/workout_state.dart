import '../Input/workout_default_custom.dart';

class WorkoutState {
  final List<CustomDefaultWorkout> workout;
  final NavigationState navigationState; // Estado de navegação atual

  WorkoutState({
    required this.workout,
    required this.navigationState,
  });
}

enum NavigationState {
  GymLibrary, // Página inicial
  workoutDetail, // Detalhes do treino
}


class WorkoutInitialState extends WorkoutState {
  WorkoutInitialState() : super(workout: [], navigationState : NavigationState.GymLibrary);
}

class WorkoutSucessState extends WorkoutState {
  WorkoutSucessState({required super.workout})
      : super(navigationState: NavigationState.GymLibrary);
}

class WorkoutDetailState extends WorkoutState {
  final String nome;
  final String imagem;
  final String detalhes;

  WorkoutDetailState({
    required super.workout,
    required this.nome,
    required this.imagem,
    required this.detalhes,
  }) : super(navigationState: NavigationState.workoutDetail);
}
