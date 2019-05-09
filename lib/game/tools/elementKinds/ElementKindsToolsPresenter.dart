import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsInteractor.dart';

import 'ElementKindsToolsView.dart';

mixin ElementKindsToolsPresenter {

  void start();

}

class DefaultElementKindsToolsPresenter with ElementKindsToolsPresenter {

  ElementKindsToolsView _view;

  ElementKindsToolsInteractor _interactor;


  DefaultElementKindsToolsPresenter(this._view, this._interactor);

  @override
  void start() {
    _view.setElementKinds(_interactor.getElementKinds());
  }
  
}