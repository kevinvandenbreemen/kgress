import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/imagesets/image_set.dart';
import 'package:kevin_gamify/game/states/state_spaces.dart' as stateSpaces;
import 'package:kevin_gamify/game/states/states.dart' as states;
import 'package:meta/meta.dart';

/// Kind of element.  For example, a 'chair' is a KIND of 'stationary object'
abstract class ElementKind {

  ElementType _type;

  stateSpaces.StateSpace _stateSpace;

  String name;

  /// Number of tiles length of this element
  int lengthInTiles;

  /// Number of tiles width of this element
  int widthInTiles;

  String get elementTypeName => _type.name;

  ElementType get elementType => _type;

  stateSpaces.StateSpace get stateSpace => _stateSpace;

  /// Image sets for every state this kind of element can be in
  Map<states.State, ImageSet> get statesToImageSets;

  ElementKind({@required String name, @required ElementType elementType, @required stateSpaces.StateSpace stateSpace}) {
    if(name == null || name.trim().length == 0){
      throw ArgumentError.notNull("name");
    }
    this.name = name;
    this._type = elementType;
    this._stateSpace = stateSpace;
  }

}

/// Any kind of stationary object
class StationaryObjectKind extends ElementKind {

  ImageSet _imageSet;

  StationaryObjectKind({@required String name, @required SingleImage stationaryImage}): super(elementType: stationaryObject, stateSpace: stateSpaces.stationary, name: name) {
    this._imageSet = stationaryImage;
  }

  @override
  Map<states.State, ImageSet> get statesToImageSets => {states.stationary: _imageSet};


}

/// Anything or anyone that can be in different states!
class StatefulObjectKind extends ElementKind {

  Map<states.State, ImageSet> _statesToImageSets;

  StatefulObjectKind(ElementType type, stateSpaces.StateSpace stateSpace, {@required Map<states.State, ImageSet> statesToImageSets, @required String name}) : super(elementType: type, stateSpace: stateSpace, name: name) {
    if(statesToImageSets == null){
      throw ArgumentError.notNull("statesToImageSets");
    }

    stateSpace.states.forEach((state) {
      if(!statesToImageSets.keys.contains(state)){
        throw ArgumentError("Missing image set for ${state}");
      }
    });

    _statesToImageSets = statesToImageSets;
  }

  @override
  Map<states.State, ImageSet> get statesToImageSets => Map.unmodifiable(_statesToImageSets);

}