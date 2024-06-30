import 'package:flutter/material.dart';

class WorkoutDetailPage extends StatelessWidget {
  final String nome;
  final String imagem;
  final String detalhes;

  const WorkoutDetailPage(
      {super.key,
      required this.nome,
      required this.imagem,
      required this.detalhes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          nome,
          style: const TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
      ),
      body:
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  detalhes,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
