import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/states/states.dart';

class Element {

  double locX;
  double locY;
  ElementKind _kind;
  State state;

  ElementKind get kind => _kind;

}