import 'package:kgress/game/actions/builtin/element_actions/action_move.dart';
import 'package:kgress/game/components/Direction.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/states/states.dart';
import 'package:test/test.dart';

import '../../element/mock_element_kind.dart';

void main() {

  group("Moving the Element", () {

    test("Moves the element by 1", () {

      ElementKind kind = MockElementKind();
      Element element = Element(kind);

      Move move = Move(Direction.right, 1);
      move.setElement(element);

      expect(element.locXinTiles, equals(0.0));
      for(int i=0; i<20; i++){
        move.act();
      }
      expect(element.locXinTiles, closeTo(1.0, 0.001));

    });

    test("Changes the state of an element to reflect direction", () {

      ElementKind kind = MockElementKind();
      Element element = Element(kind);

      Move move = Move(Direction.right, 1);
      move.setElement(element);

      move.act();

      expect(element.state, equals(movingRight));

    });

    test("Is complete after move complete", () {
      ElementKind kind = MockElementKind();
      Element element = Element(kind);

      Move move = Move(Direction.right, 1);
      move.setElement(element);

      for(int i=0; i<20; i++){
        move.act();
      }

      expect(move.isComplete(), isTrue);
    });

  });

  group("Resetting", () {
    test("Resets element etc", () {
      ElementKind kind = MockElementKind();
      Element element = Element(kind);

      Move move = Move(Direction.right, 1);
      move.setElement(element);

      expect(element.locXinTiles, equals(0.0));
      for(int i=0; i<20; i++){
        move.act();
      }

      move.reset();
      expect(move.element, isNull);

      move.setElement(element);

      for(int i=0; i<20; i++){
        move.act();
      }
      expect(move.isComplete(), isTrue);
      expect(element.locXinTiles, closeTo(2.0, 0.001));

    });
  });

}