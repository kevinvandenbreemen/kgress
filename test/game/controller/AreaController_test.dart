import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockElementControllerRepository extends Mock implements ElementControllerRepository {}
class MockElementController extends Mock implements ElementController {}

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
      when(mockRepo.getController(any)).thenReturn(MockElementController());
      AreaController areaController = AreaController(
        controllerRepository: mockRepo,
        area: gameCartridge.areas[0]
      );

      expect(areaController.elementControllers.length, equals(1));

    });

  });

  group("Game Loop", (){

    GameCartridge gameCartridge;

    setUp((){
      gameCartridge = GameCartridge();

      GameCartridgeForEdit editor = GameCartridgeForEdit(gameCartridge);

      Area area = Area(100, "Test Area");
      AreaForEdit areaForEdit = AreaForEdit(area);
      areaForEdit.addElement(Element());

      editor.addArea(area);

    });

    test("Iterates over all controllers on update", (){

      ElementControllerRepository mockRepo = MockElementControllerRepository();
      when(mockRepo.getController(any)).thenReturn(MockElementController());

      AreaController areaController = AreaController(
          controllerRepository: mockRepo,
          area: gameCartridge.areas[0]
      );

      areaController.update(1.0);
      MockElementController mockController = areaController.elementControllers[0] as MockElementController;
      verify(mockController.update(1.0));

    });
  });

}