import 'package:kgress/game/actions/action.dart';
import 'package:kgress/game/actions/builtin/mixins.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/states/states.dart';

import 'action_set.dart';
import 'builtin/element_actions/element_action.dart';

class ElementActionSet extends ActionSet {

  Element _element;

  ElementActionSet(this._element, List<Action> actions) : super(actions);

  @override
  void validate(Action action) {
    if (action is ValidatableAction) {
      (action as ValidatableAction).validate();
    }
  }

  @override
  ActionSet copy() {
    return ElementActionSet(_element, actions);
  }

  @override
  Action nextAction() {
    Action next = super.nextAction();

    if(next is ElementAction && next.element != _element) {
      next.setElement(_element);
    }

    return next;
  }

  @override
  void collision() {
    _element.state = stationary;
    super.collision();
  }

}