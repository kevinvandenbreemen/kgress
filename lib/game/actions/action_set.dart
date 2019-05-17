import 'action.dart';

class ActionSet {

  List<Action> _actions;

  Action _currentAction;

  ActionSet(this._actions);

  nextAction() {

    if(_currentAction != null && _currentAction.isComplete()) {
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