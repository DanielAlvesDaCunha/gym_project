import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ultima_tentativa/Bloc/Input/workout_repository.dart';

import '../../workout_details.dart';
import '../Input/workout_event.dart';
import '../State/workout_state.dart';

class WorkoutBloc {
  final WorkoutRepository _workoutrepo = WorkoutRepository();

  final StreamController<WorkoutEvent> _inputWorkoutController =
      StreamController<WorkoutEvent>();
  final StreamController<WorkoutState> _outputWorkoutController =
      StreamController<WorkoutState>();

  Sink<WorkoutEvent> get inputWorkout => _inputWorkoutController.sink;

  Stream<WorkoutState> get stream => _outputWorkoutController.stream;

  WorkoutBloc() {
    _inputWorkoutController.stream.listen(_mapEventToState);
    _loadWorkouts();
  }

  void _loadWorkouts() async {
    final workouts = await _workoutrepo.loadTreinos();
    _outputWorkoutController.add(WorkoutSucessState(workout: workouts));
  }

  void _mapEventToState(WorkoutEvent event) async {
    if (event is AddWorkoutEvent) {
      final workouts = await _workoutrepo.addTreino(event.workout);
      _outputWorkoutController.add(WorkoutSucessState(workout: workouts));
    } else if (event is RemoveWorkoutEvent) {
      final workouts = await _workoutrepo.removeTreino(event.workout);
      _outputWorkoutController.add(WorkoutSucessState(workout: workouts));
    } else if (event is LoadWorkoutEvent) {
      final workouts = await _workoutrepo.loadTreinos();
      _outputWorkoutController.add(WorkoutSucessState(workout: workouts));
    }
  }

  void dispose() {
    _inputWorkoutController.close();
    _outputWorkoutController.close();
  }

    void navigateToWorkoutDetailPage({
      required BuildContext context,
      required String nome,
      required String imagem,
      required String detalhes,
    }) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutDetailPage(
            nome: nome,
            imagem: imagem,
            detalhes: detalhes,
          ),
        ),
      );
    }
  }
