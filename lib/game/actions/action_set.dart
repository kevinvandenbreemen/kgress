import 'action.dart';
import 'builtin/element_actions/element_action.dart';

class ActionSet {

  List<Action> _actions;
  List<Action> get actions => List.unmodifiable(_actions);

  Action _currentAction;

  ActionSet(List<Action> actions) {
    actions.forEach((action)=>validate(action));
    this._actions = actions.map((a)=>a.copy()).toList();
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
      _currentAction = this._actions.removeAt(0);
    } else if (_currentAction == null){
      return null;
    }

    return _currentAction;
  }

}