import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/states/state_spaces.dart';

/// Kind of element.  For example, a 'chair' is a KIND of 'stationary object'
class ElementKind {

  final ElementType _type;

  final StateSpace stateSpace;

  String name;

  String get elementTypeName => _type.name;

  ElementKind(this._type, this.stateSpace);

}

/// Any kind of stationary object
class StationaryObjectKind extends ElementKind {

  StationaryObjectKind(): super(stationaryObject, stationary) {

  }
}