import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';

abstract class GameBuilderPresenter {

  void showAddArea();

}

class DefaultGameBuilderPresenter extends GameBuilderPresenter {

  GameBuilderView _view;

  DefaultGameBuilderPresenter(this._view);

  @override
  void showAddArea() {
    _view.showAddArea();
  }
}