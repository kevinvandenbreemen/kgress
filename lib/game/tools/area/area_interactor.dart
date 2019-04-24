import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/tools/designer/game_designer_character.dart';

class AreaInteractor {

  List<Area> areas;

  int _maxLayer;

  AreaInteractor({GameCartridge game}) {
    this.areas = game.areas;
  }

  List<Area> getAreas() {
    return areas;
  }

  void addGameDesignerToArea(Area area, {int layer = -1}) {

    areas.forEach((eachArea) {
      AreaForEdit(eachArea).remove(elementKind: gameDesignerCharacter);
    });

    int desiredLayer = layer;
    if(layer == -1) {
      area.elements.forEach((e) {
        if(desiredLayer <= e.layerNum){
          desiredLayer = e.layerNum+1;
        }
      });
    }

    //  Calc max layer
    _maxLayer = -1;
    area.elements.forEach((element) {
      if(_maxLayer < element.layerNum) {
        _maxLayer = element.layerNum;
      }
    });
    _maxLayer++;  //  So we can be one layer above everything if we wish

    AreaForEdit(area).add(gameDesignerCharacter, 0, 0, layer: desiredLayer);
  }

  maxLayer() {
    return _maxLayer;
  }

}