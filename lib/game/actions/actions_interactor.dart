import '../GameWorldBridge.dart';
import 'action.dart';
import 'action_set.dart';

class ActionsInteractor {

  GameWorldBridge _gameWorldBridge;

  ActionSet _actionSet;
  ActionSet get actionSet => _actionSet;

  ActionsInteractor(this._gameWorldBridge, {ActionSet actionSet, GameWorldBridge gameWorldBridge}) {
    this._actionSet = actionSet;
    this._gameWorldBridge = gameWorldBridge;
  }

  void performAction() {
    if(_actionSet == null) {
      return;
    }
    Action action = _actionSet.nextAction();
    if(action != null){
      action.act();
    }
  }

  void collision() {
    _actionSet.collision();
  }


}