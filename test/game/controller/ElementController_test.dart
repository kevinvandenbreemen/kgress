import 'dart:ui';

import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/states/states.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';

class MockElementDrawerRepository extends Mock implements ElementDrawerRepository {}
class MockElementDrawer extends Mock implements ElementDrawer {}

class TestElementController extends ElementController {
  TestElementController(Element element, {ElementDrawerRepository elementDrawersRepo}) : super(element, elementDrawersRepo: elementDrawersRepo);

  @override
  Rect onUpdate(double timePassedSeconds, Element element) {
    // TODO: implement onUpdate
    return null;
  }

}

void main() {

  MockElementDrawer mockDrawer;
  MockElementDrawerRepository mockRepo = MockElementDrawerRepository();

  setUp((){
    mockDrawer = MockElementDrawer();
    when(mockRepo.getDrawer(any)).thenReturn(mockDrawer);
  });

  group("Initialization", () {
    test("Defers to ElementDrawerRepository when Creating", (){

      TestElementController(Element(), elementDrawersRepo: mockRepo);

      verify(mockRepo.getDrawer(any));

    });
  });

  group("Game Loop", (){

    test("Defers to element drawer repo when updating", (){

      Element element = Element();
      element.state = stationary;
      ElementController controller = TestElementController(element, elementDrawersRepo: mockRepo);
      controller.update(1.0);

      verify(mockDrawer.update(stationary, 1.0));

    });

  });

}