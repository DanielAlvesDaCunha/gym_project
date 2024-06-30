import 'package:flutter/cupertino.dart';
import 'package:ultima_tentativa/STREAMS/treino_event.dart';

import 'dados_timer.dart';

class exercicioevent implements TreinoEvent{
  Treino treino;
  int now;
  exercicioevent({required this.treino, required this.now});
}