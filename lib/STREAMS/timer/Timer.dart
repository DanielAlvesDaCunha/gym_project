import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exercicio_events.dart';

class TimerTreino extends StatelessWidget {
  final exercicioevent evento;
  const TimerTreino({super.key, required this.evento});

  getColor(int now, int limit){
    double factor = now/ limit;
    if(factor > 0.2){
      return Colors.cyan;
    }else if(factor > 0.1 && factor <= 0.2){
      return Colors.yellow[400];
    }else{
      return Colors.red[400];
    }
  }

  @override
  Widget build(BuildContext context) {
    final treino = evento.treino;

    return Stack(alignment: Alignment.center,children: [
      SizedBox(
        width: 250,
        height: 250,
        child: CircularProgressIndicator(
          value:1 -  (evento.now / treino.seconds),
          strokeWidth: 15,
          backgroundColor: Colors.grey.shade300,
          color: getColor(evento.now, treino.seconds),
        ),
      ),
      Text(evento.now.toString(),
      style: TextStyle(fontSize: 70),
      ),
      Positioned(
          bottom:60, child: Text(evento.treino.name.toString(),
      style: TextStyle(fontSize: 18),),)
    ],
    );
  }
}
