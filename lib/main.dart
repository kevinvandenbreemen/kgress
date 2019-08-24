import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kgress/example/example_game.dart';
import 'package:kgress/example/kinds/example_kinds.dart';
import 'package:kgress/game/tools/cupertino_game_tool.dart';
import 'package:logging/logging.dart';

//  Run the game editor tool
void main() {
  Logger.root.level = Level.WARNING;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName}: ${rec.time.toIso8601String()}: ${rec.message}');
  });

  //  Game Execution
  //runApp(CupertinoGameContainerApp(ExampleGameWorld()));

  //  Tooling Execution
  runApp(CupertinoGameToolsApp(
    gameCartridge: exampleGame,
    elementKinds: exampleElementKinds,
  ));
}