import 'package:kgress/game/MainGame.dart';
import 'package:kgress/game/actions/element_action_set.dart';
import 'package:kgress/game/components/Direction.dart';
import 'package:kgress/game/controller/area_context.dart';
import 'package:kgress/game/controller/element_controllers.dart';
import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/imagesets/element_drawers.dart';

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