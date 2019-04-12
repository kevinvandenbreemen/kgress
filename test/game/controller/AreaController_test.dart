import 'dart:math';

import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/controller/area_context.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../element/mock_element_kind.dart';

class MockElementControllerRepository extends Mock implements ElementControllerRepository {}
class MockElementController extends Mock implements ElementController {}

void main() {

  group("Initialization", () {

    Area area;
    setUp((){


      area = Area(100, "Test Area");
      AreaForEdit areaForEdit = AreaForEdit(area);
      areaForEdit.addElement(Element(MockElementKind()));

    });

    test("Defers to Element Controller Repository During Initial Build", (){

      ElementControllerRepository mockRepo = MockElementControllerRepository();
      when(mockRepo.getController(any)).thenReturn(MockElementController());
      AreaController areaController = AreaController(
        controllerRepository: mockRepo,
        area: area
      );

      expect(areaController.elementControllers.length, equals(1));

    });

  });

  group("Context Creation", () {

    Area area;
    AreaController controller;

    setUp((){
      area = Area(15, "Test Area");
      controller = AreaController(
        controllerRepository: MockElementControllerRepository(),
        area: area
      );
    });

    test("Includes screen size of area", (){
      AreaContext context = controller.getContext();
      expect(context.numTiles, 15);
    });

    test("Includes all elements", () {
      AreaForEdit editor = AreaForEdit(area);
      editor.add(MockElementKind(), 1, 1);
      Element expected = area.elements[0];

      AreaContext context = controller.getContext();
      expect(context.elements.length, equals(1));
      expect(context.elements.containsKey(Point<double>(1.5,1.5)), isTrue);
      expect(context.elements[context.elements.keys.first], equals(expected));
    });

  });

  group("Game Loop", (){

    Area area;

    setUp((){

      area = Area(100, "Test Area");
      AreaForEdit areaForEdit = AreaForEdit(area);
      areaForEdit.addElement(Element(MockElementKind()));

    });

    test("Iterates over all controllers on update", (){

      ElementControllerRepository mockRepo = MockElementControllerRepository();
      when(mockRepo.getController(any)).thenReturn(MockElementController());

      AreaController areaController = AreaController(
          controllerRepository: mockRepo,
          area: area
      );

      areaController.update(1.0);
      MockElementController mockController = areaController.elementControllers[0] as MockElementController;
      verify(mockController.update(1.0, any));

    });
  });

}