
import 'package:kevin_gamify/game/elements/element.dart';

/// An area in a game
class Area {

  /// Size in tiles
  int _size;

  String _name;

  List<Element> _elements;

  List<Element> get elements => List.unmodifiable(_elements);

  Area(this._size, this._name) {
    this._elements = List();
  }

  get size => _size;

  String get name => _name;

}

class AreaForEdit {

  Area _area;


  AreaForEdit(this._area);

  void addElement(Element element) {
    _area._elements.add(element);
  }

}