

import '../STREAMS/dados_timer.dart';
import '../STREAMS/end_event.dart';
import '../STREAMS/exercicio_events.dart';
import '../STREAMS/start_event.dart';
import '../STREAMS/treino_event.dart';

class TimerController{
 List<Treino> timers;
  TimerController({required this.timers});

  Stream<TreinoEvent> start() async*{
 yield StartEvent();

 for(Treino treino in timers){
  for(int seconds = treino.seconds; seconds >= 0; seconds --){
   await Future.delayed(const Duration(seconds: 1));
   yield exercicioevent(treino: treino, now: seconds);
  }
 }

 yield EndEvent();
  }
}