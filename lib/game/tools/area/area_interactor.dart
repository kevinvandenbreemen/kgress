import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/tools/designer/game_designer_character.dart';

class AreaInteractor {

  List<Area> areas;

  AreaInteractor({GameCartridge game}) {
    this.areas = game.areas;
  }

  List<Area> getAreas() {
    return areas;
  }

  void addGameDesignerToArea(Area area) {
    areas.forEach((eachArea) {
      AreaForEdit(eachArea).remove(elementKind: gameDesignerCharacter);
    });
    AreaForEdit(area).add(gameDesignerCharacter, 0, 0);
  }

}