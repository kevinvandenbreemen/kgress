
import 'dart:math';

import 'package:kgress/game/elements/element.dart';

/// Current context in the area for the game
class AreaContext {

  final int numTiles;

  /// All elements in the area
  Map<Point<double>, Element> elements;

  AreaContext(this.numTiles);


}