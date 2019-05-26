import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/example/drawers/ExampleElementDrawerRepository.dart';
import 'package:kevin_gamify/example/kinds/example_kinds.dart';
import 'package:kevin_gamify/game/actions/action.dart';
import 'package:kevin_gamify/game/actions/builtin/control_actions.dart';
import 'package:kevin_gamify/game/actions/builtin/element_actions/action_move.dart';
import 'package:kevin_gamify/game/actions/builtin/events.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:kevin_gamify/game/controller/element_controllers_repository_default.dart';
import 'package:kevin_gamify/game/elements/element.dart' as elements;
import 'package:kevin_gamify/game/world/game_world.dart';

List<Action> backAndForth = [
  LabelAction("Start"),
  On(Events.collide, Goto("Back")),
  Move(Direction.right, 2),
  LabelAction("Back"),
  On(Events.collide, Goto("Start")),
  Move(Direction.left, 2),
];

class ExampleGameWorld extends StatelessWidget {

  GameSettings gameSettings = GameSettings(5);

  @override
  Widget build(BuildContext context) {

    int areaSize = 6;
    Area currentArea = Area(areaSize, "Test Area");

    elements.Element player = elements.Element(playerCharacter);
    player.locYinTiles = 1;
    player.locXinTiles = 1;
    player.layerNum = 1;

    AreaForEdit editor = AreaForEdit(currentArea);
    editor.fill(floorTile, layer: 0);
    editor.addElement(player);

    editor.add(decorativeTile, 0, 0);
    editor.add(decorativeTile, areaSize.toDouble()-1, areaSize.toDouble()-1);
    editor.add(decorativeTile, 0, areaSize.toDouble()-1);
    editor.add(decorativeTile, areaSize.toDouble()-1, 0);
    editor.add(decorativeTile, (areaSize-1)/2.0, (areaSize-1)/2.0);

    editor.add(playerCharacter, 2, 2, actionSetActions: backAndForth, layer: 1);

    return GameWorldWidget(
        DefaultElementControllersRepository(ExampleElementDrawerRepository()),
        GameSettings(5), currentArea: currentArea,
    );
  }
}