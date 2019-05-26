import 'package:kevin_gamify/game/MainGame.dart';
import 'package:kevin_gamify/game/actions/element_action_set.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/controller/area_context.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';

/// Overrides to make testing the actor controller easier
class TestActorController extends ActorController {

  bool simulateCollision = false;
  bool simulateCanMove = true;

  TestActorController(Element element, ElementDrawerRepository elementDrawersRepo, GameModel gameModel, ElementActionSet actionSet) : super(element, elementDrawersRepo, gameModel, actionSet);

  @override
  bool collision(Direction direction, AreaContext context) {
    return simulateCollision;
  }

  @override
  canMove(Direction direction, AreaContext context) {
    return simulateCanMove;
  }

}