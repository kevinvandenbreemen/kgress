import 'package:kevin_gamify/game/areas/model/Area.dart';

/// A video game created and played in the KGRESS engine
class GameCartridge {

  List<Area> _areas;

  List<Area> get areas => List.unmodifiable(_areas);

  GameCartridge() {
    this._areas = List<Area>();
  }


}

/// Type for editing a game cartridge.  IMPORTANT:  This type should not provide any
/// business logic.  Its sole purpose is to provide access to game elements that a
/// regular game player would not have access to on her own.
class GameCartridgeForEdit {

  GameCartridge _game;

  GameCartridgeForEdit(this._game);

  /// All areas in the game
  List<Area> get areas => _game._areas;

  void addArea(Area area) {
    _game._areas.add(area);
  }

}

class GameSettings {

  double tileWidthsPerScreen = 5;

  GameSettings(this.tileWidthsPerScreen);

}