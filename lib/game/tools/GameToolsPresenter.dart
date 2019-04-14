import 'package:flutter/src/widgets/framework.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';
import 'package:kevin_gamify/game/tools/area/area_interactor.dart';

abstract class GameToolsPresenter {

  List<Area> getAreas();

  goToArea(Area area, BuildContext context);

}

class DefaultGameToolsPresenter extends GameToolsPresenter {

  GameToolsView _view;

  AreaInteractor _areaInteractor;

  DefaultGameToolsPresenter(this._view, this._areaInteractor);

  @override
  List<Area> getAreas() {
    return _areaInteractor.getAreas();
  }

  @override
  goToArea(Area area, BuildContext context) {
    _areaInteractor.addGameDesignerToArea(area);
    _view.goToArea(area, context);
  }


}