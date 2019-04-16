
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

  void add(ElementKind kind, double locX, double locY, {int layer = 0}) {
    Element newElement = Element(kind);
    newElement.locYinTiles = locY;
    newElement.locXinTiles = locX;
    newElement.layerNum = layer;
    addElement(newElement);
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

  void fillLocations(ElementKind kind, List<List<int>> locations, {int layer = 0}) {
    if(locations.length != _area.sizeInTiles || locations[0].length != _area.sizeInTiles) {
      throw ArgumentError("Please specify value of 1 or 0 for each cell in the area (${_area.sizeInTiles} x ${_area.sizeInTiles})");
    }

    for(int i=0; i<_area.sizeInTiles; i++){
      for(int j=0; j<_area.sizeInTiles; j++) {

        if(locations[i][j] != 0 && locations[i][j] != 1) {
          throw ArgumentError("Please specify value of 1 or 0 for each cell in the area");
        }

        if(locations[i][j] == 1) {
          add(kind, i.toDouble(), j.toDouble(), layer: layer);
        }
      }
    }
  }

  void remove({ElementKind elementKind}) {
    _area._elements.removeWhere((element) => element.kind == elementKind);
  }

}