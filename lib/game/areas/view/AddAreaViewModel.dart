import 'package:kevin_gamify/game/areas/model/Area.dart';

class AddAreaViewModel {

  Area _area;


  AddAreaViewModel() {
    _area = Area();
  }

  Area getArea() {
    return _area;
  }

}