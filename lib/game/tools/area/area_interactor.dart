import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';

class AreaInteractor {

  List<Area> areas;

  AreaInteractor({GameCartridge game}) {
    this.areas = game.areas;
  }

  List<Area> getAreas() {
    return areas;
  }

}