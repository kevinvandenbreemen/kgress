# kgress

Some code to help me make an RPG like game in a phone app.  This project is built on top of the Flame Flutter Game engine.

## IMPORTANT
This project is still very much under development.  Documentation below is not yet fully completed!

## Getting Started

### Examples
You can run the examle game by changing main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kevin_gamify/example/world/example_game_world.dart';
    import 'package:kevin_gamify/game/world/container/cupertino_game_container_app.dart';
    
    //  Run the example game
    runApp(CupertinoGameContainerApp(ExampleGameWorld()));
    
### Game Tools
KGRESS comes with tooling to allow you to preview areas in your game.  You can switch to using these tools by
updating the main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kevin_gamify/game/tools/cupertino_game_tool.dart';
    
    //  Run the game editor tool
    GameCartridge exampleGame = GameCartridge(
      areas: List.from([
        exampleArea,
        mainArea,
        trainingArea
      ]),
      elementDrawerRepo: ExampleElementDrawerRepository()
    );
    runApp(CupertinoGameToolsApp(exampleGame));
    
# Architecture
    
## Overarching Architecture
![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS.svg)

## Gameworld

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Game%20and%20World.svg)

## Elements

Elements (things on the screen in an area of the game) have element kinds, which fall under over-arching element types.

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Elements.svg)

## Imagesets
Imagesets provide canned frame sets for drawing elements on the screen.  Elements can thus be added to a scene without your needing to worry about how they will be rendered.

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Imagesets.svg)

## Game Cartridges
Relationship between the Game Cartridge and Components in a Game

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Game%20Cartridge.svg)

## Tooling
![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Tools.svg)