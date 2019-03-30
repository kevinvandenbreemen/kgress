import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';

abstract class GameBuilderPresenter {

  void showAddArea();

}

class DefaultGameBuilderPresenter extends GameBuilderPresenter {

  GameBuilderView _view;

  GameCartridgeForEdit _gameCartridgeForEdit;

  DefaultGameBuilderPresenter(this._view, this._gameCartridgeForEdit);

  @override
  void showAddArea() {
    _view.showAddArea();
  }
}