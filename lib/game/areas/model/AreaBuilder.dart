import 'Area.dart';

class AreaBuilder {

  /// User-specified size
  int size;

  Area _build() {
    Area ret = Area(size);
    return ret;
  }
  get area => _build();

}