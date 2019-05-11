import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/elements/element_types.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/imagesets/image_set.dart';
import 'package:kevin_gamify/game/states/state_spaces.dart';
import 'package:kevin_gamify/game/states/states.dart' as states;

class GameDesignerImageSets {
  static final SpriteSheetRowSequence imgSetGoingUp = SpriteSheetRowSequence.fromStart('game_designer.png', 64.0, 64.0, 8, 9);
  static final SpriteSheetRowSequence imgSetGoingDown = SpriteSheetRowSequence.fromStart('game_designer.png', 64.0, 64.0, 10, 9);
  static final SpriteSheetRowSequence imgSetGoingLeft = SpriteSheetRowSequence.fromStart('game_designer.png', 64.0, 64.0, 9, 9);
  static final SpriteSheetRowSequence imgSetGoingRight = SpriteSheetRowSequence.fromStart('game_designer.png', 64.0, 64.0, 11, 9);
  static final SpriteSheetRowSequence imgSetStationary = SpriteSheetRowSequence.fromStart('game_designer.png', 64.0, 64.0, 1, 7);
}

class GameToolsDrawerRepository with ElementDrawerRepository {
  @override
  ElementDrawer getDrawer(Element element) {
    if(element.kind == gameDesignerCharacter) {
      return StatefulAnimatedImageElementDrawer(statesToImageSets: element.kind.statesToImageSets);
    }

    return null;
  }

}

ElementKind gameDesignerCharacter = StatefulObjectKind(playerCharacter, directional, statesToImageSets: {
  states.stationary: GameDesignerImageSets.imgSetStationary,
  states.movingUp: GameDesignerImageSets.imgSetGoingUp,
  states.movingDown: GameDesignerImageSets.imgSetGoingDown,
  states.movingLeft: GameDesignerImageSets.imgSetGoingLeft,
  states.movingRight: GameDesignerImageSets.imgSetGoingRight,
}, name: "Game Designer Character");