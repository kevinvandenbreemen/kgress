import 'package:kevin_gamify/game/elements/element_interactors.dart';
import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:test/test.dart';

void main() {

  group("List of ELement Types", () {

    test("Contains Stationary Object", () {

      List<ElementType> elementTypes = ElementTypesInteractor().getTypes();
      
      expect(elementTypes, contains(stationaryObject));

    });

  });

}