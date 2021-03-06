
import 'package:kgress/game/actions/action.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/elements/element_kinds.dart';

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

  /// Adds element of given [kind] and returns it
  Element add(ElementKind kind, double locX, double locY, {int layer = 0, List<Action> actionSetActions}) {
    Element newElement = Element(kind, actionSet: actionSetActions);
    newElement.locYinTiles = locY;
    newElement.locXinTiles = locX;
    newElement.layerNum = layer;
    addElement(newElement);

    return newElement;
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

  AreaForEdit fillLocations(ElementKind kind, List<List<int>> locations, {int layer = 0}) {
    if(locations.length != _area.sizeInTiles || locations[0].length != _area.sizeInTiles) {
      throw ArgumentError("Please specify value of 1 or 0 for each cell in the area (${_area.sizeInTiles} x ${_area.sizeInTiles})");
    }

    for(int i=0; i<_area.sizeInTiles; i++){       //  Each row
      for(int j=0; j<_area.sizeInTiles; j++) {    //  Each column

        if(locations[i][j] != 0 && locations[i][j] != 1) {
          throw ArgumentError("Please specify value of 1 or 0 for each cell in the area");
        }

        if(locations[i][j] == 1) {
          add(kind, j.toDouble(), i.toDouble(), layer: layer);
        }
      }
    }

    return this;
  }

  void remove({ElementKind elementKind}) {
    _area._elements.removeWhere((element) => element.kind == elementKind);
  }

}