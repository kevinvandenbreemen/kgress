import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/tools/area/area_interactor.dart';
import 'package:test/test.dart';

void main() {

  group("Existing Areas", () {

    test("Gets list of areas", () {

      GameCartridge game = GameCartridge(areas: [Area(10, "Test Area")]);
      AreaInteractor areaInteractor = AreaInteractor(game: game);

      List<Area> areas = areaInteractor.getAreas();
      expect(areas, contains( game.areas[0] ));

    });

  });

}