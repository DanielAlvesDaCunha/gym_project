import 'package:flutter/material.dart';
import '../../DI/timer_controller.dart';
import '../dados_timer.dart';
import '../end_event.dart';
import '../exercicio_events.dart';
import '../start_event.dart';
import '../treino_event.dart';
import 'Timer.dart';


class TreinoTimer extends StatefulWidget {
  const TreinoTimer({super.key});


  @override
  State<TreinoTimer> createState() => _TreinoTimerState();


}

class _TreinoTimerState extends State<TreinoTimer> {
  bool showStartButton = true;
  late final TimerController controller;
  late final Stream<TreinoEvent> treinoStream;
  start(){
    controller = TimerController(timers: [
      Treino(seconds: 60, name: 'abdominal'),
      Treino(seconds: 10, name: 'abdominal'),
      Treino(seconds: 10, name: 'abdominal'),
    ]);
    setState(() {
      treinoStream = controller.start();
      showStartButton = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showStartButton
          ?
         ElevatedButton(
          onPressed: start,
          child:  const Text(('iniciar treino')),
        )
            : StreamBuilder(stream: treinoStream,
        builder: (context, AsyncSnapshot<TreinoEvent> snapshot){
              TreinoEvent? event = snapshot.data;
              if(snapshot.hasError){
                return const Text('erro ao carregar o Timer');
              }else if(event is StartEvent){
                return const Text("iniciando o treino");
              }else if(event is EndEvent){
                return  const Text("treino finaliado");
              }else if(event is exercicioevent){
                return TimerTreino(evento: event);
              }
              return Container();
        },)
      ),
    );

    }
  }