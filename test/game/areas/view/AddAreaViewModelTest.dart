import 'package:kevin_gamify/game/areas/view/AddAreaViewModel.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:test/test.dart';

void main() {

  group("Should build an Area object", (){

    test("Should build area on request", (){

      AddAreaViewModel viewModel = AddAreaViewModel();
      Area area = viewModel.getArea();

      expect(area, isNotNull);

    });

    test("Should set area size to small", () {
      AddAreaViewModel viewModel = AddAreaViewModel();
      viewModel.setSmall();

      expect(viewModel.getArea().size, equals(10));
    });

    test("Should set area size to medium", (){
      AddAreaViewModel viewModel = AddAreaViewModel();
      viewModel.setMedium();

      expect(viewModel.getArea().size, equals(25));
    });

    test("Should set area size to large", (){
      AddAreaViewModel viewModel = AddAreaViewModel();
      viewModel.setLarge();

      expect(viewModel.getArea().size, equals(100));
    });

    test("Should set area size to custom", (){
      AddAreaViewModel viewModel = AddAreaViewModel();
      viewModel.setCustomSize(125);

      expect(viewModel.getArea().size, equals(125));
    });

    test("Should reset previous sizing on selection of custom", () {
      AddAreaViewModel viewModel = AddAreaViewModel();
      viewModel.setSmall();
      viewModel.switchToCustom();

      expect(viewModel.specifiedSize, equals(0));

    });

  });

}