import 'package:kevin_gamify/game/areas/model/Area.dart';
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

  });

}