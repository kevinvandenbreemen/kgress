import 'package:kgress/game/actions/builtin/control_actions.dart';
import 'package:kgress/game/actions/builtin/element_actions/action_move.dart';
import 'package:kgress/game/actions/builtin/events.dart';
import 'package:kgress/game/components/Direction.dart';
import 'package:test/test.dart';

void main() {

  group("On Event", () {

    test("Cannot initialize with something that is not a control statement", () {

      On on = On(Events.collide, Move(Direction.left, 100));
      expect(()=>on.validate(), throwsA(TypeMatcher<ArgumentError>()));

    });

  });

}