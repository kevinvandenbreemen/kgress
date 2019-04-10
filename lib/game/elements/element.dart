import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/states/states.dart';

class Element {

  int layerNum = 0;

  double locXinTiles = 0.0;

  double locYinTiles = 0.0;
  ElementKind _kind;
  State state;


  Element(this._kind);

  ElementKind get kind => _kind;

}