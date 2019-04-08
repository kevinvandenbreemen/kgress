import 'package:kevin_gamify/game/imagesets/image_set.dart';

SingleImage greenTile = SingleImage("green_tile.png");
SingleImage greenGrayTile = SingleImage("green_gray_tile.png");

class PlayerCharacterSets {
  static final SpriteSheetRowSequence imgSetGoingUp = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 8, 9);
  static final SpriteSheetRowSequence imgSetGoingDown = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 10, 9);
  static final SpriteSheetRowSequence imgSetGoingLeft = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 9, 9);
  static final SpriteSheetRowSequence imgSetGoingRight = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 11, 9);
  static final SpriteSheetRowSequence imgSetStationary = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 1, 7);
}