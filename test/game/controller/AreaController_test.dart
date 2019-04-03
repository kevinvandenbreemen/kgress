import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:test/test.dart';

import 'MockElementControllerRepository.dart';

void main() {

  group("Initialization", () {

    GameCartridge gameCartridge;

    setUp((){
      gameCartridge = GameCartridge();

      GameCartridgeForEdit editor = GameCartridgeForEdit(gameCartridge);

      Area area = Area(100, "Test Area");
      AreaForEdit areaForEdit = AreaForEdit(area);
      areaForEdit.addElement(Element());

      editor.addArea(area);

    });

    test("Defers to Element Controller Repository During Initial Build", (){

      ElementControllerRepository mockRepo = MockElementControllerRepository();
      AreaController areaController = AreaController(
        controllerRepository: mockRepo,
        area: gameCartridge.areas[0]
      );

      expect(areaController.elementControllers.length, equals(1));

    });

  });

}