
import 'dart:math';
import 'package:kevin_gamify/game/elements/element.dart';

/// Current context in the area for the game
class AreaContext {

  final int numTiles;

  /// All elements in the area
  Map<Point<double>, Element> elements;

  AreaContext(this.numTiles);


}