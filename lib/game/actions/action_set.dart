import 'package:kevin_gamify/game/actions/builtin/control_actions.dart';

import 'action.dart';
import 'builtin/element_actions/element_action.dart';

class ActionSet {

  List<Action> _actions;
  List<Action> get actions => List.unmodifiable(_actions);

  Action get currentAction => _actionIndex == null ? null : _actions[_actionIndex];

  /// Index of action we're taking
  int _actionIndex;

  ActionSet(List<Action> actions) {
    actions.forEach((action)=>validate(action));
    this._actions = actions.map((a)=>a.copy()).toList();
  }

  ActionSet copy() {
    return ActionSet(_actions);
  }

  void validate(Action action) {
    if(action is ElementAction) {
      throw ArgumentError("Action of type ${action.runtimeType} is an element action and cannot be added to a non-element action set");
    }
  }

  Action nextAction() {

    if(_actions == null || _actions.isEmpty) {
      return null;
    }

    bool gotoNextActionOrGoToFirstAction = _actionIndex == null; //  Since this will be true on first execution
    if(currentAction != null && currentAction.isComplete()) {
      currentAction.reset();
      gotoNextActionOrGoToFirstAction = true;
    }

    if(gotoNextActionOrGoToFirstAction) {
      if(_actionIndex == null) {
        _actionIndex = -1;
      }
      _actionIndex ++;
      _actionIndex %= _actions.length;

      if(currentAction is Goto) {
        (currentAction as Goto).callback = (label) {
          _actionIndex = _indexOf(label);
        };
      }

    }

    return currentAction;
  }

  int _indexOf(String label) {
    int index = _actions.indexWhere((e){
      return e is LabelAction && e.label == label;
    });

    if(index < 0){
      throw ArgumentError.value("Action label '$label' not found");
    }
    return index;
  }

  void collision() {

  }

}