import 'package:kevin_gamify/game/actions/action.dart';
import 'package:kevin_gamify/game/elements/element.dart';

import 'action_set.dart';
import 'builtin/element_actions/element_action.dart';

class ElementActionSet extends ActionSet {

  Element _element;

  ElementActionSet(this._element, List<Action> actions) : super(actions);

  @override
  void validate(Action action) {

  }

  @override
  Action nextAction() {
    Action next = super.nextAction();

    if(next is ElementAction) {
      next.element = _element;
    }

    return next;
  }

}