import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/example/example_game.dart';
import 'package:kevin_gamify/example/kinds/example_kinds.dart';
import 'package:kevin_gamify/game/tools/cupertino_game_tool.dart';
import 'package:logging/logging.dart';

//  Run the game editor tool
void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName}: ${rec.time.toIso8601String()}: ${rec.message}');
  });
  //runApp(CupertinoGameContainerApp(ExampleGameWorld()));
  runApp(CupertinoGameToolsApp(
    gameCartridge: exampleGame,
    elementKinds: exampleElementKinds,
  ));
}