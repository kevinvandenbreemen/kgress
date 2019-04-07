
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';

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

  get sizeInTiles => _size;

  String get name => _name;

}

class AreaForEdit {

  Area _area;


  AreaForEdit(this._area);

  void addElement(Element element) {
    _area._elements.add(element);
  }

  void fill(ElementKind kind, {int layer = 0}) {
    for(int i=0; i<_area.sizeInTiles; i++) {
      for(int j=0; j<_area.sizeInTiles; j++) {
        Element element = Element(kind);
        element.locXinTiles = i.toDouble();
        element.locYinTiles = j.toDouble();
        element.layerNum = layer;
        addElement(element);
      }
    }
  }

}