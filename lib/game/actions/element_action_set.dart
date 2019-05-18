import 'package:kevin_gamify/game/actions/action.dart';
import 'package:kevin_gamify/game/elements/element.dart';

import 'action_set.dart';

class ElementActionSet extends ActionSet {

  Element _element;

  ElementActionSet(this._element, List<Action> actions) : super(actions);

  @override
  void validate(Action action) {

  }

}