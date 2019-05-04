# kgress

Some code to help me make an RPG like game in a phone app.  This project is built on top of the Flame Flutter Game engine.

## IMPORTANT
This project is still very much under development.  Documentation below is not yet fully completed!

## Overarching Architecture
![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS.svg)

## Getting Started

### Examples
You can run the examle game by changing main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kevin_gamify/example/world/example_game_world.dart';
    import 'package:kevin_gamify/game/world/container/cupertino_game_container_app.dart';
    
    //  Run the example game
    void main() => runApp(CupertinoGameContainerApp(ExampleGameWorld()));
    
### Game Tools
KGRESS comes with tooling to allow you to preview areas in your game.  You can switch to using these tools by
updating the main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kevin_gamify/game/tools/cupertino_game_tool.dart';
    
    //  Run the game editor tool
    void main() => runApp(CupertinoGameToolsApp());