import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/areas/model/areas_registry.dart';

class AreaInteractor {
  List<Area> getAreas() {
    return List.unmodifiable(allAreasInMyGame);
  }

}