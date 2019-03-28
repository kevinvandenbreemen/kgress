import 'Area.dart';

class AreaBuilder {
  int size;

  Area _build() {
    Area ret = Area(size);
    return ret;
  }
  get area => _build();

}