import 'package:kevin_gamify/game/actions/action_set.dart';
import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:test/test.dart';

void main() {

  group("Action type Validation", () {

    test("Cannot add element-specific action to a non-element-action set", () {

      expect(() =>
        ActionSet([
          Move(Direction.right, 100)
        ]), throwsA(TypeMatcher<ArgumentError>()));

    });

  });

}