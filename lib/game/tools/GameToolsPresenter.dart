import 'package:async/async.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'dart:async';

import 'package:kevin_gamify/game/tools/area/area_interactor.dart';

abstract class GameToolsPresenter {

  void showAreaSelector();

}

class DefaultGameToolsPresenter extends GameToolsPresenter {

  GameToolsView _view;

  AreaInteractor _areaInteractor;

  DefaultGameToolsPresenter(this._view, this._areaInteractor);

  @override
  void showAreaSelector() {
    _view.showAreaSelector(_areaInteractor.getAreas());
  }


}