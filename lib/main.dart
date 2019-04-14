import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/example/world/example_game_world.dart';
import 'package:kevin_gamify/game/world/container/cupertino_game_container_app.dart';

//  Run the game editor tool
void main() {
  runApp(CupertinoGameContainerApp(ExampleGameWorld()));
}