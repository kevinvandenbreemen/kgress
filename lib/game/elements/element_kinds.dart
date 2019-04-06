import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/imagesets/image_set.dart';
import 'package:kevin_gamify/game/states/state_spaces.dart' as stateSpaces;
import 'package:kevin_gamify/game/states/states.dart' as states;

/// Kind of element.  For example, a 'chair' is a KIND of 'stationary object'
abstract class ElementKind {

  final ElementType _type;

  final stateSpaces.StateSpace stateSpace;

  String name;

  /// Number of tiles length of this element
  int lengthInTiles;

  /// Number of tiles width of this element
  int widthInTiles;

  String get elementTypeName => _type.name;

  /// Image sets for every state this kind of element can be in
  Map<states.State, ImageSet> get statesToImageSets;

  ElementKind(this._type, this.stateSpace);

}

/// Any kind of stationary object
class StationaryObjectKind extends ElementKind {

  ImageSet _imageSet;

  StationaryObjectKind({SingleImage stationaryImage}): super(stationaryObject, stateSpaces.stationary) {
    this._imageSet = stationaryImage;
  }

  @override
  Map<states.State, ImageSet> get statesToImageSets => {states.stationary: _imageSet};


}