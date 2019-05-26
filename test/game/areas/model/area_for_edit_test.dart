import 'package:kevin_gamify/game/actions/builtin/control_actions.dart';
import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:test/test.dart';

import '../../element/mock_element_kind.dart';

void main() {

  group("Adding Elements", () {

    test("Adding element kind yields element", () {

      ElementKind kind = MockElementKind();
      Area area = Area(5, "test");
      Element element = AreaForEdit(area).add(kind, 0, 0);

      expect(element, isNotNull);
      expect(element.kind, equals(kind));

    });

    test("When action set is provided with element kind to add, action set is added to element", () {

      Area area = Area(100, "Test Area");  //  Redefine for this test to make things simpler

      AreaForEdit(area).add(MockElementKind(), 10, 10, actionSetActions: [
        LabelAction("Hello"),
        LabelAction("World"),
        Move(Direction.left, 100)
      ]);

      expect(area.elements[0].actions.isPresent, isTrue);

    });

  });

}