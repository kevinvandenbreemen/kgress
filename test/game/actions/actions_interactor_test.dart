import 'package:kevin_gamify/game/actions/action.dart';
import 'package:kevin_gamify/game/actions/action_set.dart';
import 'package:kevin_gamify/game/actions/actions_interactor.dart';
import 'package:kevin_gamify/game/actions/builtin/Await.dart';
import 'package:kevin_gamify/game/actions/builtin/control_actions.dart';
import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/actions/builtin/events.dart';
import 'package:kevin_gamify/game/actions/element_action_set.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:test/test.dart';

import '../element/mock_element_kind.dart';
import '../mock_game_model.dart';

void main() {

  group("Initializing", () {

    test("Current action gracefully null when no action set", () {
      ActionsInteractor interactor = ActionsInteractor(MockGameModel());
      expect(() => interactor.performAction(), returnsNormally);
    });

    test("Current action gracefully null when action set empty", (){
      ActionsInteractor interactor = ActionsInteractor(MockGameModel(), actionSet: ActionSet([]));
      expect(() => interactor.performAction(), returnsNormally);
    });

  });

  group("ActionSet", () {
    test("Next action provided", () {
      Await await = Await();
      ActionSet actionSet = ActionSet([await]);

      Await expected = actionSet.actions[0] as Await;
      expect(actionSet.nextAction(), equals(expected));
    });
  });

  group("Awaiters", () {

    test("Awaits call and then goes on to next action on complete", () {

      Await await = Await();
      ActionSet actionSet = ActionSet([await, LabelAction("Done")]);
      await = actionSet.actions[0];

      ActionsInteractor interactor = ActionsInteractor(MockGameModel(),
        actionSet: actionSet
      );
      interactor.performAction();

      await.update();

      expect(actionSet.nextAction(), isA<LabelAction>());

    });

  });

  group("Event Handling", () {

    test("Handles Collision by going to designated next action", () {

      ElementKind kind = MockElementKind();
      Element element = Element(kind);

      LabelAction startLabel = LabelAction("start");
      On onCollideGotoBack = On(Events.collide, Goto("back"));
      Move right = Move(Direction.right, 1);
      Goto gotoStart = Goto("start");
      LabelAction backLabel = LabelAction("back");
      On onCollideGotoStart = On(Events.collide, Goto("start"));
      Move left = Move(Direction.left, 1);
      Goto gotoBack = Goto("back");

      ActionSet actionSet = ElementActionSet(element, [
        startLabel,
        onCollideGotoBack,
        right,
        gotoStart,
        backLabel,
        onCollideGotoStart,
        left,
        gotoBack
      ]);

      //  Set up interactor
      ActionsInteractor interactor = ActionsInteractor(MockGameModel(), actionSet: actionSet);

      //  Actions for validation
      ActionSet currentActionSet = interactor.actionSet;
      List<Action> actions = currentActionSet.actions;
      Move expectedRight = actions[2];
      Move expectedLeft = actions[6];

      interactor.performAction();
      interactor.performAction();
      interactor.performAction();
      interactor.performAction();

      expect(currentActionSet.currentAction, equals(expectedRight));
      interactor.collision();
      interactor.performAction();
      interactor.performAction();
      interactor.performAction();

      //  After collision we should be going backwards!
      expect(currentActionSet.currentAction, equals(expectedLeft));

    });

  });

}