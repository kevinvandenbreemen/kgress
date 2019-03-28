import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/areas/model/AreaBuilder.dart';

class AddAreaViewModel {

  AreaBuilder _builder;

  AddAreaViewModel() {
    _builder = AreaBuilder();
  }

  Area getArea() {
    return _builder.area;
  }

  void setSmall() {
    _builder.size = 10;
  }

  void setMedium() {
    _builder.size = 25;
  }

  void setLarge() {
    _builder.size = 100;
  }

  void setCustomSize(int size) {
    _builder.size = size;
  }

}