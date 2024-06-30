import 'package:flutter/material.dart';
import 'Bloc/BloC/workout_bloc.dart';


class cards extends StatelessWidget {
  final String nome;
  final String imagem;
  final String detalhes;

  const cards({required this.nome, required this.imagem, super.key, required this.detalhes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final WorkoutBloc bloc = WorkoutBloc();
        bloc.navigateToWorkoutDetailPage(nome: nome, imagem: imagem, detalhes: detalhes, context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.green,
          ),
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              // Container for the image
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imagem,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container for the name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
