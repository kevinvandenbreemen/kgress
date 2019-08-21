import 'package:kgress/game/areas/model/Area.dart';
import 'package:kgress/game/cartridge/GameCartridge.dart';
import 'package:kgress/game/tools/area/area_interactor.dart';
import 'package:kgress/game/tools/designer/game_designer_character.dart';
import 'package:test/test.dart';

import '../../element/mock_element_kind.dart';

void main() {

  group("Existing Areas", () {

    test("Gets list of areas", () {

      GameCartridge game = GameCartridge(areas: [Area(10, "Test Area")]);
      AreaInteractor areaInteractor = AreaInteractor(game: game);

      List<Area> areas = areaInteractor.getAreas();
      expect(areas, contains( game.areas[0] ));

    });

  });

  group("Add game designer", (){

    test("Add game designer to area", () {

      GameCartridge game = GameCartridge(areas: [Area(10, "Test Area"), Area(5, "Other Area")]);
      AreaInteractor areaInteractor = AreaInteractor(game: game);

      areaInteractor.addGameDesignerToArea(game.areas[0]);

      expect(game.areas[0].elements.where((element)=>element.kind == gameDesignerCharacter).toList().length, equals(1));

    });

    test("Removes previous game designer from area", (){
      GameCartridge game = GameCartridge(areas: [Area(10, "Test Area"), Area(5, "Other Area")]);
      AreaInteractor areaInteractor = AreaInteractor(game: game);

      areaInteractor.addGameDesignerToArea(game.areas[0]);
      areaInteractor.addGameDesignerToArea(game.areas[0]);

      expect(game.areas[0].elements.where((element)=>element.kind == gameDesignerCharacter).toList().length, equals(1));
    });

    test("Add to other area removes from previous area", () {
      GameCartridge game = GameCartridge(areas: [Area(10, "Test Area"), Area(5, "Other Area")]);
      AreaInteractor areaInteractor = AreaInteractor(game: game);

      areaInteractor.addGameDesignerToArea(game.areas[0]);
      areaInteractor.addGameDesignerToArea(game.areas[1]);

      expect(game.areas[0].elements.where((element)=>element.kind == gameDesignerCharacter).toList().length, equals(0));
      expect(game.areas[1].elements.where((element)=>element.kind == gameDesignerCharacter).toList().length, equals(1));
    });

    test("Add to area calculates number of available layers", () {

      Area testArea = Area(10, "Test Area");
      AreaForEdit(testArea).add(MockElementKind(), 0, 0, layer: 2);
      GameCartridge game = GameCartridge(areas: [testArea, Area(5, "Other Area")]);

      AreaInteractor areaInteractor = AreaInteractor(game: game);
      areaInteractor.addGameDesignerToArea(game.areas[0]);

      expect(areaInteractor.maxLayerNum, equals(3));
    });

    test("Add to area sets selected area", () {

      Area expectedArea = Area(5, "Other Area");

      GameCartridge game = GameCartridge(areas: [Area(10, "Test Area"), expectedArea]);
      AreaInteractor areaInteractor = AreaInteractor(game: game);

      areaInteractor.addGameDesignerToArea(game.areas[1]);

      expect(areaInteractor.selectedArea, equals(expectedArea));
    });
  });

}