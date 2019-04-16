import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/example/example_game.dart';
import 'package:kevin_gamify/game/tools/cupertino_game_tool.dart';

//  Run the game editor tool
void main() {
  //runApp(CupertinoGameContainerApp(ExampleGameWorld()));
  runApp(CupertinoGameToolsApp(exampleGame));
}