import 'package:kevin_gamify/game/actions/action_set.dart';
import 'package:kevin_gamify/game/actions/actions_interactor.dart';
import 'package:kevin_gamify/game/actions/builtin/Await.dart';
import 'package:test/test.dart';

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
      ActionSet actionSet = ActionSet([await]);
      await = actionSet.actions[0];

      ActionsInteractor interactor = ActionsInteractor(MockGameModel(),
        actionSet: actionSet
      );
      interactor.performAction();

      await.update();

      interactor.performAction();

      expect(actionSet.nextAction(), isNull);

    });

  });

}