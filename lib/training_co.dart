import 'package:flutter/material.dart';
import 'gym_library.dart';
import 'custom_workout.dart';

class TrainingCo extends StatelessWidget {
  final SearchController searchController;

  const TrainingCo({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    fixedSize: MaterialStatePropertyAll(Size(300, 30))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GymLibrary(searchController: searchController)),
                  );
                },
                child: const Text('Biblioteca de Treinos'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    fixedSize: MaterialStatePropertyAll(Size(300, 30))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CustomWorkout()),
                  );
                },
                child: const Text('Treinos Personalizados'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}