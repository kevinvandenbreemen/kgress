import 'package:kevin_gamify/game/actions/action_set.dart';
import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/actions/element_action_set.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:test/test.dart';

import '../element/mock_element.dart';

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

  });

}