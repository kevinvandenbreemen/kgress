import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/game/tools/cupertino_game_tool.dart';
import 'example/example_game.dart';

//  Run the game editor tool
void main() {
  initExampleGame();
  runApp(CupertinoGameToolsApp());
}