import 'package:async/async.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/elements/element_types.dart';

/// Business logic and data for UI:  Adding an element kind
class AddElementKindViewModel {

  ElementKind _elementKind;

  String get elementTypeName => _elementKind == null ? "" : _elementKind.elementTypeName;

  void setElementType(ElementType elementType) {
    if(elementType == stationaryObject) {
      _elementKind = StationaryObjectKind();
    }
  }

  Future<Result> save() {
    if(_elementKind.name == null || _elementKind.name.trim().isEmpty) {
      return Future.value(Result.error("Please give a name for this kind of object!"));
    }
  }



}