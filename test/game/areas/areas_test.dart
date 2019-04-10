import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/areas/model/areas_registry.dart';
import 'package:test/test.dart';

void main() {

  group("Areas", (){

    test("Added to areas registry", (){
      Area area = Area(10, "Area Registry Test");
      expect(allAreasInMyGame, contains(area));
    });

  });

}