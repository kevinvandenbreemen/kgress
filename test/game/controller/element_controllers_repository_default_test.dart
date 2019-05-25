import 'package:kevin_gamify/game/actions/action_set.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/controller/element_controllers_repository_default.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:test/test.dart';

import '../element/mock_element_kind.dart';
import 'ElementController_test.dart';

void main() {

  group("Actor Controllers", () {

    test("Provides for creating actor controllers", () {

      ActionSet actionSet = ActionSet([]);
      ElementControllerRepository repo = DefaultElementControllersRepository(MockElementDrawerRepository());

      Element element = Element(MockElementKind(), actionSet: actionSet);

      ElementController controller = repo.getController(element);
      expect(controller, isA<ActorController>());

    });

  });

}