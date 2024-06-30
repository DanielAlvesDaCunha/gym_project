import 'package:flutter/material.dart';
import 'Bloc/BloC/workout_bloc.dart';
import 'Bloc/Input/workout_default_custom.dart';
import 'Bloc/Input/workout_event.dart';
import 'Bloc/State/workout_state.dart';
import 'cards.dart';

class CustomWorkout extends StatefulWidget {
  const CustomWorkout({super.key});

  @override
  State<CustomWorkout> createState() => _CustomWorkoutState();
}

class _CustomWorkoutState extends State<CustomWorkout> {
  late final WorkoutBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = WorkoutBloc();
    bloc.inputWorkout.add(LoadWorkoutEvent());
  }

  @override
  void dispose() {
    bloc.inputWorkout.close();
    super.dispose();
  }

  void _showAddWorkoutDialog() {
    final TextEditingController workoutController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Novo Treino'),
          content: TextField(
            controller: workoutController,
            decoration: InputDecoration(hintText: 'Nome do Treino'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final newWorkout = CustomDefaultWorkout(nome: workoutController.text, imagem: '', detalhes: '');
                bloc.inputWorkout.add(AddWorkoutEvent(workout: newWorkout));
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Custom Workouts'),
      ),
      body: StreamBuilder<WorkoutState>(
        stream: bloc.stream,
        builder: (context, AsyncSnapshot<WorkoutState> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final workouts = snapshot.data!.workout;
          return ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workoutList = workouts[index];
              return cards(
                nome: workoutList.nome,
                imagem: workoutList.imagem ?? '', // Assumindo que imagem pode ser null
                detalhes: workoutList.detalhes ?? '', // Assumindo que detalhes pode ser null
              );


            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddWorkoutDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.black54,
      ),

    );
  }
}