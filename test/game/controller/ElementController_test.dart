import 'dart:math';
import 'dart:ui';

import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/states/states.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'mock_area_context.dart';
import 'package:kevin_gamify/game/controller/area_context.dart';
import '../element/mock_element_kind.dart';

class MockElementDrawerRepository extends Mock implements ElementDrawerRepository {}
class MockElementDrawer extends Mock implements ElementDrawer {}

class TestElementController extends ElementController {
  TestElementController(Element element, {ElementDrawerRepository elementDrawersRepo}) : super(element, elementDrawersRepo: elementDrawersRepo);

  @override
  Rect onUpdate(double timePassedSeconds, Element element, AreaContext context) {
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

      TestElementController(Element(MockElementKind()), elementDrawersRepo: mockRepo);

      verify(mockRepo.getDrawer(any));

    });
  });

  group("Game Loop", (){

    test("Defers to element drawer repo when updating", (){

      Element element = Element(MockElementKind());
      element.state = stationary;
      ElementController controller = TestElementController(element, elementDrawersRepo: mockRepo);
      controller.update(1.0, MockAreaContext());

      verify(mockDrawer.update(stationary, 1.0));

    });

  });

  group("Collision Detection", () {

    ElementController controller;
    Element element;
    AreaContext context;

    setUp((){
      element = Element(MockElementKind());
      element.state = stationary;
      controller = TestElementController(element, elementDrawersRepo: mockRepo);

      context = AreaContext(10);
      element.locXinTiles = 5;
      element.locYinTiles = 5;
    });

    test("Not colliding when nothing else in the area", (){
      expect(controller.collision(Direction.left, context), isFalse);
      expect(controller.collision(Direction.right, context), isFalse);
      expect(controller.collision(Direction.up, context), isFalse);
      expect(controller.collision(Direction.down, context), isFalse);
    });

    test("Collision when element about to collide on left", () {
      context.elements = {
        Point(4.7, 5): Element(MockElementKind()),
        Point(5, 5): element
      };

      expect(controller.collision(Direction.left, context), isTrue);
    });

    test("Collision when element about to collide on right", () {
      context.elements = {
        Point(5.2, 5): Element(MockElementKind()),
        Point(5, 5): element
      };

      expect(controller.collision(Direction.right, context), isTrue);
    });

    test("Collision when element about to collide down", (){
      context.elements = {
        Point(5.1, 5.2): Element(MockElementKind()),
        Point(5, 5): element
      };

      expect(controller.collision(Direction.down, context), isTrue);
    });

    test("No collision when stationary", (){
      context.elements = {
        Point(5.1, 5.2): Element(MockElementKind()),
        Point(5, 5): element
      };

      expect(controller.collision(Direction.stationary, context), isFalse);
    });

  });

  group("Move Check", (){

    ElementController controller;
    Element element;

    setUp((){
      element = Element(MockElementKind());
      element.state = stationary;
      controller = TestElementController(element, elementDrawersRepo: mockRepo);
    });

    test("Can't move left if at left side", (){
      AreaContext context = AreaContext(10);
      element.locXinTiles = 0;
      element.locYinTiles = 0;
      expect(controller.canMove(Direction.left, context), isFalse);
    });

    test("Can't move right if at right side", (){
      AreaContext context = AreaContext(10);
      element.locXinTiles = 9;
      element.locYinTiles = 0;
      expect(controller.canMove(Direction.right, context), isFalse);
    });

    test("Can't move down if at bottom", (){
      AreaContext context = AreaContext(10);
      element.locXinTiles = 7;
      element.locYinTiles = 9;
      expect(controller.canMove(Direction.down, context), isFalse);
    });

    test("Can't move up if at top", () {
      AreaContext context = AreaContext(10);
      element.locXinTiles = 7;
      element.locYinTiles = -0.1;
      expect(controller.canMove(Direction.up, context), isFalse);
    });

    test("Stationary allowed", () {
      AreaContext context = AreaContext(10);
      element.locXinTiles = 7;
      element.locYinTiles = 0;
      expect(controller.canMove(Direction.stationary, context), isTrue);
    });

    test("Move allowed within area range", (){
      AreaContext context = AreaContext(10);
      element.locXinTiles = 7;
      element.locYinTiles = 2;
      expect(controller.canMove(Direction.up, context), isTrue);
    });
  });

}