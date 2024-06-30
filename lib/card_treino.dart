import 'package:flutter/material.dart';
import 'Bloc/BloC/workout_bloc.dart';

class CardsGym extends StatelessWidget {
  const CardsGym({
    super.key,
    required this.nome,
    required this.imagem,
    required this.onTap,
  });

  final String nome;
  final String imagem;
  final Function(BuildContext) onTap;


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => onTap(context),
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
