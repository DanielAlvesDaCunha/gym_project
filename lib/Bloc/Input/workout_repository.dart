import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultima_tentativa/Bloc/Input/workout_default_custom.dart';

class WorkoutRepository {
  static const String _workoutsKey = 'workouts';
  final List<CustomDefaultWorkout> _customTreinos = [];

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final workoutsJson = _customTreinos.map((workout) => workout.toJson()).toList();
    await prefs.setString(_workoutsKey, jsonEncode(workoutsJson));
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final workoutsString = prefs.getString(_workoutsKey);
    if (workoutsString != null) {
      final List<dynamic> workoutsJson = jsonDecode(workoutsString);
      _customTreinos.clear();
      _customTreinos.addAll(workoutsJson.map((json) => CustomDefaultWorkout.fromJson(json)).toList());
    } else {
      _customTreinos.addAll([
        CustomDefaultWorkout(nome: 'perna', imagem: '', detalhes: ''),
        CustomDefaultWorkout(nome: 'peito', detalhes: '', imagem: ''),
        CustomDefaultWorkout(nome: 'braco', imagem: '', detalhes: ''),
        CustomDefaultWorkout(nome: 'costas', imagem: '', detalhes: ''),
      ]);
    }
  }

  Future<List<CustomDefaultWorkout>> loadTreinos() async {
    await _loadFromPrefs();
    return _customTreinos;
  }

  Future<List<CustomDefaultWorkout>> addTreino(CustomDefaultWorkout treino) async {
    _customTreinos.add(treino);
    await _saveToPrefs();
    return _customTreinos;
  }

  Future<List<CustomDefaultWorkout>> removeTreino(CustomDefaultWorkout treino) async {
    _customTreinos.remove(treino);
    await _saveToPrefs();
    return _customTreinos;
  }
}
