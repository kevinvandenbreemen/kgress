import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/elements/workflow/add_element_kind_view_model.dart';
import 'package:test/test.dart';

void main() {

  group("Create stationary object kind", () {

    
    AddElementKindViewModel viewModel;
    
    setUp(() {
      viewModel = AddElementKindViewModel();
    });

    test("Shows blank type name when no type specified", () {
      expect(viewModel.elementTypeName, equals(""), reason: "No type given yet");
    });

    test("Shows element type name once type specified", () {
      viewModel.setElementType(stationaryObject);
      expect(viewModel.elementTypeName, equals(stationaryObject.name));
    });

    test("Prevents user from adding object kind with no name", () {
      viewModel.setElementType(stationaryObject);
      viewModel.save().then(expectAsync1((result){
        expect(result.isError, isTrue, reason: "Missing name");
      }));
    });
  });

}