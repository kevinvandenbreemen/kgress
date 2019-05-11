import 'package:kevin_gamify/example/images/example_image_sets.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/elements/element_types.dart' as elementTypes;
import 'package:kevin_gamify/game/states/state_spaces.dart';
import 'package:kevin_gamify/game/states/states.dart' as states;

ElementKind floorTile = StationaryObjectKind(name: "Basic Floor Tile", stationaryImage: greenTile);

ElementKind decorativeTile = StationaryObjectKind(name: "Fancy Floor Tile", stationaryImage: greenGrayTile);

/// Player character.  Very limited state space unfortunately
ElementKind playerCharacter = StatefulObjectKind(elementTypes.playerCharacter, directional, statesToImageSets: {
  states.stationary: PlayerCharacterSets.imgSetStationary,
  states.movingUp: PlayerCharacterSets.imgSetGoingUp,
  states.movingDown: PlayerCharacterSets.imgSetGoingDown,
  states.movingLeft: PlayerCharacterSets.imgSetGoingLeft,
  states.movingRight: PlayerCharacterSets.imgSetGoingRight,
}, name: "Player Character");

List<ElementKind> exampleElementKinds = List<ElementKind>.from([
  floorTile,
  decorativeTile,
  playerCharacter
]);