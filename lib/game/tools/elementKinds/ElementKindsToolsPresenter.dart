import 'package:kgress/game/areas/model/Area.dart';
import 'package:kgress/game/cartridge/GameCartridge.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/states/states.dart';
import 'package:kgress/game/tools/elementKinds/ElementKindsToolsInteractor.dart';

import 'ElementKindsToolElementController.dart';
import 'ElementKindsToolsView.dart';

mixin ElementKindsToolsPresenter {

  void start();

  void selectKind(ElementKind selectedElementKind);

  void setState(State state);

}

class DefaultElementKindsToolsPresenter with ElementKindsToolsPresenter {

  ElementKindsToolsView _view;

  ElementKindsToolsInteractor _interactor;

  GameCartridgeTooling _gameCartridge;

  ElementKindsToolElementController _currentElementController;

  DefaultElementKindsToolsPresenter(this._view, this._interactor, GameCartridge gameCartridge) {
    this._gameCartridge = GameCartridgeTooling(gameCartridge);
  }

  @override
  void start() {
    _view.setElementKinds(_interactor.getElementKinds());
    _view.setGameSettings(GameSettings(5));
    _view.setElementDrawerRepository(_gameCartridge.elementDrawerRepository);
  }

  @override
  void selectKind(ElementKind selectedElementKind) {
    Area simulatedArea = Area(3, "Simulated Area");
    AreaForEdit(simulatedArea).add(selectedElementKind, 0, 0);

    _view.showElementKind(simulatedArea, ElementKindsToolElementControllersRepository(
        _gameCartridge.elementDrawerRepository,
        createCallback: (elementController) {
          if(elementController is ElementKindsToolElementController) {
            this._currentElementController = elementController;
          }
        }
    ), selectedElementKind.stateSpace.states);

  }

  @override
  void setState(State state) {
    if(_currentElementController != null) {
      _currentElementController.setState(state);
    }
  }


}