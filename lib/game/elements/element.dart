import 'package:kevin_gamify/game/actions/action_set.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/states/states.dart';
import 'package:optional/optional.dart';

class Element {

  int layerNum = 0;

  double locXinTiles = 0.0;

  double locYinTiles = 0.0;
  ElementKind _kind;
  State state;

  /// Optional action set
  Optional<ActionSet> _actionSet;
  Optional<ActionSet> get actionSet => _actionSet;

  Element(this._kind, {ActionSet actionSet}) {
    this._actionSet = Optional.ofNullable(actionSet);
  }

  ElementKind get kind => _kind;

}