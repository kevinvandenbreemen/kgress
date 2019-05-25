import 'package:kevin_gamify/game/actions/builtin/control_actions.dart';

import 'action.dart';
import 'builtin/element_actions/element_action.dart';

class ActionSet {

  List<Action> _actions;
  List<Action> get actions => List.unmodifiable(_actions);

  Action _currentAction;
  Action get currentAction => _currentAction;

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

    if(_currentAction != null && _currentAction.isComplete()) {
      _currentAction.reset();
      _currentAction = null;
    }

    if(_currentAction == null && _actions.isNotEmpty) {
      if(_actionIndex == null) {
        _actionIndex = -1;
      }
      _actionIndex ++;
      _actionIndex %= _actions.length;
      _currentAction = this._actions[_actionIndex];

      if(_currentAction is Goto) {
        (_currentAction as Goto).callback = (label) {
          _actionIndex = _indexOf(label);
          _currentAction = this._actions[_actionIndex];
        };
      }

    } else if (_currentAction == null){
      return null;
    }

    return _currentAction;
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