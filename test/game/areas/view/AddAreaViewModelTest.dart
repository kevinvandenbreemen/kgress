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

  });

}