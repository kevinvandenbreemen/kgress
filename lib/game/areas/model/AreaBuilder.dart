import 'Area.dart';

class AreaBuilder {

  /// User-specified size
  int size;

  String name;

  Area _build() {
    Area ret = Area(size, name);
    return ret;
  }
  get area => _build();

}