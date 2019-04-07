library kgress.element_types;

/// Over-arching class of an element in a game
class ElementType {

  final String _name;

  ElementType(this._name);

  String get name => _name;

}

class _StationaryObject extends ElementType {
  _StationaryObject() : super("Stationary Object");
}
_StationaryObject stationaryObject = _StationaryObject();

class _PlayerCharacter extends ElementType {
  _PlayerCharacter(): super("Player Character");
}
_PlayerCharacter playerCharacter = _PlayerCharacter();



final List<ElementType> types = [
  stationaryObject,
  playerCharacter
];