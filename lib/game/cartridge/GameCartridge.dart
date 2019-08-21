import 'package:kgress/game/areas/model/Area.dart';
import 'package:kgress/game/controller/element_controllers.dart';
import 'package:kgress/game/controller/element_controllers_repository_default.dart';
import 'package:kgress/game/imagesets/element_drawers.dart';

/// A video game created and played in the KGRESS engine
class GameCartridge {

  List<Area> _areas;

  ElementDrawerRepository _elementDrawerRepository;

  List<Area> get areas => List.unmodifiable(_areas);

  GameCartridge({
    List<Area> areas,
    ElementDrawerRepository elementDrawerRepo
  }) {
    this._areas = areas;
    this._elementDrawerRepository = elementDrawerRepo;
  }

  ElementControllerRepository get elementControllerRepository => DefaultElementControllersRepository(
    _elementDrawerRepository
  );

}

class GameSettings {

  double tileWidthsPerScreen = 5;

  GameSettings(this.tileWidthsPerScreen);

}

/// Exposes elements of the game cartridge that wouldn't normally be exposed to a normal game
class GameCartridgeTooling {

  GameCartridge _cartridge;

  GameCartridgeTooling(this._cartridge);

  ElementDrawerRepository get elementDrawerRepository => _cartridge._elementDrawerRepository;


}