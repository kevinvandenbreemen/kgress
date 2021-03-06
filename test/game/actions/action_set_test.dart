import 'package:kgress/game/actions/action.dart';
import 'package:kgress/game/actions/action_set.dart';
import 'package:kgress/game/actions/builtin/Await.dart';
import 'package:kgress/game/actions/builtin/control_actions.dart';
import 'package:kgress/game/actions/builtin/element_actions/action_move.dart';
import 'package:kgress/game/actions/builtin/element_actions/element_action.dart';
import 'package:kgress/game/actions/builtin/events.dart';
import 'package:kgress/game/actions/element_action_set.dart';
import 'package:kgress/game/components/Direction.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/states/states.dart';
import 'package:test/test.dart';

import '../element/mock_element.dart';
import '../element/mock_element_kind.dart';

void main() {

  group("Action type Validation", () {

    test("Cannot add element-specific action to a non-element-action set", () {

      expect(() =>
        ActionSet([
          Move(Direction.right, 100)
        ]), throwsA(TypeMatcher<ArgumentError>()));

    });

    test("Can add element actions to element action set", () {
      expect(() =>
          ElementActionSet(MockElement(), [
            Move(Direction.right, 100)
          ]), returnsNormally);
    });

    test("Prevents initializing action set with On that calls non-control-flow action type", () {

      expect(()=>ActionSet([
        On(Events.collide, Move(Direction.right, 100))
      ]), throwsA(TypeMatcher<ArgumentError>()));

    });

  });

  group("Initialization", () {

    test("Creates with a clone of all actions so that action lists can be re-used", () {

      Action action1 = Await();
      Element element = Element(MockElementKind());
      ElementAction action2 = Move(Direction.up, 1);

      ActionSet set = ElementActionSet(element, [action2, action1]);

      set.nextAction().act();

      expect(action2.element, isNull);

    });

    test("Can create a new action set using existing action set", () {

      Action action1 = Await();
      Element element = Element(MockElementKind());
      ElementAction action2 = Move(Direction.up, 1);
      ActionSet set = ElementActionSet(element, [action1, action2]);

      ActionSet copy = set.copy();
      expect(copy.actions.length, equals(2));
      expect(copy.actions[0], isA<Await>());
      expect(copy.actions[1], isA<Move>());

    });

  });

  group("Control Actions Execution", () {

    test("Goto action goes to the correct action", () {

      Element element = MockElement();

      ElementActionSet set = new ElementActionSet(element, [LabelAction("Start"), LabelAction("Middle"), Goto("Start"), LabelAction("NeverGetHere")]);

      LabelAction start = set.actions[0];
      LabelAction goto = set.actions[2];

      set.nextAction().act();
      set.nextAction().act();

      Action nextAction = set.nextAction();
      expect(nextAction, equals(goto));

      nextAction.act();
      expect(set.nextAction(), equals(start));

    });

    test("Event Handling Triggers Correct Action", () {

      Element element = MockElement();

      ElementActionSet set = new ElementActionSet(element, [On(Events.collide, Goto("Start")), LabelAction("Start"), LabelAction("Middle"), LabelAction("End")]);

      LabelAction start = set.actions[1];

      set.nextAction().act();
      set.nextAction().act();
      set.nextAction().act();
      set.collision();

      expect(set.nextAction(), equals(start), reason: "Collision occurred.  Should go to start action");

    });

    test("Collision Handler resets element state", () {
      Element element = Element(MockElementKind());
      element.state = movingRight;

      ElementActionSet set = new ElementActionSet(element, [On(Events.collide, Goto("Start")), LabelAction("Start"), LabelAction("Middle"), LabelAction("End")]);

      LabelAction start = set.actions[1];

      set.nextAction().act();
      set.nextAction().act();
      set.nextAction().act();
      set.collision();

      expect(set.nextAction(), equals(start), reason: "Collision occurred.  Should go to start action");
      expect(element.state, equals(stationary));
    });

    test("Collision Handler resets current action", () {
      Element element = Element(MockElementKind());
      element.state = movingRight;

      ElementActionSet set = new ElementActionSet(element, [On(Events.collide, Goto("Start")), LabelAction("Start"), Move(Direction.down, 5), LabelAction("End")]);

      Move move = set.actions[2] as Move;

      set.nextAction().act();
      set.nextAction().act();
      set.nextAction().act();

      set.collision();

      expect(move.element, isNull, reason: "Collision occurred.  Current action should be reset before we go on to how to handle collision");
    });

  });

  group("Element Action Set", () {

    test("Next action properly sets element", () {

      Element element = MockElement();
      ElementActionSet set = new ElementActionSet(element, [Move(Direction.down, 100)]);
      Action next = set.nextAction();

      expect(next, isA<ElementAction>());

      ElementAction elementAction = next as ElementAction;
      expect(elementAction.element, equals(element));

    });

    test("Next action resets previous action", () {

      ElementKind kind = MockElementKind();
      Element element = Element(kind);

      ElementAction moveDown = Move(Direction.down, 1);
      ElementAction moveUp = Move(Direction.up, 1);

      ElementActionSet set = new ElementActionSet(element, [moveDown, moveUp]);

      moveDown = set.actions[0];
      moveUp = set.actions[1];

      Action next = set.nextAction();
      expect(next, equals(moveDown));
      for(int i=0; i<20; i++){
        next.act();
      }

      next = set.nextAction();
      expect(next, equals(moveUp));

      expect(moveDown.element, isNull);

    });

  });

}