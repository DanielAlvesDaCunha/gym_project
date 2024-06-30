import 'package:ultima_tentativa/Bloc/Input/workout_default_custom.dart';
import '../../STREAMS/dados_timer.dart';

abstract class WorkoutEvent {}

class LoadWorkoutEvent extends WorkoutEvent {}

class AddWorkoutEvent extends WorkoutEvent {
  CustomDefaultWorkout workout;

  AddWorkoutEvent({
    required this.workout,
  });
}

class RemoveWorkoutEvent extends WorkoutEvent {
  CustomDefaultWorkout workout;

  RemoveWorkoutEvent({
    required this.workout,
  });
}
  class navigateToWorkoutDetailEvent extends WorkoutEvent {
  final String nome;
  final String imagem;
  final String detalhes;

  navigateToWorkoutDetailEvent({
  required this.nome,
  required this.imagem,
  required this.detalhes,
  });

}
