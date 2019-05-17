import '../MainGame.dart';
import 'action.dart';
import 'action_set.dart';

class ActionsInteractor {

  GameModel _gameModel;

  ActionSet _actionSet;

  ActionsInteractor(this._gameModel, {ActionSet actionSet}) {
    this._actionSet = actionSet;
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


}