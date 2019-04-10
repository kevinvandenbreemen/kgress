import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/tools/area/area_interactor.dart';
import 'package:test/test.dart';

void main() {

  group("Existing Areas", () {

    AreaInteractor areaInteractor;

    setUp((){
      areaInteractor = AreaInteractor();
    });

    test("Gets list of areas", () {

      Area area = Area(10, "Area Interactor Test");

      List<Area> areas = areaInteractor.getAreas();
      expect(areas, contains(area));

    });

  });

}