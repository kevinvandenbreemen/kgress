import 'package:kevin_gamify/game/areas/model/Area.dart';

/// A video game created and played in the KGRESS engine
class GameCartridge {

  List<Area> _areas;

  List<Area> get areas => List.unmodifiable(_areas);

  GameCartridge({
    List<Area> areas
  }) {
    this._areas = areas;
  }


}

class GameSettings {

  double tileWidthsPerScreen = 5;

  GameSettings(this.tileWidthsPerScreen);

}