import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsInteractor.dart';

import 'ElementKindsToolsView.dart';

mixin ElementKindsToolsPresenter {

  void start();

  void selectKind(ElementKind selectedElementKind);

}

class DefaultElementKindsToolsPresenter with ElementKindsToolsPresenter {

  ElementKindsToolsView _view;

  ElementKindsToolsInteractor _interactor;

  GameCartridgeTooling _gameCartridge;

  DefaultElementKindsToolsPresenter(this._view, this._interactor, GameCartridge gameCartridge) {
    this._gameCartridge = GameCartridgeTooling(gameCartridge);
  }

  @override
  void start() {
    _view.setElementKinds(_interactor.getElementKinds());
    _view.setGameSettings(GameSettings(5));
  }

  @override
  void selectKind(ElementKind selectedElementKind) {
    Area simulatedArea = Area(3, "Simulated Area");
    AreaForEdit(simulatedArea).add(selectedElementKind, 0, 0);

    _view.showElementKind(_gameCartridge.elementDrawerRepository, simulatedArea);

  }
  
}