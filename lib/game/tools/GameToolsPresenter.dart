import 'package:flutter/src/widgets/framework.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';
import 'package:kevin_gamify/game/tools/area/area_interactor.dart';

abstract class GameToolsPresenter {

  List<Area> getAreas();

  setCurrentArea(Area area);

  /// Gets all the possible layer selections given the layer we're on
  List<int> getLayerNumbers();

  goToArea(Area area, BuildContext context, {int layerNum});

  void gotoLayer(int layerNum, BuildContext context);

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
  goToArea(Area area, BuildContext context, {int layerNum}) {
    _areaInteractor.addGameDesignerToArea(area, layer: layerNum);
    _view.goToArea(area, context);
  }

  @override
  setCurrentArea(Area area) {
    _areaInteractor.addGameDesignerToArea(area);
  }

  @override
  List<int> getLayerNumbers() {
    return List.generate(_areaInteractor.maxLayerNum+1, (index)=>index);
  }

  @override
  void gotoLayer(int layerNum, BuildContext context) {
    goToArea(_areaInteractor.selectedArea, context, layerNum: layerNum);
  }


}