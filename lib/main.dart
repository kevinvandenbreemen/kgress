import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/example/world/example_game.dart';
import 'package:kevin_gamify/game/world/container/cupertino_game_container_app.dart';
import 'package:logging/logging.dart';

//  Run the game editor tool
void main() {
  Logger.root.level = Level.WARNING;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName}: ${rec.time.toIso8601String()}: ${rec.message}');
  });
  runApp(CupertinoGameContainerApp(ExampleGameWorld()));
//  runApp(CupertinoGameToolsApp(
//    gameCartridge: exampleGame,
//    elementKinds: exampleElementKinds,
//  ));
}